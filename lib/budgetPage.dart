import 'package:flutter/material.dart';
import 'addCategory.dart';

abstract class Category {
  String name;
  double budgeted = 0.00;
  double available = 0.00;

  Category(this.name);
}

class SubCategory extends Category {

  SubCategory(String name): super(name);
  //TODO: Edit and delete subcategory
}

class MainCategory extends Category {

  List<SubCategory> subcategories = [];

  MainCategory(String name): super(name);


  void updateFields(){
    double budgeted = 0;
    double available = 0;
    subcategories.forEach((SubCategory cat){budgeted += cat.budgeted;});
    subcategories.forEach((SubCategory cat){available += cat.available;});

    this.budgeted = budgeted;
    this.available = available;
  }

  void addSubcategory(SubCategory newSub){// String subCategoryName, double budgeted, double available){
  //   SubCategory newSub = SubCategory(name: subCategoryName, 
  //                                   budgeted : budgeted,
  //                                   available : available);
    print("Adding ${newSub.name} to ${this.name}");
    this.subcategories.add(newSub);
    updateFields();
  }

  //TODO: Edit and delete category
}

// class MyBudget extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Very Own Budget App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BudgetPage(title: 'Bugdet Page'),
//     );
//   }
// }

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
    SubCategory newSub1 =  SubCategory("Car");
    SubCategory newSub2 =  SubCategory("Laptop");
    newSub1.budgeted = 1000.00;
    newSub1.available = 754.00;
    newSub2.budgeted = 1400.00;
    newSub2.available = 888.00;
    savings.addSubcategory(newSub1);
    savings.addSubcategory(newSub2);

    MainCategory funMoney = MainCategory("FunMoney");
    SubCategory newSub3 =  SubCategory("Going out");
    SubCategory newSub4 =  SubCategory("Eating out");
    newSub3.budgeted = 50.00;
    newSub3.available = 36.00;
    newSub4.budgeted = 25.00;
    newSub4.available = 25.00;
    funMoney.addSubcategory(newSub3);
    funMoney.addSubcategory(newSub4);

    categories.add(savings);
    savings.subcategories.forEach((subcat) => categories.add(subcat));
    categories.add(funMoney);
    funMoney.subcategories.forEach((subcat) => categories.add(subcat));
    
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
    setState(() {
       categories.add(MainCategory(newCategoryName));
       _updateCategoriesList();
    });
  }


  _navigateAndAddSubcategory(BuildContext context) async {
    final returnElements = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSubcategoryRoute(categories: categories)),
          );

    SubCategory newSub4 =  SubCategory(returnElements[1]);
    setState(() {
      returnElements[0].addSubcategory(newSub4);
      _updateCategoriesList();
    }); 
  }

  _updateCategoriesList() {
    List<Category> updatedList = [];
    for(var cat in categories){
      if(cat is MainCategory){
        updatedList.add(cat);
        cat.subcategories.forEach((subcat) => updatedList.add(subcat));
      }
    }
    categories = updatedList;
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
            Text('${cat.budgeted}', textAlign: TextAlign.center)
            ],) ,
        ),
        Expanded(
          child: Column(children: <Widget>[
            Text('Available', textAlign: TextAlign.center),
            Text('${cat.available}', textAlign: TextAlign.center)
            ],) ,
        ),
      ],
    );
  }

  Widget subCategoryRow(SubCategory subcat) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(subcat.name, textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('${subcat.budgeted}', textAlign: TextAlign.center),
        ),
        Expanded(
          child: Text('${subcat.available}', textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

