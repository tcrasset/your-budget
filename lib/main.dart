import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/screens/addTransaction/addTransaction.dart';

import 'package:mybudget/screens/budget/budgetPage.dart';
import 'package:mybudget/models/database_creator.dart';
import 'package:mybudget/screens/showTransactions/showTransactionsPage.dart';
import 'package:provider/provider.dart';
// import 'package:mybudget/searchPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  runApp(ChangeNotifierProvider(create: (context) => AppState(), child: MyBudget()));
}

// Contains the AppBar that lets the user choose between
// different pages
class MyBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        // length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Budget"),
                Tab(text: "Add new Transaction"),
                Tab(text: "Transactions")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BudgetPage(title: 'Bugdet Page'),
              AddTransactionPage(),
              ShowTransactionPage(title: "Transactions")
            ],
          ),
        ),
      ),
    );
  }
}

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
  void add(Category category) {
    _categories.add(category);
    notifyListeners();
  }

  Future<void> _loadCategories() async {
    dbMaincategories = await SQLQueryClass.getCategories();
    dbSubcategories = await SQLQueryClass.getSubCategories();

    //To each category, add the correspondent subcategories
    this._extractSubcategoriesFromMainCategories();

    // Extract subcategories of each MainCategory and place them after each main category
    this._placeSubcategoriesInOrder();
  }

  Future<void> _loadOthers() async {
    _payees.addAll(await SQLQueryClass.getPayees());
    _accounts.addAll(await SQLQueryClass.getAccounts());
    _transactions.addAll(await SQLQueryClass.getMoneyTransactions());
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

    this._addAll(allCategories);
  }

  void _addAll(List<Category> categoriesList) {
    categoriesList.forEach((cat) {
      _categories.add(cat);
    });
    notifyListeners();
  }
}
