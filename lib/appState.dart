import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';

class AppState extends ChangeNotifier {
  final List<Category> _allCategories = [];
  final List<SubCategory> _subcategories = [];
  final List<MainCategory> _maincategories = [];
  final List<Payee> _payees = [];
  final List<Account> _accounts = [];
  final List<MoneyTransaction> _transactions = [];

  int subcategoryCount;
  int mainCategoryCount;
  int moneyTransactionCount;
  int accountCount;
  int payeeCount;
  double toBeBudgeted;

  /// An unmodifiable view of the information in the data base.
  UnmodifiableListView<Category> get allCategories => UnmodifiableListView(_allCategories);
  UnmodifiableListView<MainCategory> get maincategories => UnmodifiableListView(_maincategories);
  UnmodifiableListView<SubCategory> get subcategories => UnmodifiableListView(_subcategories);
  UnmodifiableListView<Payee> get payees => UnmodifiableListView(_payees);
  UnmodifiableListView<Account> get accounts => UnmodifiableListView(_accounts);
  UnmodifiableListView<MoneyTransaction> get transactions => UnmodifiableListView(_transactions);

  AppState() {
    // addDummyVariables();
    _loadStateFromDatabase();
    notifyListeners();
  }

  void _loadStateFromDatabase() async {
    await _loadCategories();
    await _loadOthers();
    _computeToBeBudgeted();
  }

  /// Adds [category] to the current [_allCategories], to [_maincategories],
  /// and to the data base.
  void addCategory(String categoryName) {
    mainCategoryCount++;
    MainCategory category = MainCategory(mainCategoryCount, categoryName);
    SQLQueryClass.addCategory(category);
    _maincategories.add(category);
    _allCategories.add(category);
    notifyListeners();
  }

  void addPayee(Payee payee) {
    SQLQueryClass.addPayee(payee);
    _payees.add(payee);
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

    SQLQueryClass.updateSubcategory(SubCategory(
        oldSubcat.id, oldSubcat.parentId, oldSubcat.name, oldSubcat.budgeted, newAvailableAmount));

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

    moneyTransactionCount = await SQLQueryClass.moneyTransactionCount();
    accountCount = await SQLQueryClass.accountCount();
    payeeCount = await SQLQueryClass.payeeCount();
  }

  /// Load subcategories and maincategories from the data base
  /// and create a list to display them correctly
  Future<void> _loadCategories() async {
    _maincategories.addAll(await SQLQueryClass.getCategories());
    _subcategories.addAll(await SQLQueryClass.getSubCategories());

    subcategoryCount = await SQLQueryClass.subcategoryCount();
    mainCategoryCount = await SQLQueryClass.categoryCount();

    //To each category, add the correspondent subcategories
    this._extractSubcategoriesFromMainCategories();

    // Extract subcategories of each MainCategory and place them after each main category
    List<Category> allCategories = this._placeSubcategoriesInOrder();
    _allCategories.addAll(allCategories);
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
}

Future<void> addDummyVariables() async {
  int accountCount = await SQLQueryClass.accountCount();
  Account account = Account(accountCount + 1, "Savings account", 10000.00);
  SQLQueryClass.addAccount(account);
  print("Added account $account");
}
