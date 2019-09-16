import 'package:flutter/material.dart';
import 'package:mybudget/categories.dart';
import 'package:mybudget/database_creator.dart';

//Custom imports
import 'addCategoryPage.dart';

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

  List<Category> allCategoryList; //List containing MainCategories and SubCategories

  @override
  void initState() {
    //Initialize the state to get the categories from the Widget
    super.initState();
    
    //Waiting for the database to get back to us
    Future.wait([SQLQueries.getCategories(), SQLQueries.getSubCategories()])
    .then((List responses) {

      List<MainCategory> dbMaincategories = responses[0]; 
      List<SubCategory> dbSubcategories = responses[1];

/*      if(dbMaincategories.isNotEmpty){
        print("Categories in database:");
        dbMaincategories.forEach((cat) => print(cat.name));
      }
      if(dbSubcategories.isNotEmpty){
        print("Subcategories in database:");
        dbSubcategories.forEach((subcat) => print(subcat.name));
      }
*/      
      //To each category, add the correspondent subcategories
      dbMaincategories.forEach((cat) {
        List <SubCategory> toAdd= dbSubcategories.where((subcat) => subcat.parentId == cat.id).toList();
        cat.addMultipleSubcategories(toAdd);
      });
      
      //When it does, we update the state of the widget
      setState(() {
        allCategoryList = dbMaincategories;
        _updateAllCategoryList();
      });
      
    }).catchError((e) =>  print('Caught error: $e'));
  }
  

  @override
  Widget build(BuildContext context) {

    //While waiting for the database, return empty container
    if(allCategoryList == null) {
      return new Container();
    }

    // When the database is loaded, show the complete page
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Button for adding new Category (goes to new Page)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal:8),
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
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
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
              child: 
                ListView.separated(
                  itemCount: allCategoryList.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(height:1, color: new Color(0xFFE8E8E8)),
                  itemBuilder: (context, index) {
                    final item = allCategoryList[index];
                    if (item is MainCategory) {
                      return mainCategoryRow(item);
                    } else if (item is SubCategory) {
                      return subCategoryRow(item);
                    } else {
                      return null;
                    }
                  },
                ),
            )
          ],
        )
    );
  }

  /// Navigates to a new page to add a Category
  /// That page returns a new name , and setState updates the current
  /// name shown on the ListView
  _navigateAndAddCategory(BuildContext context) async {
    final newCategoryName = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCategoryRoute()),
          );
    
    if(newCategoryName != null) {
      setState(() {
        allCategoryList.add(MainCategory(1, newCategoryName));
        _updateAllCategoryList();
      });
    }
  }

  /// Navigates to a new page to add a SubCategory
  /// That page returns a new name , and setState updates the current
  /// name shown on the ListView
  _navigateAndAddSubcategory(BuildContext context) async {
    final returnElements = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSubcategoryRoute(categories: allCategoryList)),
          );

    if(returnElements != null) {
      SubCategory newSub4 =  SubCategory(1,1,returnElements[1],0,0);
      setState(() {
        returnElements[0].addSubcategory(newSub4);
        _updateAllCategoryList();
      }); 
    }
  }

  /// Updates the list of categories/subcategories in the ListView after a change
  _updateAllCategoryList() {
    List<Category> updatedList = [];
    for(var cat in allCategoryList){
      if(cat is MainCategory){
        updatedList.add(cat);
        cat.subcategories.forEach((subcat) => updatedList.add(subcat));
      }
    }
    allCategoryList = updatedList;
  }

  /// Widget cointaining and displaying the information of the category [cat]
  Widget mainCategoryRow(MainCategory cat){
    TextStyle categoryTextStyle =  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0);
    SizedBox myBox = new SizedBox(
                    height: 8.0,
                    child: new Center(
                      child: new Container(
                        height: 8.0,
                        color: new Color(0xFFE8E8E8),
                      ),
                    ),
                  );
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
                      Text(cat.name, 
                        textAlign: TextAlign.left,
                        style: categoryTextStyle
                    ) 
                  ],),
                ) ,
                Expanded(
                  child: Column(  
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[                  
                      Text('Budgeted', 
                          textAlign: TextAlign.right,
                          style: categoryTextStyle
                    ),
                      Text('${cat.budgeted}', 
                            textAlign: TextAlign.right,
                            style: categoryTextStyle
                      )
                  ],),
                ),
              
                Expanded(
                  child: Column(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                    
                    Text('Available',
                          textAlign: TextAlign.right,
                          style: categoryTextStyle),
                    Text('${cat.available}',
                          textAlign: TextAlign.right,
                          style: categoryTextStyle)
                  ],),
                ) ,
              ],
            ),
        ),
      ],
    );
  }

  /// Widget cointaining and displaying the information of the SubCategory [subcat]
  Widget subCategoryRow(SubCategory subcat) {
    var subcategoryTextStyle = new TextStyle(
                color: Colors.black,
                fontSize: 16.0);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.symmetric(horizontal:10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(subcat.name,
                        textAlign: TextAlign.left,
                        style: subcategoryTextStyle),
          ),
          Expanded(
            child: Text('${subcat.budgeted}',
                        textAlign: TextAlign.right,
                        style: subcategoryTextStyle)
          ),
          Expanded(
            child: Text('${subcat.available}',                         
                        textAlign: TextAlign.right,
                        style: subcategoryTextStyle)),
        ],
      ),
    );
  }
}








