import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mybudget/models/Budget.dart';

import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';
import 'package:mybudget/screens/budget/components/SubCategoryRow.dart';

import 'models/SQLQueries.dart';
import 'models/categories.dart';
import 'models/categories.dart';
import 'models/categories.dart';

class AppState extends ChangeNotifier {
  List<Category> _allCategories = [];
  List<SubCategory> _subcategories = [];
  List<Payee> _payees;
  List<Account> _accounts;
  List<MoneyTransaction> _transactions;
  List<BudgetValue> _budgetValues;
  List<Budget> _budgets;

  int subcategoryCount;
  int mainCategoryCount;
  int moneyTransactionCount;
  int accountCount;
  int payeeCount;
  int budgetValueCount;

  double toBeBudgeted = 0;

  DateTime startingBudgetDate = DateTime(2020, 7);
  DateTime currentBudgetDate;
  String budgetMonth;

  Budget currentBudget;

  /// An unmodifiable view of the information in the data base.
  UnmodifiableListView<Category> get allCategories => UnmodifiableListView(_allCategories);
  UnmodifiableListView<SubCategory> get subcategories =>
      UnmodifiableListView(currentBudget.subcategories);
  UnmodifiableListView<Payee> get payees => UnmodifiableListView(_payees);
  UnmodifiableListView<Account> get accounts => UnmodifiableListView(_accounts);
  UnmodifiableListView<MoneyTransaction> get transactions => UnmodifiableListView(_transactions);
  UnmodifiableListView<Budget> get budgets => UnmodifiableListView(_budgets);

  AppState() {
    // addDummyVariables();

    _loadStateFromDatabase();
  }

  void _loadStateFromDatabase() async {
    // await addDummyVariables();
    // await addDummyCategories();
    _budgets = await _createAllMonthlyBudgets(
        DateTime(2020, 7, 1, 0, 0, 0), DateTime(2021, 7, 1, 0, 0, 0));

    _payees = await SQLQueryClass.getPayees();
    _accounts = await SQLQueryClass.getAccounts();
    _subcategories = await SQLQueryClass.getSubCategories();
    _transactions = await SQLQueryClass.getMoneyTransactions();
    _budgetValues = await SQLQueryClass.getBudgetValues();

    subcategoryCount = await SQLQueryClass.subcategoryCount();
    mainCategoryCount = await SQLQueryClass.categoryCount();
    accountCount = await SQLQueryClass.accountCount();
    payeeCount = await SQLQueryClass.payeeCount();
    budgetValueCount = await SQLQueryClass.budgetValuesCount();
    moneyTransactionCount = await SQLQueryClass.moneyTransactionCount();

    // notifyListeners();
    DateTime nowDate = DateTime.now();
    currentBudgetDate = DateTime(nowDate.year, nowDate.month, 1, 0, 0, 0, 0, 0);
    budgetMonth = monthStringFromDate(currentBudgetDate);
    currentBudget = _getBudgetByDate(currentBudgetDate);
    _allCategories = currentBudget.allcategories;

    computeToBeBudgeted();

    notifyListeners();
  }

  Future<void> addAccount(String accountName, double startingBalance) async {
    int accountCount = await SQLQueryClass.accountCount();
    Account account = Account(accountCount + 2, accountName, startingBalance);
    SQLQueryClass.addAccount(account);
    _accounts.add(account);
    computeToBeBudgeted();
    notifyListeners();
    print("Added account $account");
  }

  /// Adds [category] to the current [_allCategories], to [_maincategories],
  /// and to the data base.
  void addCategory(String categoryName) {
    mainCategoryCount++;
    // + 1 because we do not want to have an ID of 0
    MainCategory category = MainCategory(mainCategoryCount + 1, categoryName);

    for (final Budget budget in _budgets) {
      budget.maincategories.add(category);
    }

    _allCategories = currentBudget.allcategories;
    notifyListeners();
    SQLQueryClass.addCategory(category);
  }

  void addPayee(Payee payee) {
    payeeCount++;
    _payees.add(payee);
    SQLQueryClass.addPayee(payee);
    notifyListeners();
  }

  /// Adds [subcategory] to the list [_subcategories],
  /// ,to the data base and update the list  [_allCategories] by
  /// extracting the subcategories of each [MainCategory] from
  /// scratch
  void addSubcategory(SubCategory subcategory) {
    //TODO: AddSubcategory
    subcategoryCount++;
    budgetValueCount++;
    _subcategories.add(subcategory);
    for (final Budget budget in _budgets) {
      budget.addSubcategory(subcategory);
    }
    _subcategories.add(subcategory);
    _allCategories = currentBudget.allcategories;
    notifyListeners();

    SQLQueryClass.addSubcategory(subcategory);
    DateTime currentDate = DateTime.now();
    SQLQueryClass.addBudgetValue(BudgetValue(
        budgetValueCount + 2,
        subcategory.id,
        subcategory.budgeted,
        subcategory.available,
        DateTime(currentDate.year, currentDate.month)));
  }

  void addSubcategoryByName(String subcategoryName, int maincategoryId) {
    addSubcategory(SubCategory(
        subcategoryCount + 2, //
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
      Budget budget = _getBudgetByDate(DateTime(transaction.date.year, transaction.date.month));
      SubCategory oldSubcat =
          budget.subcategories.singleWhere((subcat) => subcat.id == transaction.subcatID);

      double newAvailableAmount = oldSubcat.available + transaction.amount;
      SubCategory newSubcat = SubCategory(
          oldSubcat.id, oldSubcat.parentId, oldSubcat.name, oldSubcat.budgeted, newAvailableAmount);

      updateSubcategory(newSubcat);
    }
    //notifyListeners is called in updateSubcategory
  }

  /// Update all the fields of [modifiedSubcategory]
  /// in both the state and in the data base.
  /// Then, modify the total budgeted and available
  /// amounts of the corresponding [MainCategory]
  void updateSubcategory(SubCategory modifiedSubcategory) {
    // print(currentBudget.month);
    SubCategory previousSubcategory =
        currentBudget.subcategories.singleWhere((subcat) => subcat.id == modifiedSubcategory.id);

    /// Differentiate between name change, where we only modify
    /// [SubCategory] and the budgeted/available change,
    /// where we modify the [BudgetValue].
    if (previousSubcategory.name != modifiedSubcategory.name) {
      /// Persist the change in the DataBase
      SQLQueryClass.updateSubcategory(modifiedSubcategory);

      /// Change state objects
      for (Budget budget in _budgets) {
        SubCategory subcat =
            budget.subcategories.singleWhere((subcat) => subcat.id == modifiedSubcategory.id);
        subcat.name = modifiedSubcategory.name;
      }
    } else {
      /// Change state objects
      currentBudget.makeCategoryChange(modifiedSubcategory);
      computeToBeBudgeted();

      /// Persist the change in the DataBase
      BudgetValue correspondingBudgetValue = _budgetValues.singleWhere((budgetValue) =>
          (budgetValue.subcategoryId == modifiedSubcategory.id) &&
          (budgetValue.date.year == currentBudget.year) &&
          (budgetValue.date.month == currentBudget.month));
      // print(correspondingBudgetValue);
      correspondingBudgetValue.budgeted = modifiedSubcategory.budgeted;
      correspondingBudgetValue.available = modifiedSubcategory.available;
      SQLQueryClass.updateBudgetValue(correspondingBudgetValue);
    }

    _allCategories = currentBudget.allcategories;
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

  // void updateToBeBudgeted(beforeAfterDifference) {
  //   toBeBudgeted -= beforeAfterDifference;
  //   notifyListeners();
  // }

  void computeToBeBudgeted() {
    toBeBudgeted = 0;
    for (final Account account in _accounts) {
      toBeBudgeted += account.balance;
    }
    DateTime prevDate = startingBudgetDate;
    DateTime nextDate = startingBudgetDate;
    do {
      prevDate = nextDate;
      Budget monthlyBudget = _getBudgetByDate(prevDate);
      toBeBudgeted -= monthlyBudget.totalBudgeted;
      //Go to next month
      nextDate = Jiffy(nextDate).add(months: 1);
    } while (currentBudgetDate.isAfter(prevDate));
  }

  void incrementMonth() {
    currentBudgetDate = Jiffy(currentBudgetDate).add(months: 1);
    budgetMonth = monthStringFromDate(currentBudgetDate);
    currentBudget = _getBudgetByDate(currentBudgetDate);
    _allCategories = currentBudget.allcategories;
    computeToBeBudgeted();
    notifyListeners();
  }

  void printDate(DateTime date) {
    print("[${date.month}/${date.year}]");
  }

  void decrementMonth() {
    currentBudgetDate = Jiffy(currentBudgetDate).subtract(months: 1);
    budgetMonth = monthStringFromDate(currentBudgetDate);
    currentBudget = _getBudgetByDate(currentBudgetDate);
    _allCategories = currentBudget.allcategories;
    computeToBeBudgeted();
    notifyListeners();
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
          await SQLQueryClass.getSubCategoriesJoined(prevDate, Jiffy(prevDate).add(months: 1));
      budgets.add(Budget(maincategories, subcategories, prevDate.month, prevDate.year));

      //Go to next month
      prevDate = Jiffy(prevDate).add(months: 1);
    } while (prevDate.isBefore(endDate));

    return budgets;
  }

  Budget _getBudgetByDate(DateTime date) {
    return _budgets.singleWhere((budget) => budget.year == date.year && budget.month == date.month);
  }

  void AddAccount(String accountName, double accountBalance) async {
    int accountCount = await SQLQueryClass.accountCount();
    Account newAccount = Account(accountCount + 1, accountName, accountBalance);
    accountCount++;
    await SQLQueryClass.addAccount(newAccount);
    computeToBeBudgeted();
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

Future<void> addDummyCategories() async {
  MainCategory cat = MainCategory(1, "Savings");
  SubCategory subcat = SubCategory(1, 1, "Savings", 200, 300);
  await SQLQueryClass.addCategory(cat);
  return await SQLQueryClass.addSubcategory(subcat);
}
