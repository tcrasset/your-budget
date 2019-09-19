import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

//Custom imports
import 'addCategoryPage.dart';
import 'package:mybudget/categories.dart';
import 'package:mybudget/database_creator.dart';

class MyBudget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Very Own Budget App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BudgetPage(title: 'Bugdet Page'),
    );
  }
}

class BudgetPage extends StatefulWidget {
  //First page you see when opening the app

  BudgetPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  //TODO: Edit and delete subcategory

  List<Category>
      allCategoryList; //List containing MainCategories and SubCategories

  @override
  void initState() {
    //Initialize the state to get the categories from the Widget
    super.initState();

    //Waiting for the database to get back to us
    print("Connecting to database");
    Future.wait([SQLQueries.getCategories(), SQLQueries.getSubCategories()])
        .then((List responses) {
      //When it does, we update the state of the widget
      setState(() {
        List<MainCategory> dbMaincategories = responses[0];
        List<SubCategory> dbSubcategories = responses[1];

        //To each category, add the correspondent subcategories
        dbMaincategories.forEach((cat) {
          List<SubCategory> toAdd = dbSubcategories
              .where((subcat) => subcat.parentId == cat.id)
              .toList();
          // toAdd.forEach((subcat) => print(subcat.available));
          cat.addMultipleSubcategories(toAdd);
        });
        allCategoryList = dbMaincategories;
        _updateAllCategoryList();
      });
    }).catchError((e) => print('Caught error: $e'));
  }

  @override
  Widget build(BuildContext context) {
    //While waiting for the database, return empty container
    if (allCategoryList == null) {
      return new Container();
    }

    // When the database is loaded, show the complete page
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Button for adding new Category (goes to new Page)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                  child: RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: new Text("Add category"),
                    onPressed: () {
                      print("Add category button pressed");
                      _navigateAndAddCategory(context);
                    },
                  ),
                ),
                // Button for adding new SubCategory (goes to new Page)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                  child: RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: new Text("Add subcategory"),
                    onPressed: () {
                      print("Add subcategory button pressed");
                      _navigateAndAddSubcategory(context);
                    },
                  ),
                ),
              ],
            ),

            /// ListView with MainCategory and/or SubCategory rows (with custom Divider)
            Expanded(
              child: ListView.separated(
                itemCount: allCategoryList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 1, color: new Color(0xFFE8E8E8)),
                itemBuilder: (context, index) {
                  final item = allCategoryList[index];
                  if (item is MainCategory) {
                    return mainCategoryRow(cat: item);
                  } else if (item is SubCategory) {
                    return new subcategoryRow(subcat: item);
                  } else {
                    return null;
                  }
                },
              ),
            )
          ],
        ));
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
        SQLQueries.categoryCount().then((nextCategoryId) {
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
      MaterialPageRoute(
          builder: (context) =>
              AddSubcategoryRoute(categories: allCategoryList)),
    );

    if (returnElements != null) {
      var parentId = returnElements[0].id;

      setState(() {
        SQLQueries.subcategoryCount().then((nextSubcategoryId) {
          SubCategory newSubcategory =
              SubCategory(nextSubcategoryId, parentId, returnElements[1], 0, 0);
          returnElements[0].addSubcategory(newSubcategory);
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
}

/// Widget containing and displaying the information of a category
class mainCategoryRow extends StatefulWidget {
  MainCategory cat;
  mainCategoryRow({Key key, @required this.cat}) : super(key: key);

  @override
  _mainCategoryRowState createState() => _mainCategoryRowState();
}

class _mainCategoryRowState extends State<mainCategoryRow> {
  final _categoryTextStyle = TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0);
  final myBox = new SizedBox(
    height: 8.0,
    child: new Center(
      child: new Container(
        height: 8.0,
        color: new Color(0xFFE8E8E8),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    print(widget.cat);
    return Column(
      children: <Widget>[
        myBox,
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.cat.name,
                        textAlign: TextAlign.left, style: _categoryTextStyle)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Budgeted',
                        textAlign: TextAlign.right, style: _categoryTextStyle),
                    Text('${widget.cat.budgeted}',
                        textAlign: TextAlign.right, style: _categoryTextStyle)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Available',
                        textAlign: TextAlign.right, style: _categoryTextStyle),
                    Text('${widget.cat.available}',
                        textAlign: TextAlign.right, style: _categoryTextStyle)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Widget containing and displaying the information a subcategory
class subcategoryRow extends StatefulWidget {
  SubCategory subcat;
  subcategoryRow({Key key, @required this.subcat}) : super(key: key);

  @override
  _subcategoryRowState createState() => _subcategoryRowState();
}

class _subcategoryRowState extends State<subcategoryRow> {
  var _budgetedController = new MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');

  var _availableController = new MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');

  var _subcategoryTextStyle =
      new TextStyle(color: Colors.black, fontSize: 16.0);

  @override
  void dispose() {
    _availableController.dispose();
    _budgetedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.subcat);
    _budgetedController.updateValue(widget.subcat.budgeted);
    _availableController.updateValue(widget.subcat.available);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(widget.subcat.name,
                textAlign: TextAlign.left, style: _subcategoryTextStyle),
          ),
          Expanded(
            child: TextFormField(
              decoration: new InputDecoration.collapsed(
                hintText: "",
              ),
              keyboardType: TextInputType.numberWithOptions(),
              controller: _budgetedController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(12)
              ], //To remove length counter
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.right,
              style: _subcategoryTextStyle,
              // When the user presses the 'Enter' key, update the respective entry in the database
              onFieldSubmitted: (String value) {
                print("Changed budgeted value in subcategory");
                setState(() {
                  if (_budgetedController.numberValue !=
                      widget.subcat.budgeted) {
                    widget.subcat.budgeted = _budgetedController.numberValue;
                    SQLQueries.updateSubcategory(widget.subcat);
                  }
                });
              },
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: new InputDecoration.collapsed(
                  hintText: "${widget.subcat.available}"),
              keyboardType: TextInputType.numberWithOptions(),
              controller: _availableController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(12)
              ], //To remove length counter
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.right,
              style: _subcategoryTextStyle,
              // When the user presses the 'Enter' key, update the respective entry in the database
              onFieldSubmitted: (String value) {
                print("Changed available value in subcategory");
                setState(() {
                  widget.subcat.available = _availableController.numberValue;
                });
                SQLQueries.updateSubcategory(widget.subcat);
              },
            ),
          )
        ],
      ),
    );
  }
  //TODO: Big numbers get cutoff when sending to database (e.g. 50 0004.05 becommes 5000.0, small numbers too !)
  //TODO: Fix numbers not loading from DB --> DB IS NOT THE CULPRIT? THE CONTROLLEr IS
}
