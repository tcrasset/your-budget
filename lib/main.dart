import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';

import 'package:mybudget/screens/budget/budgetPage.dart';
import 'package:mybudget/models/database_creator.dart';
import 'package:mybudget/screens/transaction/addTransactionPage.dart';
import 'package:mybudget/screens/showTransactions/showTransactionsPage.dart';
import 'package:provider/provider.dart';
// import 'package:mybudget/searchPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  List<MainCategory> mainCategories = await SQLQueryClass.getCategories();
  List<SubCategory> subcategories = await SQLQueryClass.getSubCategories();

  runApp(ChangeNotifierProvider(
      create: (context) => CategoryModel(mainCategories, subcategories), child: MyBudget()));
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

class CategoryModel extends ChangeNotifier {
  final List<Category> _categories = [];
  List<MainCategory> maincategories;
  List<SubCategory> subcategories;

  CategoryModel(List<MainCategory> maincategories, List<SubCategory> subcategories) {
    this.maincategories = maincategories;
    this.subcategories = subcategories;
    loadCategories();
  }

  /// An unmodifiable view of the categories in the data base.
  UnmodifiableListView<Category> get categories => UnmodifiableListView(_categories);

  /// The current total price of all items (assuming all items cost $42).
  int get categoryCount => _categories.length;

  Future<int> loadCategories() async {
    //To each category, add the correspondent subcategories
    this.maincategories.forEach((cat) {
      List<SubCategory> toAdd =
          this.subcategories.where((subcat) => subcat.parentId == cat.id).toList();

      cat.addMultipleSubcategories(toAdd);
    });

    // Extract subcategories of each MainCategory and place them after each main category
    _extractSubcategoriesInOrder();

    return Future.value(1);
  }

  /// Updates the list of categories/subcategories in the ListView after a change
  void _extractSubcategoriesInOrder() {
    for (var cat in this.maincategories) {
      if (cat is MainCategory) {
        _categories.add(cat);
        cat.subcategories.forEach((subcat) => _categories.add(subcat));
      }
    } // allCategoryList.forEach((cat) => print(cat));
  }

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Category category) {
    _categories.add(category);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _categories.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
