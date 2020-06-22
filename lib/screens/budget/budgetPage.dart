import 'package:flutter/material.dart';

import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/main.dart';
import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/screens/budget/addCategoryPage.dart';
import 'package:mybudget/screens/budget/addSubcategoryPage.dart';
import 'package:mybudget/screens/budget/components/MainCategoryRow.dart';
import 'package:mybudget/screens/budget/components/SubCategoryRow.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatefulWidget {
  final String title;

  const BudgetPage({Key key, this.title}) : super(key: key);

  @override
  _BudgetPageController createState() => _BudgetPageController();
}

class _BudgetPageController extends State<BudgetPage> {
  @override
  void initState() {
    //Initialize the state to get the categories from the Widget
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _BudgetPageView(this);
}

class _BudgetPageView extends WidgetView<BudgetPage, _BudgetPageController> {
  _BudgetPageView(_BudgetPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    List<Category> categories = appState.categories;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            _AddButtons(),
            if (categories.length != 0) Expanded(child: _CategoriesList())
          ],
        ));
  }
}

class _CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    List<Category> categories = appState.categories;

    return ListView.separated(
      itemCount: categories.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1, color: Colors.black12),
      itemBuilder: (context, index) {
        final item = categories[index];
        if (item is MainCategory) {
          return MainCategoryRow(cat: item);
        } else if (item is SubCategory) {
          return new SubcategoryRow(subcat: item);
        } else {
          return null;
        }
      },
    );
  }
}

class _AddButtons extends StatelessWidget {
  /// Navigates to a new page to add a Category
  /// That page returns a new name , and setState updates the current
  /// name shown on the ListView
  void _navigateToAddCategory(BuildContext context) {
    // addDummyVariables();
    print("Add category button pressed");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCategoryRoute()),
    );
  }

  /// Navigates to a new page to add a SubCategory
  void _navigateAndAddSubcategory(BuildContext context) {
    print("Add subcategory button pressed");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddSubcategoryRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Button for adding new Category (goes to new Page)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
          child: RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.blue,
            child: new Text("Add category"),
            onPressed: () => _navigateToAddCategory(context),
          ),
        ),
        // Button for adding new SubCategory (goes to new Page)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
          child: RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.blue,
            child: new Text("Add subcategory"),
            onPressed: () => _navigateAndAddSubcategory(context),
          ),
        ),
      ],
    );
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
