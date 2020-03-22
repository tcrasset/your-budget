import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mybudget/entries.dart';

//Custom imports
import 'addCategoryPage.dart';
import 'package:mybudget/categories.dart';
import 'package:mybudget/database_creator.dart';

class BudgetPage extends StatefulWidget {
  //First page you see when opening the app

  BudgetPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  //TODO: Edit and delete subcategory

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
          List<SubCategory> toAdd = dbSubcategories
              .where((subcat) => subcat.parentId == cat.id)
              .toList();
          // toAdd.forEach((subcat) => print(subcat.available));
          cat.addMultipleSubcategories(toAdd);

        allCategoryList = dbMaincategories;
      setState(() {
        _updateAllCategoryList();
        });
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
                    onPressed: () async {

                        // int accountCount = await SQLQueries.accountCount();
                        // Account account = Account(accountCount, "Savings account", 999.66);
                        // SQLQueries.addAccount(account);
                        // print("Added account $account");

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
                    Divider(height: 1, color: Colors.black12),
                itemBuilder: (context, index) {
                  final item = allCategoryList[index];
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
      MaterialPageRoute(
          builder: (context) =>
              AddSubcategoryRoute(categories: allCategoryList)),
    );

    if (returnElements != null) {
      var parentId = returnElements[0].id;

      SQLQueryClass.subcategoryCount().then((nextSubcategoryId) {
        SubCategory newSubcategory =
            SubCategory(nextSubcategoryId, parentId, returnElements[1], 0, 0);
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
}

/// Widget containing and displaying the information of a category
class MainCategoryRow extends StatefulWidget {
  MainCategory cat;
  MainCategoryRow({Key key, @required this.cat}) : super(key: key);

  @override
  _MainCategoryRowState createState() => _MainCategoryRowState();
}

class _MainCategoryRowState extends State<MainCategoryRow> {

  TextEditingController _nameController;
  final _categoryTextStyle = TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0);


  final mainCategoryBox = new SizedBox(
    height: 8.0,
    child: new Center(
      child: new Container(
        height: 8.0,
        color: new Color(0xFFE8E8E8),
      ),
    ),
  );

  @override
  void initState(){
    super.initState();
    _nameController = new TextEditingController(text:'${widget.cat.name}');
  }

  @override
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        mainCategoryBox,
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: new InputDecoration.collapsed(hintText: "",),
                  controller: _nameController,
                  textAlign: TextAlign.left,
                  inputFormatters: [LengthLimitingTextInputFormatter(25)], //To remove length counter
                  textInputAction: TextInputAction.done,
                  style: _categoryTextStyle,
                  onFieldSubmitted: (String value) {
                    print("Changed available value in subcategory");
                    if (_nameController.text != widget.cat.name) {
                      setState(() {
                            widget.cat.name = _nameController.text;
                      });
                      SQLQueryClass.updateCategory(widget.cat);
                    }
                  },
                ) 
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
class SubcategoryRow extends StatefulWidget {
  SubCategory subcat;
  SubcategoryRow({Key key, @required this.subcat}) : super(key: key);

  @override
  _SubcategoryRowState createState() => _SubcategoryRowState();
}

class _SubcategoryRowState extends State<SubcategoryRow> {
  MoneyMaskedTextController _budgetedController;
  MoneyMaskedTextController _availableController;
  TextEditingController _nameController;
  
  final TextStyle _subcategoryTextStyle = new TextStyle(color: Colors.black, fontSize: 16.0);
  final TextStyle _greenNumberTextStyle = new TextStyle(color: Colors.green, fontSize: 16.0);
  final TextStyle _redNumberTextStyle = new TextStyle(color: Colors.red, fontSize: 16.0);

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: '${widget.subcat.name}');
    
    _availableController = new MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
    
    _budgetedController = new MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');      
  }

  @override
  void dispose() {
    _availableController.dispose();
    _budgetedController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  //TODO : Update MainCategory budget when subcategory budget is changed
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
            child: TextFormField(
                decoration: new InputDecoration.collapsed(hintText: "",),
                controller: _nameController,
                textAlign: TextAlign.left,
                inputFormatters: [LengthLimitingTextInputFormatter(25)], //To remove length counter
                textInputAction: TextInputAction.done,
                style: _subcategoryTextStyle,
                onFieldSubmitted: (String value) {
                print("Changed available value in subcategory");
                  if (_nameController.text != widget.subcat.name) {
                    setState(() {
                      widget.subcat.name = _nameController.text;
                      SQLQueryClass.updateSubcategory(widget.subcat);
                   });
                  };
                },
            ) 
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
                if (_budgetedController.numberValue != widget.subcat.budgeted) {
                  setState(() {
                    widget.subcat.budgeted = _budgetedController.numberValue;
                  });
                  SQLQueryClass.updateSubcategory(widget.subcat);
                }
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
              style: widget.subcat.available > 0 ? _greenNumberTextStyle : _redNumberTextStyle,
              // When the user presses the 'Enter' key, update the respective entry in the database
              onFieldSubmitted: (String value) {
                print("Changed available value in subcategory");
                if (_budgetedController.numberValue != widget.subcat.available) {
                  setState(() {
                    widget.subcat.available = _availableController.numberValue;
                  });
                  SQLQueryClass.updateSubcategory(widget.subcat);
                }
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
