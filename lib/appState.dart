import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';

class AppState extends ChangeNotifier {
  List<Category> _allCategories = [];
  List<SubCategory> _subcategories;
  List<MainCategory> _maincategories;
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
  double toBeBudgeted = 0;

  DateTime startingBudgetDate = DateTime(2020, 7);
  DateTime currentBudgetDate;
  int differenceInMonths = 0;
  String budgetMonth;

  Budget currentBudget;

  /// An unmodifiable view of the information in the data base.
  UnmodifiableListView<Category> get allCategories => UnmodifiableListView(_allCategories);
  UnmodifiableListView<MainCategory> get maincategories => UnmodifiableListView(_maincategories);
  UnmodifiableListView<SubCategory> get subcategories => UnmodifiableListView(_subcategories);
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
    _subcategories = await SQLQueryClass.getSubCategoriesJoined(
        DateTime(2020, 7, 1, 0, 0, 0), DateTime(2020, 8, 1, 0, 0, 0));
    _budgets =
        await _createBudgetsByMonth(DateTime(2020, 7, 1, 0, 0, 0), DateTime(2021, 7, 1, 0, 0, 0));

    _payees = await SQLQueryClass.getPayees();
    _accounts = await SQLQueryClass.getAccounts();
    _transactions = await SQLQueryClass.getMoneyTransactions();
    _budgetValues = await SQLQueryClass.getBudgetValues();

    subcategoryCount = await SQLQueryClass.subcategoryCount();
    mainCategoryCount = await SQLQueryClass.categoryCount();
    accountCount = await SQLQueryClass.accountCount();
    payeeCount = await SQLQueryClass.payeeCount();
    moneyTransactionCount = await SQLQueryClass.moneyTransactionCount();

    // notifyListeners();
    DateTime nowDate = DateTime.now();
    currentBudgetDate = DateTime(nowDate.year, nowDate.month, 1, 0, 0, 0, 0, 0);
    budgetMonth = monthStringFromDate(currentBudgetDate);
    currentBudget = _getBudgetByDate(currentBudgetDate);
    _allCategories = getAllCategoriesFromBudget(currentBudgetDate.month, currentBudgetDate.year);
    _computeToBeBudgeted();
    notifyListeners();
  }

  /// Adds [category] to the current [_allCategories], to [_maincategories],
  /// and to the data base.
  void addCategory(String categoryName) {
    mainCategoryCount++;
    // + 1 because we do not want to have an ID of 0
    MainCategory category = MainCategory(mainCategoryCount + 1, categoryName);
    _maincategories.add(category);
    _allCategories.add(category);
    SQLQueryClass.addCategory(category);
    notifyListeners();
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
    subcategoryCount++;
    _subcategories.add(subcategory);
    SQLQueryClass.addSubcategory(subcategory);
    this._extractSubcategoriesFromMainCategories();

    // Extract subcategories of each MainCategory and place them after each main category
    List<Category> allCategories = this._placeSubcategoriesInOrder();
    _allCategories.clear();
    _allCategories = allCategories;
    notifyListeners();
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
      // Get the corresponding subcategory

      SubCategory oldSubcat;
      for (final cat in _allCategories) {
        if (cat is SubCategory && cat.id == transaction.subcatID) {
          oldSubcat = cat;
          break;
        }
      }

      /// Modify amount in the state variables ([_categories] and [_subcategories])
      /// and in the data base
      double newAvailableAmount = oldSubcat.available + transaction.amount;
      oldSubcat.available = newAvailableAmount;

      for (final MainCategory cat in _maincategories) {
        if (cat.id == oldSubcat.parentId) {
          cat.updateFields();
        }
      }

      SQLQueryClass.updateSubcategory(SubCategory(oldSubcat.id, oldSubcat.parentId, oldSubcat.name,
          oldSubcat.budgeted, newAvailableAmount));
    }

    notifyListeners();
  }

  /// Update all the fields of [modifiedSubcategory]
  /// in both the state and in the data base.
  /// Then, modify the total budgeted and available
  /// amounts of the corresponding [MainCategory]
  void updateSubcategory(SubCategory modifiedSubcategory) {
    // print(currentBudget.month);
    SubCategory previousSubcategory =
        currentBudget.subcategories.singleWhere((subcat) => subcat.id == modifiedSubcategory.id);

    /// Persist the change in the DataBase
    /// Differentiate between name change, where we only modify
    /// [SubCategory] and the budgeted/available change,
    /// where we modify the [BudgetValue].

    if (previousSubcategory.name != modifiedSubcategory.name) {
      SQLQueryClass.updateSubcategory(modifiedSubcategory);
    } else {
      // print("Value change");
      // for (final BudgetValue bv in _budgetValues) {
      //   if (bv.subcategoryId == modifiedSubcategory.id) {
      //     print(bv);
      //   }
      // }
      BudgetValue correspondingBudgetValue = _budgetValues.singleWhere((budgetValue) =>
          (budgetValue.subcategoryId == modifiedSubcategory.id) &&
          (budgetValue.date.year == currentBudget.year) &&
          (budgetValue.date.month == currentBudget.month));
      // print(correspondingBudgetValue);
      correspondingBudgetValue.budgeted = modifiedSubcategory.budgeted;
      correspondingBudgetValue.available = modifiedSubcategory.available;
      SQLQueryClass.updateBudgetValue(correspondingBudgetValue);
    }

    // Change state objects
    for (final SubCategory subcat in currentBudget.subcategories) {
      if (subcat.id == modifiedSubcategory.id) {
        subcat.name = modifiedSubcategory.name;
        subcat.budgeted = modifiedSubcategory.budgeted;
        subcat.available = modifiedSubcategory.available;
      }
    }

    for (final MainCategory cat in currentBudget.maincategories) {
      if (cat.id == modifiedSubcategory.parentId) {
        cat.updateFields();
      }
    }
    _allCategories = this._placeSubcategoriesInOrder();
    _computeToBeBudgeted();
    notifyListeners();
  }

  /// To each [MainCategory] object, add the correspondent [Subcategory]'s
  void _extractSubcategoriesFromMainCategories() {
    _maincategories.forEach((cat) {
      List<SubCategory> toAdd =
          _subcategories.where((subcat) => subcat.parentId == cat.id).toList();

      cat.addMultipleSubcategories(toAdd);
    });
  }

  /// Updates the list of categories/subcategories in the ListView after a change
  List<Category> _placeSubcategoriesInOrder() {
    List<Category> allCategories = [];
    for (var cat in currentBudget.maincategories) {
      if (cat is MainCategory) {
        allCategories.add(cat);
        cat.subcategories.forEach((subcat) => allCategories.add(subcat));
      }
    }

    return allCategories;
  }

  /// Update the name of the [MainCategory] pointed to
  /// by [modifiedCategory.id] to [modifiedCategory.name]
  void updateCategoryName(MainCategory modifiedCategory) {
    for (MainCategory cat in _maincategories) {
      if (cat.id == modifiedCategory.id) {
        cat.name = modifiedCategory.name;
      }
    }
    // Persist it in memory
    SQLQueryClass.updateCategory(modifiedCategory);
  }

  void updateToBeBudgeted(beforeAfterDifference) {
    toBeBudgeted -= beforeAfterDifference;
    notifyListeners();
  }

  void _computeToBeBudgeted() {
    //TODO: Change month by month TBB
    toBeBudgeted = 0;
    for (final Account account in _accounts) {
      toBeBudgeted += account.balance;
    }
    DateTime prevDate = startingBudgetDate;
    DateTime nextDate = startingBudgetDate;

    debugPrint("STAAAAAAAAAAAAAAAAAAART");
    do {
      prevDate = nextDate;

      Budget monthlyBudget = _getBudgetByDate(prevDate);
      print("\n\n");
      print("Budget month is [${monthlyBudget.month}/${monthlyBudget.year}]");

      int id = 1;
      for (final MainCategory cat in monthlyBudget.maincategories) {
        print("[${prevDate.month}/${prevDate.year}] -- ${id++} = ${cat.budgeted}");

        toBeBudgeted -= cat.budgeted;
      }
      //Go to next month
      nextDate = Jiffy(nextDate).add(months: 1);
    } while (currentBudgetDate.isAfter(prevDate));
  }

  void incrementMonth() {
    currentBudgetDate = Jiffy(currentBudgetDate).add(months: 1);
    budgetMonth = monthStringFromDate(currentBudgetDate);
    _computeToBeBudgeted();
    differenceInMonths = getMonthDifference(currentBudgetDate, startingBudgetDate);
    currentBudget = _getBudgetByDate(currentBudgetDate);
    _allCategories = getAllCategoriesFromBudget(currentBudgetDate.month, currentBudgetDate.year);
    // _printMonthInfo();
    notifyListeners();
  }

  void _printMonthInfo() {
    print("Current date : ${Jiffy(currentBudgetDate).format("MMMM")} ${currentBudgetDate.year}");
    print("Starting date : ${monthStringFromDate(startingBudgetDate)} ${startingBudgetDate.year}");
    print("differenceInMonths $differenceInMonths");
  }

  void printDate(DateTime date) {
    print("[${date.month}/${date.year}]");
  }

  void decrementMonth() {
    currentBudgetDate = Jiffy(currentBudgetDate).subtract(months: 1);
    _computeToBeBudgeted();
    budgetMonth = monthStringFromDate(currentBudgetDate);
    differenceInMonths = getMonthDifference(currentBudgetDate, startingBudgetDate);
    currentBudget = _getBudgetByDate(currentBudgetDate);
    _allCategories = getAllCategoriesFromBudget(currentBudgetDate.month, currentBudgetDate.year);
    // _printMonthInfo();
    notifyListeners();
  }

  Future<List<Budget>> _createBudgetsByMonth(DateTime startDate, DateTime endDate) async {
    assert(startDate.isBefore(endDate));

    /// To each [MainCategory] object, add the correspondent [Subcategory]'s
    _maincategories = await SQLQueryClass.getCategories();
    this._extractSubcategoriesFromMainCategories();

    Budget budget;
    List<Budget> budgets = [];
    DateTime prevDate = startDate;

    // Start with 1 month's difference and keep incrementing
    // until we overshoot the endDate
    do {
      List<SubCategory> subcategories =
          await SQLQueryClass.getSubCategoriesJoined(prevDate, Jiffy(prevDate).add(months: 1));
      budget = Budget(_maincategories, subcategories, prevDate.month, prevDate.year);
      budgets.add(budget);

      //Go to next month
      prevDate = Jiffy(prevDate).add(months: 1);
    } while (prevDate.isBefore(endDate));

    return budgets;
  }

  List<Category> getAllCategoriesFromBudget(int month, int year) {
    currentBudget = _getBudgetByDate(DateTime(year, month));
    return currentBudget.computeAllCategories();
  }

  Budget _getBudgetByDate(DateTime date) {
    return _budgets.singleWhere((budget) => budget.year == date.year && budget.month == date.month);
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

Future<void> addDummyVariables() async {
  int accountCount = await SQLQueryClass.accountCount();
  Account account = Account(accountCount + 2, "Checking account", 5000.00);
  SQLQueryClass.addAccount(account);
  print("Added account $account");
}
