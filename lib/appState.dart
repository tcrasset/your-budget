import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';

class AppState extends ChangeNotifier {
  final List<Category> _allCategories = [];
  final List<SubCategory> _subcategories = [];
  final List<MainCategory> _maincategories = [];
  final List<Payee> _payees = [];
  final List<Account> _accounts = [];
  final List<MoneyTransaction> _transactions = [];
  final List<BudgetValue> _budgetValues = [];
  final List<Budget> _budgets = [];

  int subcategoryCount;
  int mainCategoryCount;
  int moneyTransactionCount;
  int accountCount;
  int payeeCount;
  double toBeBudgeted = 0;

  DateTime startingBudgetDate = DateTime(2020, 7);
  DateTime currentBudgetDate = DateTime(2020, 10);
  int differenceInMonths = 0;
  String budgetMonth;

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
    await _loadCategories();
    await _loadOthers();
    // notifyListeners();
    _computeToBeBudgeted();
    budgetMonth = monthStringFromDate(currentBudgetDate);

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
    _allCategories.addAll(allCategories);
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
    SQLQueryClass.updateSubcategory(modifiedSubcategory);
    for (final SubCategory subcat in _subcategories) {
      if (subcat.id == modifiedSubcategory.id) {
        subcat.name = modifiedSubcategory.name;
        subcat.budgeted = modifiedSubcategory.budgeted;
        subcat.available = modifiedSubcategory.available;
      }
    }

    for (final MainCategory cat in _maincategories) {
      if (cat.id == modifiedSubcategory.parentId) {
        cat.updateFields();
      }
    }
    notifyListeners();
  }

  /// Load payees, accounts, transactions and their counts
  /// from the database
  Future<void> _loadOthers() async {
    _payees.addAll(await SQLQueryClass.getPayees());
    _accounts.addAll(await SQLQueryClass.getAccounts());
    _transactions.addAll(await SQLQueryClass.getMoneyTransactions());

    subcategoryCount = await SQLQueryClass.subcategoryCount();
    mainCategoryCount = await SQLQueryClass.categoryCount();
    accountCount = await SQLQueryClass.accountCount();
    payeeCount = await SQLQueryClass.payeeCount();
    moneyTransactionCount = await SQLQueryClass.moneyTransactionCount();
  }

  /// Load subcategories and maincategories from the data base
  /// and create a list to display them correctly
  Future<void> _loadCategories() async {
    _subcategories.addAll(await SQLQueryClass.getSubCategoriesJoined(
        DateTime(2020, 7, 1, 0, 0, 0), DateTime(2020, 8, 1, 0, 0, 0)));
    _budgets.addAll(
        await _createBudgetsByMonth(DateTime(2020, 7, 1, 0, 0, 0), DateTime(2021, 7, 1, 0, 0, 0)));

    // print(_budgets);
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
    for (var cat in _maincategories) {
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
    toBeBudgeted = 0;
    for (Account account in _accounts) {
      print(account.balance);
      toBeBudgeted += account.balance;
    }
  }

  void incrementMonth() {
    currentBudgetDate = Jiffy(currentBudgetDate).add(months: 1);
    budgetMonth = monthStringFromDate(currentBudgetDate);

    print("Current date : ${Jiffy(currentBudgetDate).format("MMMM")} ${currentBudgetDate.year}");
    print("Starting date : ${monthStringFromDate(startingBudgetDate)} ${startingBudgetDate.year}");
    differenceInMonths = getMonthDifference(currentBudgetDate, startingBudgetDate);
    print("differenceInMonths $differenceInMonths");

    notifyListeners();
  }

  void decrementMonth() {
    currentBudgetDate = Jiffy(currentBudgetDate).subtract(months: 1);
    budgetMonth = monthStringFromDate(currentBudgetDate);

    print("Current date : $budgetMonth ${currentBudgetDate.year}");
    print("Starting date : ${monthStringFromDate(startingBudgetDate)} ${startingBudgetDate.year}");

    differenceInMonths = getMonthDifference(currentBudgetDate, startingBudgetDate);
    print("differenceInMonths $differenceInMonths");
    notifyListeners();
  }

  Future<List<Budget>> _createBudgetsByMonth(DateTime startDate, DateTime endDate) async {
    assert(startDate.isBefore(endDate));
    _maincategories.addAll(await SQLQueryClass.getCategories());

    /// To each [MainCategory] object, add the correspondent [Subcategory]'s
    this._extractSubcategoriesFromMainCategories();

    // Extract subcategories of each MainCategory and place them after each main category
    List<Category> allCategories = this._placeSubcategoriesInOrder();
    _allCategories.addAll(allCategories);

    Budget budget;
    List<Budget> budgets = [];
    DateTime prevDate = startDate;
    DateTime nextDate = Jiffy(startDate).add(months: 1);

    List<SubCategory> prevSubcategories =
        await SQLQueryClass.getSubCategoriesJoined(prevDate, nextDate);
    List<SubCategory> nextSubcategories =
        await SQLQueryClass.getSubCategoriesJoined(prevDate, nextDate);

    // Start with 1 month's difference and keep incrementing
    // until we overshoot the endDate
    while (prevDate.isBefore(endDate)) {
      /// If the query returns empty, we take the subcategories of the previous
      /// month and copy them, but without the budget information.
      if (nextSubcategories.isEmpty) {
        List<SubCategory> modifiedSubcategories = [];
        for (final SubCategory subcat in prevSubcategories) {
          modifiedSubcategories.add(subcat.blank());
        }
        budget = Budget(_maincategories, modifiedSubcategories, prevDate.month, prevDate.year);
      } else {
        budget = Budget(_maincategories, nextSubcategories, prevDate.month, prevDate.year);
        prevSubcategories = nextSubcategories;
      }

      budgets.add(budget);

      //Go to next month
      prevDate = nextDate;
      nextDate = Jiffy(nextDate).add(months: 1);
      nextSubcategories = await SQLQueryClass.getSubCategoriesJoined(prevDate, nextDate);
    }

    return budgets;
  }

  List<Category> getAllCategoriesFromBudget(int month, int year) {
    Budget budget = getBudgetByDate(month, year);
    List<Category> allcategories = [];

    budget.maincategories.forEach((cat) {
      List<SubCategory> toAdd =
          budget.subcategories.where((subcat) => subcat.parentId == cat.id).toList();
      cat.subcategories = toAdd;
    });

    List<Category> allCategories = [];
    for (var cat in budget.maincategories) {
      allcategories.add(cat);
      cat.subcategories.forEach((subcat) {
        print(subcat);
        allcategories.add(subcat);
      });
    }
    print(allcategories);

    return allcategories;
  }

  getBudgetByDate(int month, int year) {
    return _budgets.singleWhere((budget) => budget.year == year && budget.month == month);
  }

  // void addSubcategoriesToBudgetValues() async {
  //   int id = 1;
  //   for (final SubCategory subcat in _subcategories) {
  //     BudgetValue budgetvalue =
  //         BudgetValue(id, subcat.id, subcat.budgeted, subcat.available, DateTime.now());
  //     id++;
  //     await SQLQueryClass.addBudgetValue(budgetvalue);
  //   }
  // }
}

Future<void> addDummyVariables() async {
  int accountCount = await SQLQueryClass.accountCount();
  Account account = Account(accountCount + 2, "Checking account", 5000.00);
  SQLQueryClass.addAccount(account);
  print("Added account $account");
}
