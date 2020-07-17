import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/screens/budget/addCategoryPage.dart';
import 'package:mybudget/screens/budget/addSubcategoryPage.dart';
import 'package:mybudget/screens/budget/components/MainCategoryRow.dart';
import 'package:mybudget/screens/budget/components/SubCategoryRow.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatelessWidget {
  final String title;

  const BudgetPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Budget page build");
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            _AddButtons(), //
            _ToBeBudgeted(),
            Expanded(child: _CategoriesList())
          ],
        ));
  }
}

class _CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);
    final List<Category> categories = appState.allCategories;

    if (categories.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.separated(
      itemCount: categories.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1, color: Colors.black12),
      itemBuilder: (context, index) {
        final item = categories[index];
        return (item is MainCategory) ? MainCategoryRow(cat: item) : SubcategoryRow(subcat: item);
      },
    );
  }
}

class _ToBeBudgeted extends StatelessWidget {
  final TextStyle _textStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0);

  final TextStyle _positiveAmountTextStyle = new TextStyle(color: Colors.green, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle = new TextStyle(color: Colors.red, fontSize: 32.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
                child: Text(
              "To be budgeted",
              style: _textStyle,
            )),
            Consumer<AppState>(
              builder: (context, appState, child) {
                return Text(
                  appState.toBeBudgeted?.toStringAsFixed(2) ?? "0.00" + " €",
                  style: appState.toBeBudgeted >= 0
                      ? _positiveAmountTextStyle
                      : _negativeAmountTextStyle,
                );
              },
            )
          ],
        ));
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

        Consumer<AppState>(builder: (_, appState, __) {
          return Row(
            children: [
              Text("${appState.budgetMonth}"),
              IconButton(icon: Icon(Icons.plus_one), onPressed: appState.incrementMonth),
              IconButton(icon: Icon(Icons.exposure_neg_1), onPressed: appState.decrementMonth)
            ],
          );
        }),
      ],
    );
  }
}
