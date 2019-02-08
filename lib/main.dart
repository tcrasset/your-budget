import 'package:flutter/material.dart';
import 'addCategory.dart';
void main() => runApp(MyBudget());

abstract class Category {
}

class SubCategory implements Category {
  String name;
  double budgetedAmount;
  double availableAmount;

  SubCategory({this.name = "NoName", this.budgetedAmount = 0.00, this.availableAmount = 0.00});

  //TODO: Edit and delete subcategory
}

class MainCategory implements Category {
  String name;
  double budgetedAmount = 0.00;
  double availableAmount = 0.00;

  List<SubCategory> subcategories = [];

  MainCategory(name){
    this.name = name;
    this.budgetedAmount = 0.00;
    this.availableAmount = 0.00;
  }

  void updateFields(){
    double budgeted = 0;
    double available = 0;
    subcategories.forEach((SubCategory cat){budgeted += cat.budgetedAmount;});
    subcategories.forEach((SubCategory cat){available += cat.availableAmount;});

    this.budgetedAmount = budgeted;
    this.availableAmount = available;
  }

  void addSubcategory(SubCategory newSub){// String subCategoryName, double budgetedAmount, double availableAmount){
  //   SubCategory newSub = SubCategory(name: subCategoryName, 
  //                                   budgetedAmount : budgetedAmount,
  //                                   availableAmount : availableAmount);
    print("Adding ${newSub.name} to ${this.name}");
    this.subcategories.add(newSub);
    updateFields();
  }

  //TODO: Edit and delete category
}

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

  List<Category> categories = [];

  @override
  void initState() {
    //Initialize the state to get the categories from the Widget
    super.initState();

    MainCategory savings = MainCategory("Savings");
    SubCategory newSub1 =  SubCategory(name: "Car", budgetedAmount : 1000.00, availableAmount : 754.00);
    SubCategory newSub2 =  SubCategory(name: "Laptop", budgetedAmount : 1400.00, availableAmount : 888.00);
    savings.addSubcategory(newSub1);
    savings.addSubcategory(newSub2);

    MainCategory funMoney = MainCategory("FunMoney");
    SubCategory newSub3 =  SubCategory(name: "Going out", budgetedAmount : 50.00, availableAmount : 36.00);
    SubCategory newSub4 =  SubCategory(name: "Eating out", budgetedAmount : 25.00, availableAmount : 25.00);
    funMoney.addSubcategory(newSub3);
    funMoney.addSubcategory(newSub4);


    // for(var cat in maincategories){
    //   categories.add(cat);
    //   cat.subcategories.forEach((subcat) => categories.add(subcat));
    // }

    categories.add(savings);
    savings.subcategories.forEach((subcat) => categories.add(subcat));
    categories.add(funMoney);
    funMoney.subcategories.forEach((subcat) => categories.add(subcat));
    
    print(categories);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
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
            Expanded(
              child: 
                ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final item = categories[index];

                    if (item is MainCategory) {
                      return mainCategoryRow(item);
                    } else if (item is SubCategory) {
                      return subCategoryRow(item);
                    }
                  },
                ),
            )
          ],
        )
    );
  }

  _navigateAndAddCategory(BuildContext context) async {
    final newCategoryName = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCategoryRoute()),
          );
    print("Adding $newCategoryName");
    categories.add(MainCategory(newCategoryName));
    print(categories);
  }
  _navigateAndAddSubcategory(BuildContext context) async {
    final newCategoryName = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSubcategoryRoute(categories: categories)),
          );
    // categories.add(MainCategory(newCategoryName));
    print(categories);
  }


  Widget mainCategoryRow(MainCategory cat){
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(children: <Widget>[
            Text(cat.name, textAlign: TextAlign.center),
            ],) 
        ),
        Expanded(
          child: Column(children: <Widget>[
            Text('Budjeted', textAlign: TextAlign.center),
            Text('${cat.budgetedAmount}', textAlign: TextAlign.center)
            ],) ,
        ),
        Expanded(
          child: Column(children: <Widget>[
            Text('Available', textAlign: TextAlign.center),
            Text('${cat.availableAmount}', textAlign: TextAlign.center)
            ],) ,
        ),
      ],
    );
  }

  Widget subCategoryRow(SubCategory subcat) {

    print("Building subcatrow ${subcat.name}");
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(subcat.name, textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('${subcat.budgetedAmount}', textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('${subcat.availableAmount}', textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

