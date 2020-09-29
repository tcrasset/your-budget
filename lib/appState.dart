import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:your_budget/models/Budget.dart';

import 'package:your_budget/models/SQLQueries.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/goal.dart';
import 'package:your_budget/models/utils.dart';

import 'models/SQLQueries.dart';
import 'models/categories.dart';

class AppState extends ChangeNotifier {
  // List<SubCategory> _subcategories = [];
  List<Payee> _payees;
  List<Account> _accounts;
  List<MoneyTransaction> _transactions;
  List<Goal> _goals;
  List<BudgetValue> _budgetValues;
  List<Budget> _budgets;

  int subcategoryCount;
  int mainCategoryCount;
  int moneyTransactionCount;
  int accountCount;
  int payeeCount;
  int goalCount;
  int budgetValueCount;

  double toBeBudgeted = 0;

  ///TODO: Put this into database
  DateTime startingBudgetDate = DateTime(2020, 8, 1);
  DateTime maxBudgetDate =
      Jiffy(getDateFromMonthStart(DateTime.now())).add(months: Constants.MAX_NB_MONTHS_AHEAD);

  DateTime currentBudgetDate;

  Budget currentBudget;

  /// An unmodifiable view of the information in the data base.
  UnmodifiableListView<Category> get allCategories {
    if (currentBudget != null) {
      return UnmodifiableListView(currentBudget.allcategories);
    }
    return UnmodifiableListView([]);
  }

  UnmodifiableListView<SubCategory> get subcategories =>
      UnmodifiableListView(currentBudget.subcategories);
  UnmodifiableListView<Payee> get payees => UnmodifiableListView(_payees);
  UnmodifiableListView<Account> get accounts => UnmodifiableListView(_accounts);
  UnmodifiableListView<MoneyTransaction> get transactions => UnmodifiableListView(_transactions);
  UnmodifiableListView<Budget> get budgets => UnmodifiableListView(_budgets);
  UnmodifiableListView<Goal> get goals => UnmodifiableListView(_goals);

  AppState() {
    // addDummyVariables();

    _loadStateFromDatabase();
  }

  void _loadStateFromDatabase() async {
    // await addDummyVariables();
    // await addDummyCategories();

    _budgets = await _createAllMonthlyBudgets(
        startingBudgetDate, Jiffy(startingBudgetDate).add(months: Constants.MAX_NB_MONTHS_AHEAD));

    _payees = await SQLQueryClass.getPayees();
    _accounts = await SQLQueryClass.getAccounts();
    // _subcategories = await SQLQueryClass.getSubCategories();
    _transactions = await SQLQueryClass.getMoneyTransactions();
    _budgetValues = await SQLQueryClass.getBudgetValues();
    _goals = await SQLQueryClass.getGoals();

    subcategoryCount = await SQLQueryClass.subcategoryCount();
    mainCategoryCount = await SQLQueryClass.categoryCount();
    accountCount = await SQLQueryClass.accountCount();
    payeeCount = await SQLQueryClass.payeeCount();
    budgetValueCount = await SQLQueryClass.budgetValuesCount();
    goalCount = await SQLQueryClass.goalCount();
    moneyTransactionCount = await SQLQueryClass.moneyTransactionCount();

    currentBudgetDate = getDateFromMonthStart(DateTime.now());
    currentBudget = _getBudgetByDate(currentBudgetDate);

    await computeToBeBudgeted();

    notifyListeners();
  }

  Future<void> addAccount(String accountName, double balance) async {
    int accountCount = await SQLQueryClass.accountCount();
    Account account = Account(accountCount + 1, accountName, balance);
    accountCount++;
    SQLQueryClass.addAccount(account);
    _accounts.add(account);

    MoneyTransaction startingBalance = MoneyTransaction(
        moneyTransactionCount + 1, 0, 0, accountCount, balance, "Starting balance", DateTime.now());
    await SQLQueryClass.addMoneyTransaction(startingBalance);
    moneyTransactionCount++;
    await computeToBeBudgeted();
    notifyListeners();
  }

  /// Adds [category] to the current [_allCategories], to [_maincategories],
  /// and to the data base.
  void addCategory(String categoryName) {
    MainCategory category = MainCategory(mainCategoryCount + 1, categoryName);
    mainCategoryCount++;

    for (final Budget budget in _budgets) {
      budget.maincategories.add(category);
    }

    notifyListeners();
    SQLQueryClass.addCategory(category);
  }

  void addPayee(Payee payee) {
    _payees.add(payee);
    notifyListeners();
    SQLQueryClass.addPayee(payee);
    payeeCount++;
  }

  /// Adds [subcategory] to the list [_subcategories],
  /// ,to the data base and update the list  [_allCategories] by
  /// extracting the subcategories of each [MainCategory] from
  /// scratch
  void addSubcategory(SubCategory subcategory) async {
    subcategoryCount++;
    // _subcategories.add(subcategory);
    for (final Budget budget in _budgets) {
      budget.addSubcategory(subcategory);
    }
    // _subcategories.add(subcategory);

    SQLQueryClass.addSubcategory(subcategory);

    /// Insert a budget value for every month from [startingBudgetDate] until [MAX_NB_MONTHS_AHEAD]
    /// after [DateTime.now()],
    /// Insert a budget value for every month until now
    for (int i = 0;
        i < Constants.MAX_NB_MONTHS_AHEAD + getMonthDifference(startingBudgetDate, DateTime.now());
        i++) {
      /// Update BudgetValues
      DateTime newDate = Jiffy(startingBudgetDate).add(months: i);
      BudgetValue budgetvalue =
          BudgetValue(budgetValueCount + 1, subcategory.id, 0, 0, newDate.year, newDate.month);
      budgetValueCount++;
      SQLQueryClass.addBudgetValue(budgetvalue);
      _budgetValues.add(budgetvalue);
    }
    notifyListeners();
  }

  void addSubcategoryByName(String subcategoryName, int maincategoryId) {
    addSubcategory(SubCategory(
        subcategoryCount + 1, //
        maincategoryId,
        subcategoryName,
        0.00,
        0.00));
  }

  /// Add the [transaction] to the [_transactions] list, persist it to
  /// the database and add the transaction amount to the corresponding subcategory.
  /// Finally, update the fields of the [MainCategory] which contains the
  /// subcategory.
  void addTransaction(MoneyTransaction transaction) {
    // Add transaction to the state, to the database and update the count
    _transactions.add(transaction);
    SQLQueryClass.addMoneyTransaction(transaction);
    moneyTransactionCount++;

    /// If we do a MoneyTransaction between accounts (subcat.ID == -1)
    /// subcategories are not affected.
    if (transaction.subcatID != -1) {
      // Update balance of the account
      final Account account =
          accounts.singleWhere((account) => account.id == transaction.accountID);
      account.balance += transaction.amount;

      Budget budget = _getBudgetByDate(DateTime(transaction.date.year, transaction.date.month));
      SubCategory oldSubcat =
          budget.subcategories.singleWhere((subcat) => subcat.id == transaction.subcatID);

      double newAvailableAmount = oldSubcat.available + transaction.amount;
      SubCategory newSubcat = SubCategory(
          oldSubcat.id, oldSubcat.parentId, oldSubcat.name, oldSubcat.budgeted, newAvailableAmount);

      updateSubcategory(newSubcat);
    } else {
      // If the transaction amount is positive, the transaction will remove money from
      // outAccount and input it into inAccount.
      // Otherwise, it is reversed.
      final Account outAccount =
          accounts.singleWhere((account) => account.id == transaction.accountID);
      outAccount.balance -= transaction.amount;

      final Account inAccount =
          accounts.singleWhere((account) => account.id == -transaction.payeeID);
      inAccount.balance += transaction.amount;
      //TODO: Add notifyListeners() ????
    }
    //notifyListeners is called in updateSubcategory
  }

  void addGoal(GoalType goalType, int subcategoryId, double amount, DateTime date) {
    Goal newGoal;
    if (goalType == GoalType.TargetAmountByDate) {
      newGoal = Goal(goalCount + 1, subcategoryId, goalType, amount, date.month, date.year);
    } else {
      ///Use the current budget date, as there is no end date for the other types of goal
      newGoal = Goal(
          goalCount + 1, subcategoryId, goalType, amount, currentBudget.month, currentBudget.year);
    }

    goalCount++;
    _goals.add(newGoal);
    SQLQueryClass.addGoal(newGoal);
    notifyListeners();
  }

  /// Update all the fields of [modifiedSubcategory]
  /// in both the state and in the data base.
  void updateSubcategory(SubCategory modifiedSubcategory) async {
    SubCategory previousSubcategory =
        currentBudget.subcategories.singleWhere((subcat) => subcat.id == modifiedSubcategory.id);

    /// Differentiate between name change, where we only modify
    /// [SubCategory] and the budgeted/available change,
    /// where we modify the [BudgetValue] and the [SubCategory].
    if (previousSubcategory.name != modifiedSubcategory.name) {
      /// Persist the change in the DataBase
      SQLQueryClass.updateSubcategory(modifiedSubcategory);

      /// Change state objects
      for (Budget budget in _budgets) {
        budget.makeCategoryChange(modifiedSubcategory);
      }
    } else {
      /// Change state objects
      currentBudget.makeCategoryChange(modifiedSubcategory);

      BudgetValue correspondingBudgetValue = _budgetValues.singleWhere((budgetValue) =>
          (budgetValue.subcategoryId == modifiedSubcategory.id) &&
          (budgetValue.year == currentBudget.year) &&
          (budgetValue.month == currentBudget.month));
      correspondingBudgetValue.budgeted = modifiedSubcategory.budgeted;
      correspondingBudgetValue.available = modifiedSubcategory.available;

      /// Persist the change in the DataBase
      SQLQueryClass.updateBudgetValue(correspondingBudgetValue);

      /// Change the available field in every Budget after the one that was
      /// modified.
      int monthDifference = (getMonthDifference(currentBudgetDate, maxBudgetDate)).abs();
      double lastMonthAvailable = modifiedSubcategory.available;

      for (int i = 1; i < monthDifference; i++) {
        /// Modify the BudgetValue in the state
        DateTime newDate = Jiffy(currentBudgetDate).add(months: i);
        correspondingBudgetValue = _budgetValues.singleWhere((budgetValue) =>
            (budgetValue.subcategoryId == modifiedSubcategory.id) &&
            (budgetValue.year == newDate.year) &&
            (budgetValue.month == newDate.month));
        // Combine the total available money from month to month
        correspondingBudgetValue.available = lastMonthAvailable + correspondingBudgetValue.budgeted;

        /// Persist the change in the DataBase
        SQLQueryClass.updateBudgetValue(correspondingBudgetValue);

        // Modify the subcategory in each budget
        Budget budget = budgets.singleWhere(
            (budget) => (budget.year == newDate.year) && (budget.month == newDate.month));
        budget.makeSubcategoryChangeBySubcatId(
            modifiedSubcategory.id, //
            modifiedSubcategory.parentId,
            "available",
            correspondingBudgetValue.available.toString());

        lastMonthAvailable = correspondingBudgetValue.available;
      }

      await computeToBeBudgeted();
    }

    notifyListeners();
  }

  void removeSubcategory(int subcategoryId) {
    // Take any subcategory of the same id, to be able to access the parentID field
    SubCategory toBeRemoved =
        currentBudget.subcategories.singleWhere((subcat) => subcat.id == subcategoryId);

    //Remove subcategories from the budgets and from the database
    _budgets.forEach((budget) {
      budget.removeSubcategory(toBeRemoved);
    });
    SQLQueryClass.deleteSubcategory(subcategoryId);

    // Remove the budget values linked to the subcategory from the
    // _budgetValues array and from the data base
    List<BudgetValue> correspondingBudgetValues =
        _budgetValues.where((budgetvalue) => budgetvalue.subcategoryId == subcategoryId).toList();

    correspondingBudgetValues.forEach((budgetvalue) {
      SQLQueryClass.deleteBudgetValue(budgetvalue.id);
    });
    _budgetValues.removeWhere((budgetvalue) => budgetvalue.subcategoryId == subcategoryId);

    notifyListeners();
  }

  /// Update the name of the [MainCategory] pointed to
  /// by [modifiedCategory.id] to [modifiedCategory.name]
  void updateCategoryName(MainCategory modifiedCategory) {
    //Change in all budgets
    for (Budget budget in _budgets) {
      MainCategory cat = budget.maincategories.singleWhere((cat) => cat.id == modifiedCategory.id);
      cat.name = modifiedCategory.name;
    }
    notifyListeners();

    // Persist it in memory
    SQLQueryClass.updateCategory(modifiedCategory);
  }

  Future<void> computeToBeBudgeted() async {
    toBeBudgeted = 0;
    for (final Account account in _accounts) {
      MoneyTransaction firstTransaction =
          await SQLQueryClass.getFirstTransactionOfAccount(account.id);
      toBeBudgeted += firstTransaction.amount;
    }
    DateTime prevDate = startingBudgetDate;
    DateTime nextDate = startingBudgetDate;
    do {
      prevDate = nextDate;
      Budget budget = _getBudgetByDate(prevDate);
      toBeBudgeted -= budget.totalBudgeted;
      //Go to next month
      nextDate = Jiffy(nextDate).add(months: 1);
    } while (currentBudgetDate.isAfter(prevDate));
  }

  void incrementMonth() async {
    if (currentBudgetDate.isBefore(Jiffy(maxBudgetDate).subtract(months: 1))) {
      currentBudgetDate = Jiffy(currentBudgetDate).add(months: 1);
      currentBudget = _getBudgetByDate(currentBudgetDate);
      await computeToBeBudgeted();
      notifyListeners();
    }
  }

  void printDate(DateTime date) {
    print("[${date.month}/${date.year}]");
  }

  void decrementMonth() async {
    if (currentBudgetDate.isAfter(startingBudgetDate)) {
      currentBudgetDate = Jiffy(currentBudgetDate).subtract(months: 1);
      currentBudget = _getBudgetByDate(currentBudgetDate);
      await computeToBeBudgeted();
      notifyListeners();
    }
  }

  double computeAverageBudgeted(int subcategoryId) {
    double totalBudgeted = 0;
    int nbNonZero = 0;
    _budgets.forEach((budget) {
      SubCategory subcat = budget.subcategories.singleWhere((subcat) => subcat.id == subcategoryId);
      if (subcat.budgeted != 0.00) {
        nbNonZero++;
      }
      totalBudgeted += subcat.budgeted;
    });

    if (nbNonZero == 0) return 0.00;
    return totalBudgeted / nbNonZero;
  }

  double getLastMonthBudgeted(int subcategoryId) {
    DateTime lastMonthDate = Jiffy(currentBudgetDate).subtract(months: 1);
    Budget lastMonthBudget = _budgets.singleWhere(
        (budget) => budget.year == lastMonthDate.year && budget.month == lastMonthDate.month,
        orElse: () => null);

    if (lastMonthBudget == null) {
      return 0.00;
    }

    SubCategory lastMonthSubcat =
        lastMonthBudget.subcategories.singleWhere((subcat) => subcat.id == subcategoryId);

    return lastMonthSubcat.budgeted;
  }

  Future<List<Budget>> _createAllMonthlyBudgets(DateTime startDate, DateTime endDate) async {
    assert(startDate.isBefore(endDate));

    List<Budget> budgets = [];
    DateTime prevDate = startDate;
    List<MainCategory> maincategories = await SQLQueryClass.getCategories();

    // Start with 1 month's difference and keep incrementing
    // until we overshoot the endDate
    do {
      List<SubCategory> subcategories =
          await SQLQueryClass.getSubCategoriesJoined(prevDate.year, prevDate.month);
      budgets.add(Budget(maincategories, subcategories, prevDate.month, prevDate.year));

      //Go to next month
      prevDate = Jiffy(prevDate).add(months: 1);
    } while (prevDate.isBefore(endDate));
    return budgets;
  }

  Budget _getBudgetByDate(DateTime date) {
    return _budgets.singleWhere((budget) => budget.year == date.year && budget.month == date.month);
  }

  void deleteTransaction(int transactionId) {
    _transactions.removeWhere((transaction) => transaction.id == transactionId);

    SQLQueryClass.deleteTransaction(transactionId);
    notifyListeners();
  }

  // void addSubcategoriesToBudgetValues() async {
  //   int id = await SQLQueryClass.budgetValuesCount() + 1;
  //   for (final int month in [8, 9, 10, 11, 12]) {
  //     for (final SubCategory subcat in _subcategories) {
  //       BudgetValue budgetvalue = BudgetValue(id, subcat.id, subcat.budgeted, subcat.available,
  //           DateTime(2020, month, 1, 0, 0, 0, 0, 0));
  //       id++;
  //       await SQLQueryClass.addBudgetValue(budgetvalue);
  //     }
  //   }
  // }
}
