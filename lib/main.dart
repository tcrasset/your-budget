import 'package:flutter/material.dart';

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

  var subcategories = <SubCategory>[];

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

  BudgetPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {

  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    categories = [];
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCategoryRoute(categories: categories)),
          );
        },
        tooltip: 'Add new category',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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


class AddCategoryRoute extends StatefulWidget {

  final List<Category> categories;

  //Pass the categories from the other Route in the constructor
  AddCategoryRoute({Key key, @required this.categories}) : super(key: key);

  @override
  AddCategoryRouteState createState() => new AddCategoryRouteState();
}

class AddCategoryRouteState extends State<AddCategoryRoute> {

  

  final _catFormKey = GlobalKey<FormState>();
  final _subcatFormKey = GlobalKey<FormState>();
  final myCatController = TextEditingController();
  final mySubcatController = TextEditingController();
  
  var selectedCategory;
  List<Category> categories;

  @override
  void initState() {
    //Initialize the state to get the categories from the Widget
    super.initState();
    categories = widget.categories;
    selectedCategory = categories.first;
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myCatController.dispose();
    mySubcatController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    List<DropdownMenuItem <Category>> dropdownMenuOptions = categories.map((Category category) {
                                            if (category is MainCategory){
                                              return DropdownMenuItem<Category>(
                                                value: category,
                                                child: new Text('${category.name}'),
                                              );
                                            }
                                          }).toList();

    dropdownMenuOptions.removeWhere((category) => category == null);

    print(dropdownMenuOptions);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new category"),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _catFormKey,
            child: Column(
              children: <Widget>[
                Text("Add category"),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  controller:myCatController,
                ),
                
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {

                  },
                  child: Text('Add category'),
                ),
              ),],
            ) 
          ),
          Form(
            key: _subcatFormKey,
            child: Column(
              children: <Widget>[
                Text("Add subcategory"),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  controller:mySubcatController,
                ),
                Text("to the following category"),
                DropdownButton<Category>(
                  // value: selectedCategory,
                  onChanged: (cat) {
                    setState(() {
                      selectedCategory = cat;
                    });
                  },
                  items: dropdownMenuOptions,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {

                    },
                    child: Text("Add subcategory ${mySubcatController.text} to ${selectedCategory.name}"),
                  ),
                )
              ,],
            ) 
          )
        ,] 
      ,)
    );
  }
}
