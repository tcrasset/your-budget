import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:your_budget/models/Budget.dart';

import 'package:your_budget/models/SQLQueries.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/entries_model.dart';
import 'package:your_budget/models/goal.dart';
import 'package:your_budget/models/goal_model.dart';
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

  double toBeBudgeted = 0;

  DateTime startingBudgetDate;
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
    _loadStateFromDatabase();
  }

  void _loadStateFromDatabase() async {
    print("Loading from database");
    startingBudgetDate = await SQLQueryClass.getStartingBudgetDateConstant();

    _transactions = await SQLQueryClass.getMoneyTransactions();
    _budgets = await _createAllMonthlyBudgets();

    _payees = await SQLQueryClass.getPayees();
    _accounts = await SQLQueryClass.getAccounts();

    _budgetValues = await SQLQueryClass.getBudgetValues();
    _goals = await SQLQueryClass.getGoals();

    currentBudgetDate = getDateFromMonthStart(DateTime.now());
    currentBudget = _getBudgetByDate(currentBudgetDate);

    await computeToBeBudgeted();

    notifyListeners();
  }

  Future<void> addAccount(String accountName, double balance) async {
    AccountModel accountModel = AccountModel(name: accountName, balance: balance);
    int accountId = await SQLQueryClass.addAccount(accountModel);
    Account account = Account(accountId, accountName, balance);
    _accounts.add(account);

    MoneyTransactionModel moneyTransactionModel = MoneyTransactionModel(
      subcatID: Constants.UNASSIGNED_SUBCAT_ID,
      payeeID: Constants.UNASSIGNED_PAYEE_ID,
      accountID: accountId,
      amount: balance,
      memo: "Starting balance",
      date: DateTime.now(),
    );

    int moneyTransactionId = await SQLQueryClass.addMoneyTransaction(moneyTransactionModel);
    MoneyTransaction startingBalance = MoneyTransaction(
      id: moneyTransactionId,
      subcatID: moneyTransactionModel.subcatID,
      payeeID: moneyTransactionModel.payeeID,
      accountID: moneyTransactionModel.accountID,
      amount: moneyTransactionModel.amount,
      memo: moneyTransactionModel.memo,
      date: moneyTransactionModel.date,
    );

    _transactions.add(startingBalance);
    await computeToBeBudgeted();
    notifyListeners();
  }

  /// Adds [category] to the current [_allCategories], to [_maincategories],
  /// and to the data base.
  void addCategory(String categoryName) async {
    MainCategoryModel categoryModel = MainCategoryModel(name: categoryName);
    int categoryId = await SQLQueryClass.addCategory(categoryModel);
    MainCategory cat = MainCategory(categoryId, categoryName);
    for (final Budget budget in _budgets) {
      budget.maincategories.add(cat);
    }
    notifyListeners();
  }

  Future<Payee> addPayee({@required String payeeName}) async {
    PayeeModel payeeModel = PayeeModel(name: payeeName);
    int payeeId = await SQLQueryClass.addPayee(payeeModel);
    Payee payee = Payee(payeeId, payeeName);
    _payees.add(payee);
    notifyListeners();
    return payee;
  }

  /// Adds [subcategory] to the list [_subcategories],
  /// ,to the data base and update the list  [_allCategories] by
  /// extracting the subcategories of each [MainCategory] from
  /// scratch
  void addSubcategory(SubCategoryModel subcategoryModel) async {
    int subcatId = await SQLQueryClass.addSubcategory(subcategoryModel);
    SubCategory subcategory = SubCategory(
      subcatId,
      subcategoryModel.parentId,
      subcategoryModel.name,
      subcategoryModel.budgeted,
      subcategoryModel.available,
    );

    for (final Budget budget in _budgets) {
      budget.addSubcategory(subcategory);
    }

    /// Insert a budget value for every month from [startingBudgetDate] until [MAX_NB_MONTHS_AHEAD]
    /// after [DateTime.now()],
    for (int i = 0;
        i < Constants.MAX_NB_MONTHS_AHEAD + getMonthDifference(startingBudgetDate, DateTime.now());
        i++) {
      /// Update BudgetValues
      DateTime newDate = Jiffy(startingBudgetDate).add(months: i);

      BudgetValueModel budgetValueModel = BudgetValueModel(
        subcategoryId: subcatId,
        budgeted: 0,
        available: 0,
        year: newDate.year,
        month: newDate.month,
      );

      int budgetId = await SQLQueryClass.addBudgetValue(budgetValueModel);
      BudgetValue budgetValue =
          BudgetValue(budgetId, subcategory.id, 0, 0, newDate.year, newDate.month);

      _budgetValues.add(budgetValue);
    }
    notifyListeners();
  }

  void addSubcategoryByName(String subcategoryName, int maincategoryId) {
    addSubcategory(SubCategoryModel(
      parentId: maincategoryId,
      name: subcategoryName,
      budgeted: 0.00,
      available: 0.00,
    ));
  }

  /// Add the [transaction] to the [_transactions] list, persist it to
  /// the database and add the transaction amount to the corresponding subcategory.
  /// Finally, update the fields of the [MainCategory] which contains the
  /// subcategory.
  Future<void> addTransaction({
    int subcatId,
    int payeeId,
    int accountId,
    double amount,
    String memo,
    DateTime date,
  }) async {
    // Add transaction to the state, to the database and update the count

    MoneyTransactionModel moneyTransactionModel = MoneyTransactionModel(
      subcatID: subcatId,
      payeeID: payeeId,
      accountID: accountId,
      amount: amount,
      memo: memo,
      date: date,
    );

    int moneyTransactionId = await SQLQueryClass.addMoneyTransaction(moneyTransactionModel);

    MoneyTransaction transaction = MoneyTransaction(
      id: moneyTransactionId,
      subcatID: moneyTransactionModel.subcatID,
      payeeID: moneyTransactionModel.payeeID,
      accountID: moneyTransactionModel.accountID,
      amount: moneyTransactionModel.amount,
      memo: moneyTransactionModel.memo,
      date: moneyTransactionModel.date,
    );
    _transactions.add(transaction);

    if (transaction.subcatID == Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION) {
      print("Is to be budgeted money transaction");
      // Update balance of the account
      final Account account =
          accounts.singleWhere((account) => account.id == transaction.accountID);
      account.balance += transaction.amount;
      SQLQueryClass.updateAccount(account);
      await computeToBeBudgeted();
      notifyListeners();
    } else if (transaction.subcatID == Constants.UNASSIGNED_SUBCAT_ID) {
      // If the transaction amount is positive, the transaction will remove money from
      // outAccount and input it into inAccount.
      // Otherwise, it is reversed.
      final Account outAccount =
          accounts.singleWhere((account) => account.id == transaction.accountID);
      outAccount.balance -= transaction.amount;

      final Account inAccount =
          accounts.singleWhere((account) => account.id == -transaction.payeeID);
      inAccount.balance += transaction.amount;
      SQLQueryClass.updateAccount(outAccount);
      SQLQueryClass.updateAccount(inAccount);
      notifyListeners();
      //TODO: Add notifyListeners() ????
    } else {
      /// If we do a MoneyTransaction between accounts (subcat.ID == UNASSIGNED_SUBCAT_ID)
      /// subcategories are not affected.

      // Update balance of the account
      final Account account =
          accounts.singleWhere((account) => account.id == transaction.accountID);
      account.balance += transaction.amount;
      SQLQueryClass.updateAccount(account);

      Budget budget = _getBudgetByDate(DateTime(transaction.date.year, transaction.date.month));
      SubCategory oldSubcat =
          budget.subcategories.singleWhere((subcat) => subcat.id == transaction.subcatID);

      double newAvailableAmount = oldSubcat.available + transaction.amount;
      SubCategory newSubcat = SubCategory(
          oldSubcat.id, oldSubcat.parentId, oldSubcat.name, oldSubcat.budgeted, newAvailableAmount);

      updateSubcategory(newSubcat);
      //notifyListeners is called in updateSubcategory
    }
  }

  Future<void> addGoal({
    @required GoalType goalType,
    @required int subcategoryId,
    @required double amount,
    @required DateTime date,
  }) async {
    GoalModel goalModel = GoalModel(
        correspondingSubcategoryId: subcategoryId,
        goalType: goalType,
        amount: amount,
        month: date.month,
        year: date.year);

    int goalId = await SQLQueryClass.addGoal(goalModel);

    Goal newGoal;
    if (goalType == GoalType.TargetAmountByDate) {
      newGoal = Goal(goalId, subcategoryId, goalType, amount, date.month, date.year);
    } else {
      ///Use the current budget date, as there is no end date for the other types of goal
      newGoal =
          Goal(goalId, subcategoryId, goalType, amount, currentBudget.month, currentBudget.year);
    }
    _goals.add(newGoal);
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

      BudgetValue correspondingBudgetValue = _getCorrespondingBudgetValue(modifiedSubcategory);

      /// Persist the change in the DataBase
      SQLQueryClass.updateBudgetValue(correspondingBudgetValue);

      /// Change the available field in every Budget after the one that was
      /// modified.
      int monthDifference = (getMonthDifference(currentBudgetDate, getMaxBudgetDate())).abs();
      double lastMonthAvailable = modifiedSubcategory.available;

      for (int i = 1; i <= monthDifference; i++) {
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

  BudgetValue _getCorrespondingBudgetValue(SubCategory modifiedSubcategory) {
    BudgetValue correspondingBudgetValue = _budgetValues.singleWhere(
      (budgetValue) =>
          (budgetValue.subcategoryId == modifiedSubcategory.id) &&
          (budgetValue.year == currentBudget.year) &&
          (budgetValue.month == currentBudget.month),
    );
    correspondingBudgetValue.budgeted = modifiedSubcategory.budgeted;
    correspondingBudgetValue.available = modifiedSubcategory.available;
    return correspondingBudgetValue;
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

    // Sum up starting total for every account
    for (final Account account in _accounts) {
      MoneyTransaction firstTransaction =
          await SQLQueryClass.getFirstTransactionOfAccount(account.id);
      toBeBudgeted += firstTransaction.amount;
    }

    // Remove total budgeted of each month
    DateTime prevDate = startingBudgetDate;
    DateTime nextDate = startingBudgetDate;

    do {
      prevDate = nextDate;
      Budget budget = _getBudgetByDate(prevDate);
      toBeBudgeted -= budget.totalBudgeted;
      toBeBudgeted += budget.toBeBudgetedInputFromMoneyTransactions;
      //Go to next month
      nextDate = Jiffy(nextDate).add(months: 1);
    } while (currentBudgetDate.isAfter(prevDate));
  }

  void incrementMonth() async {
    if (currentBudgetDate.isBefore(getMaxBudgetDate())) {
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

  Future<List<Budget>> _createAllMonthlyBudgets() async {
    List<Budget> budgets = [];
    DateTime currentDate = startingBudgetDate;
    List<MainCategory> maincategories = await SQLQueryClass.getCategories();
    DateTime storedMaxBudgetDate = await SQLQueryClass.getMaxBudgetDateConstant();
    // Start with 1 month's difference and keep incrementing
    // until we overshoot the endDate

    // Get every transaction made into 'To Be Budgeted'
    List<MoneyTransaction> toBeBudgetedTransactions = _transactions
        .where((transaction) =>
            transaction.subcatID == Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION)
        .toList();

    do {
      List<SubCategory> subcategories =
          await SQLQueryClass.getSubCategoriesJoined(currentDate.year, currentDate.month);
      Budget budget = Budget(maincategories, subcategories, currentDate.month, currentDate.year);

      double positiveAmountTransferedIntoToBeBudgeted = toBeBudgetedTransactions
          .where((transaction) => isSameMonth(transaction.date, currentDate))
          .fold(0, (total, transaction) => total + transaction.amount);

      budget.toBeBudgetedInputFromMoneyTransactions += positiveAmountTransferedIntoToBeBudgeted;
      budgets.add(budget);

      //Go to next month
      currentDate = Jiffy(currentDate).add(months: 1);
    } while (currentDate.isBefore(Jiffy(storedMaxBudgetDate).add(months: 1)));

    print("Creating budgets");
    if (await _checkIfNeedToIncrementMax()) {
      budgets = await _incrementMaxBudgetAndUpdateBudgets(budgets);
    }
    return budgets;
  }

  Budget _getBudgetByDate(DateTime date) {
    return _budgets.singleWhere((budget) => budget.year == date.year && budget.month == date.month);
  }

  void deleteTransaction(int transactionId) async {
    MoneyTransaction transaction = _transactions
        .singleWhere((transaction) => transaction.id == transactionId);

    if (transaction.subcatID ==
        Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION) {
      print("Is to be budgeted money transaction");
      // Update balance of the account
      final Account account = accounts
          .singleWhere((account) => account.id == transaction.accountID);
      account.balance -= transaction.amount;
      await SQLQueryClass.updateAccount(account);

      Budget budget = _budgets
          .singleWhere((budget) => isSameMonth(budget.date, transaction.date));
      budget.toBeBudgetedInputFromMoneyTransactions -= transaction.amount;

      await computeToBeBudgeted();
      notifyListeners();
    } else if (transaction.subcatID == Constants.UNASSIGNED_SUBCAT_ID) {
      /// If we do a MoneyTransaction between accounts (subcat.ID == UNASSIGNED_SUBCAT_ID)
      /// subcategories are not affected.
      final Account outAccount = accounts
          .singleWhere((account) => account.id == transaction.accountID);
      outAccount.balance += transaction.amount;

      final Account inAccount =
          accounts.singleWhere((account) => account.id == -transaction.payeeID);
      inAccount.balance -= transaction.amount;
      SQLQueryClass.updateAccount(outAccount);
      SQLQueryClass.updateAccount(inAccount);
      notifyListeners();
      //TODO: Add notifyListeners() ????
    } else {
      final Account account = accounts
          .singleWhere((account) => account.id == transaction.accountID);
      account.balance -= transaction.amount;
      SQLQueryClass.updateAccount(account);

      Budget budget = _getBudgetByDate(
          DateTime(transaction.date.year, transaction.date.month));
      SubCategory oldSubcat = budget.subcategories
          .singleWhere((subcat) => subcat.id == transaction.subcatID);

      double newAvailableAmount = oldSubcat.available - transaction.amount;
      SubCategory newSubcat = SubCategory(oldSubcat.id, oldSubcat.parentId,
          oldSubcat.name, oldSubcat.budgeted, newAvailableAmount);

      updateSubcategory(newSubcat);
      //notifyListeners is called in updateSubcategory
    }

    SQLQueryClass.deleteTransaction(transactionId);
    _transactions.remove(transaction);
    notifyListeners();
  }

  void removeCategory(int categoryId) {
    MainCategory toBeRemoved =
        currentBudget.maincategories.singleWhere((cat) => cat.id == categoryId);

    List<SubCategory> correspondingSubcategories =
        subcategories.where((subcat) => subcat.parentId == categoryId).toList();

    //Remove categories from the budgets and from the database
    _budgets.forEach((budget) {
      budget.removeCategory(toBeRemoved);
    });
    SQLQueryClass.deleteCategory(toBeRemoved.id);
    for (SubCategory subcat in correspondingSubcategories) {
      SQLQueryClass.deleteSubcategory(subcat.id);
      _deleteCorrespondingBudgetValues(subcat.id);
    }
    computeToBeBudgeted();
    notifyListeners();
  }

  void _deleteCorrespondingBudgetValues(int subcategoryId) {
    // Remove the budget values linked to the subcategory from the
    // _budgetValues array and from the data base
    List<BudgetValue> correspondingBudgetValues =
        _budgetValues.where((budgetvalue) => budgetvalue.subcategoryId == subcategoryId).toList();

    correspondingBudgetValues.forEach((budgetvalue) {
      SQLQueryClass.deleteBudgetValue(budgetvalue.id);
    });
    _budgetValues.removeWhere((budgetvalue) => budgetvalue.subcategoryId == subcategoryId);
  }

  Future<List<Budget>> _incrementMaxBudgetAndUpdateBudgets(List<Budget> budgets) async {
    DateTime newDate;
    DateTime previousDate = await SQLQueryClass.getMaxBudgetDateConstant();
    DateTime maxBudgetDate = getMaxBudgetDate();

    Budget currentMaxBudget = budgets.singleWhere(
      (budget) => budget.year == previousDate.year && budget.month == previousDate.month,
    );

    budgets.forEach((element) {
      print(element);
    });

    do {
      newDate = Jiffy(previousDate).add(months: 1);

      currentMaxBudget = budgets.singleWhere(
        (budget) => budget.year == previousDate.year && budget.month == previousDate.month,
      );
      previousDate = newDate;

      // Add all BudgetValue for the new month to the database
      // print(currentMaxBudget.subcategories);
      for (final SubCategory previousMonthSubcat in currentMaxBudget.subcategories) {
        BudgetValueModel budgetValueModel = BudgetValueModel(
          subcategoryId: previousMonthSubcat.id,
          budgeted: 0,
          available: previousMonthSubcat.available,
          year: newDate.year,
          month: newDate.month,
        );

        await SQLQueryClass.addBudgetValue(budgetValueModel);
      }

      // Fetch the newly added BudgetValues and create a new budget, adding it to the
      // already existing list of budgets
      List<SubCategory> updatedSubcategories =
          await SQLQueryClass.getSubCategoriesJoined(newDate.year, newDate.month);

      Budget newBudget = Budget(
          currentMaxBudget.maincategories, updatedSubcategories, newDate.month, newDate.year);
      currentMaxBudget = newBudget;
      budgets.add(newBudget);
    } while (newDate.isBefore(maxBudgetDate));

    //Update max budget date constant
    await SQLQueryClass.setMaxBudgetDateConstant(maxBudgetDate);

    return budgets;
  }

  Future<bool> _checkIfNeedToIncrementMax() async {
    int nbMonthDifference = await _getNbMonthDifferenceBetweenCurrentAndStoredMaxBudgetDate();
    return nbMonthDifference > 0;
  }

  Future<int> _getNbMonthDifferenceBetweenCurrentAndStoredMaxBudgetDate() async {
    DateTime currentMaxBudgetDate = getMaxBudgetDate();
    DateTime storedMaxBudgetDate = await SQLQueryClass.getMaxBudgetDateConstant();
    return getMonthDifference(currentMaxBudgetDate, storedMaxBudgetDate);
  }
}
