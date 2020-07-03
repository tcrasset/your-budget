import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';

class AppState extends ChangeNotifier {
  final List<Category> _categories = [];
  final List<Payee> _payees = [];
  final List<Account> _accounts = [];
  final List<MoneyTransaction> _transactions = [];

  List<MainCategory> dbMaincategories;
  List<SubCategory> dbSubcategories;

  /// An unmodifiable view of the categories in the data base.
  UnmodifiableListView<Category> get categories => UnmodifiableListView(_categories);
  UnmodifiableListView<Payee> get payees => UnmodifiableListView(_payees);
  UnmodifiableListView<Account> get accounts => UnmodifiableListView(_accounts);
  UnmodifiableListView<MoneyTransaction> get transactions => UnmodifiableListView(_transactions);

  AppState() {
    _loadCategories();
    _loadOthers();
  }

  /// Adds [category] to the current [_categories].
  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }

  void addTransaction(MoneyTransaction transaction) {
    _transactions.add(transaction);
  }

  Future<void> _loadOthers() async {
    _payees.addAll(await SQLQueryClass.getPayees());
    _accounts.addAll(await SQLQueryClass.getAccounts());
    _transactions.addAll(await SQLQueryClass.getMoneyTransactions());
  }

  Future<void> _loadCategories() async {
    dbMaincategories = await SQLQueryClass.getCategories();
    dbSubcategories = await SQLQueryClass.getSubCategories();

    //To each category, add the correspondent subcategories
    this._extractSubcategoriesFromMainCategories();

    // Extract subcategories of each MainCategory and place them after each main category
    this._placeSubcategoriesInOrder();
  }

  void _extractSubcategoriesFromMainCategories() {
    dbMaincategories.forEach((cat) {
      List<SubCategory> toAdd =
          dbSubcategories.where((subcat) => subcat.parentId == cat.id).toList();

      cat.addMultipleSubcategories(toAdd);
    });
  }

  /// Updates the list of categories/subcategories in the ListView after a change
  void _placeSubcategoriesInOrder() {
    List<Category> allCategories = [];
    for (var cat in dbMaincategories) {
      if (cat is MainCategory) {
        allCategories.add(cat);
        cat.subcategories.forEach((subcat) => allCategories.add(subcat));
      }
    }

    this._addAllCategories(allCategories);
  }

  void _addAllCategories(List<Category> categoriesList) {
    categoriesList.forEach((cat) {
      _categories.add(cat);
    });
    notifyListeners();
  }
}

Future<void> addDummyVariables() async {
  int accountCount = await SQLQueryClass.accountCount();
  Account account = Account(accountCount + 1, "Savings account", 999.66);
  SQLQueryClass.addAccount(account);
  print("Added account $account");

  int payeeCount = await SQLQueryClass.payeeCount();
  Payee payee = Payee(payeeCount + 1, "Frank");
  SQLQueryClass.addPayee(payee);
  print("Added payee $payee");
}
