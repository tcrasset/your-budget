import 'package:flutter/material.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';

import 'package:mybudget/screens/budget/addCategoryPage.dart';
import 'package:mybudget/screens/budget/components/MainCategoryRow.dart';
import 'package:mybudget/screens/budget/components/SubCategoryRow.dart';

class BudgetPage extends StatefulWidget {
  final String title;

  const BudgetPage({Key key, this.title}) : super(key: key);

  @override
  _BudgetPageController createState() => _BudgetPageController();
}

class _BudgetPageController extends State<BudgetPage> {
  List<Category> allCategoryList; //List containing MainCategories and SubCategories

  @override
  void initState() {
    //Initialize the state to get the categories from the Widget
    super.initState();

    //Waiting for the database to get back to us
    print("Connecting to database");
    Future.wait([SQLQueryClass.getCategories(), SQLQueryClass.getSubCategories()])
        .then((List responses) {
      //When it does, we update the state of the widget
      List<MainCategory> dbMaincategories = responses[0];
      List<SubCategory> dbSubcategories = responses[1];

      //To each category, add the correspondent subcategories
      dbMaincategories.forEach((cat) {
        List<SubCategory> toAdd =
            dbSubcategories.where((subcat) => subcat.parentId == cat.id).toList();
        // toAdd.forEach((subcat) => print(subcat.available));
        cat.addMultipleSubcategories(toAdd);

        allCategoryList = dbMaincategories;
        setState(() {
          _updateAllCategoryList();
        });
      });
    }).catchError((e) => print('Caught error: $e'));
  }

  /// Navigates to a new page to add a Category
  /// That page returns a new name , and setState updates the current
  /// name shown on the ListView
  _navigateAndAddCategory(BuildContext context) async {
    final newCategoryName = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCategoryRoute()),
    );

    if (newCategoryName != null) {
      setState(() {
        SQLQueryClass.categoryCount().then((nextCategoryId) {
          allCategoryList.add(MainCategory(nextCategoryId, newCategoryName));
          _updateAllCategoryList();
        });
      });
    }
  }

  /// Navigates to a new page to add a SubCategory
  /// That page returns a sucategory with a name , and setState updates the current
  /// list of subcategories shown on the ListView
  _navigateAndAddSubcategory(BuildContext context) async {
    final returnElements = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddSubcategoryRoute(categories: allCategoryList)),
    );

    if (returnElements != null) {
      final int parentId = returnElements[0].id;
      final String name = returnElements[1];
      SQLQueryClass.subcategoryCount().then((nextSubcategoryId) {
        SubCategory newSubcategory = SubCategory(nextSubcategoryId, parentId, name, 0, 0);
        returnElements[0].addSubcategory(newSubcategory);
        setState(() {
          _updateAllCategoryList();
        });
      });
    }
  }

  /// Updates the list of categories/subcategories in the ListView after a change
  _updateAllCategoryList() {
    List<Category> updatedList = [];
    for (var cat in allCategoryList) {
      if (cat is MainCategory) {
        updatedList.add(cat);
        cat.subcategories.forEach((subcat) => updatedList.add(subcat));
      }
    }

    allCategoryList = updatedList;
    // allCategoryList.forEach((cat) => print(cat));
  }

  @override
  Widget build(BuildContext context) => _BudgetPageView(this);
}

class _BudgetPageView extends WidgetView<BudgetPage, _BudgetPageController> {
  _BudgetPageView(_BudgetPageController state) : super(state);

  Widget _addButtons(BuildContext context) {
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
            onPressed: () async {
              // int accountCount = await SQLQueries.accountCount();
              // Account account = Account(accountCount, "Savings account", 999.66);
              // SQLQueries.addAccount(account);
              // print("Added account $account");

              print("Add category button pressed");
              state._navigateAndAddCategory(context);
            },
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
            onPressed: () {
              print("Add subcategory button pressed");
              state._navigateAndAddSubcategory(context);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //While waiting for the database, return empty container
    if (state.allCategoryList == null) {
      return _addButtons(context);
    }

    // When the database is loaded, show the complete page
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            _addButtons(context),

            /// ListView with MainCategory and/or SubCategory rows (with custom Divider)
            Expanded(
              child: ListView.separated(
                itemCount: state.allCategoryList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 1, color: Colors.black12),
                itemBuilder: (context, index) {
                  final item = state.allCategoryList[index];
                  if (item is MainCategory) {
                    return MainCategoryRow(cat: item);
                  } else if (item is SubCategory) {
                    return new SubcategoryRow(subcat: item);
                  } else {
                    return null;
                  }
                },
              ),
            )
          ],
        ));
  }
}

// class BudgetPage extends StatefulWidget {
//   //First page you see when opening the app

//   BudgetPage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _BudgetPageState createState() => _BudgetPageState();
// }

// class _BudgetPageState extends State<BudgetPage> {
//   //TODO: Edit and delete subcategory

//   List<Category> allCategoryList; //List containing MainCategories and SubCategories

//   @override
//   void initState() {
//     //Initialize the state to get the categories from the Widget
//     super.initState();

//     //Waiting for the database to get back to us
//     print("Connecting to database");
//     Future.wait([SQLQueryClass.getCategories(), SQLQueryClass.getSubCategories()])
//         .then((List responses) {
//       //When it does, we update the state of the widget
//       List<MainCategory> dbMaincategories = responses[0];
//       List<SubCategory> dbSubcategories = responses[1];

//       //To each category, add the correspondent subcategories
//       dbMaincategories.forEach((cat) {
//         List<SubCategory> toAdd =
//             dbSubcategories.where((subcat) => subcat.parentId == cat.id).toList();
//         // toAdd.forEach((subcat) => print(subcat.available));
//         cat.addMultipleSubcategories(toAdd);

//         allCategoryList = dbMaincategories;
//         setState(() {
//           _updateAllCategoryList();
//         });
//       });
//     }).catchError((e) => print('Caught error: $e'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     //While waiting for the database, return empty container
//     if (allCategoryList == null) {
//       return new Container();
//     }

//     // When the database is loaded, show the complete page
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: <Widget>[
//             Row(
//               children: <Widget>[
//                 // Button for adding new Category (goes to new Page)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
//                   child: RaisedButton(
//                     padding: const EdgeInsets.all(8.0),
//                     textColor: Colors.white,
//                     color: Colors.blue,
//                     child: new Text("Add category"),
//                     onPressed: () async {
//                       // int accountCount = await SQLQueries.accountCount();
//                       // Account account = Account(accountCount, "Savings account", 999.66);
//                       // SQLQueries.addAccount(account);
//                       // print("Added account $account");

//                       print("Add category button pressed");
//                       _navigateAndAddCategory(context);
//                     },
//                   ),
//                 ),
//                 // Button for adding new SubCategory (goes to new Page)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
//                   child: RaisedButton(
//                     padding: const EdgeInsets.all(8.0),
//                     textColor: Colors.white,
//                     color: Colors.blue,
//                     child: new Text("Add subcategory"),
//                     onPressed: () {
//                       print("Add subcategory button pressed");
//                       _navigateAndAddSubcategory(context);
//                     },
//                   ),
//                 ),
//               ],
//             ),

//             /// ListView with MainCategory and/or SubCategory rows (with custom Divider)
//             Expanded(
//               child: ListView.separated(
//                 itemCount: allCategoryList.length,
//                 separatorBuilder: (BuildContext context, int index) =>
//                     Divider(height: 1, color: Colors.black12),
//                 itemBuilder: (context, index) {
//                   final item = allCategoryList[index];
//                   if (item is MainCategory) {
//                     return MainCategoryRow(cat: item);
//                   } else if (item is SubCategory) {
//                     return new SubcategoryRow(subcat: item);
//                   } else {
//                     return null;
//                   }
//                 },
//               ),
//             )
//           ],
//         ));
//   }

//   /// Navigates to a new page to add a Category
//   /// That page returns a new name , and setState updates the current
//   /// name shown on the ListView
//   _navigateAndAddCategory(BuildContext context) async {
//     final newCategoryName = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AddCategoryRoute()),
//     );

//     if (newCategoryName != null) {
//       setState(() {
//         SQLQueryClass.categoryCount().then((nextCategoryId) {
//           allCategoryList.add(MainCategory(nextCategoryId, newCategoryName));
//           _updateAllCategoryList();
//         });
//       });
//     }
//   }

//   /// Navigates to a new page to add a SubCategory
//   /// That page returns a sucategory with a name , and setState updates the current
//   /// list of subcategories shown on the ListView
//   _navigateAndAddSubcategory(BuildContext context) async {
//     final returnElements = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AddSubcategoryRoute(categories: allCategoryList)),
//     );

//     if (returnElements != null) {
//       var parentId = returnElements[0].id;

//       SQLQueryClass.subcategoryCount().then((nextSubcategoryId) {
//         SubCategory newSubcategory =
//             SubCategory(nextSubcategoryId, parentId, returnElements[1], 0, 0);
//         returnElements[0].addSubcategory(newSubcategory);
//         setState(() {
//           _updateAllCategoryList();
//         });
//       });
//     }
//   }

//   /// Updates the list of categories/subcategories in the ListView after a change
//   _updateAllCategoryList() {
//     List<Category> updatedList = [];
//     for (var cat in allCategoryList) {
//       if (cat is MainCategory) {
//         updatedList.add(cat);
//         cat.subcategories.forEach((subcat) => updatedList.add(subcat));
//       }
//     }

//     allCategoryList = updatedList;
//     // allCategoryList.forEach((cat) => print(cat));
//   }
// }
