
import 'package:flutter/material.dart';
import 'package:mybudget/categories.dart';
//import 'budgetPage.dart';


class AddCategoryRoute extends StatefulWidget {

  //Pass the categories from the other Route in the constructor
  AddCategoryRoute({Key key}) : super(key: key);

  @override
  AddCategoryRouteState createState() => new AddCategoryRouteState();
}

class AddCategoryRouteState extends State<AddCategoryRoute> {


  final _catFormKey = GlobalKey<FormState>();
  final myCatController = TextEditingController();
  
  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myCatController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

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
                    if (value.isEmpty) {return 'Please enter some text';}
                    return null;
                  },
                  controller:myCatController,
                ),
                
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    // Check that the form is valid
                    if (_catFormKey.currentState.validate()) {
                      Navigator.pop(context, '${myCatController.text}');
                    }
                  },
                  child: Text('Add category ${myCatController.text}'),
                ),
              ),],
            ) 
          ),] 
      ,)
    );
  }
}




class AddSubcategoryRoute extends StatefulWidget {

  final List<Category> categories;

  //Pass the categories from the other Route in the constructor
  AddSubcategoryRoute({Key key, @required this.categories}) : super(key: key);

  @override
  AddSubcategoryRouteState createState() => new AddSubcategoryRouteState();
}

class AddSubcategoryRouteState extends State<AddSubcategoryRoute> {


  final _subcatFormKey = GlobalKey<FormState>();
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
    mySubcatController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    //Only take categories to display in the dropdown menu
    List<DropdownMenuItem <Category>> dropdownMenuOptions = categories.map((Category category) {
                                            if (category is MainCategory){
                                              return DropdownMenuItem<Category>(
                                                value: category,
                                                child: new Text('${category.name}'),
                                              );
                                            }
                                            return null;
                                          }).toList();

    dropdownMenuOptions.removeWhere((category) => category == null);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new category"),
      ),
      body: Column(
        children: <Widget>[
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
                    return null;
                  },
                  controller:mySubcatController,
                ),
                Text("to the following category"),
                DropdownButton<Category>(
                  value: selectedCategory,
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
                    // Check that the form is valid
                      if (_subcatFormKey.currentState.validate()) {
                        var returnElement = [selectedCategory , mySubcatController.text];
                        Navigator.pop(context, returnElement);
                      }
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
