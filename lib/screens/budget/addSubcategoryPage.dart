import 'package:flutter/material.dart';
import 'package:mybudget/models/SQLQueries.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/components/widgetViewClasses.dart';

class AddSubcategoryRoute extends StatefulWidget {
  final List<Category> categories;
  AddSubcategoryRoute({Key key, @required this.categories}) : super(key: key);

  @override
  _AddSubcategoryRouteController createState() => _AddSubcategoryRouteController();
}

class _AddSubcategoryRouteController extends State<AddSubcategoryRoute> {
  final _subcatFormKey = GlobalKey<FormState>(); //FormCheck
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

  handleSelectedCategory(Category cat) {
    setState(() {
      selectedCategory = cat;
    });
  }

  Future<dynamic> handleOnButtonPressed() async {
    // Check that the form is valid
    if (_subcatFormKey.currentState.validate()) {
      //Add subcategory to database
      int subcatCount = await SQLQueryClass.subcategoryCount();
      SubCategory subcategory =
          SubCategory(subcatCount, selectedCategory.id, mySubcatController.text, 0.00, 0.00);
      SQLQueryClass.addSubcategory(subcategory);
      var returnElement = [selectedCategory, mySubcatController.text];
      Navigator.pop(context, returnElement);
    }
  }

  List<dynamic> getDropdownMenuOptions() {
    //Only take categories to display in the dropdown menu
    List<DropdownMenuItem<MainCategory>> dropdownMenuOptions = categories.map((Category category) {
      if (category is MainCategory) {
        return DropdownMenuItem<MainCategory>(
          value: category,
          child: new Text('${category.name}'),
        );
      }
      return null;
    }).toList();

    dropdownMenuOptions.removeWhere((category) => category == null);

    return dropdownMenuOptions;
  }

  @override
  Widget build(BuildContext context) => _AddSubcategoryRouteView(this);
}

class _AddSubcategoryRouteView
    extends WidgetView<AddSubcategoryRoute, _AddSubcategoryRouteController> {
  _AddSubcategoryRouteView(_AddSubcategoryRouteController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a new category"),
        ),
        body: Column(
          children: <Widget>[
            Form(
                key: state._subcatFormKey,
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
                      controller: state.mySubcatController,
                    ),
                    Text("to the following category"),
                    DropdownButton<Category>(
                      value: state.selectedCategory,
                      onChanged: (cat) => state.handleSelectedCategory(cat),
                      items: state.getDropdownMenuOptions(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () => state.handleOnButtonPressed(),
                        child: Text("Add subcategory ${state.mySubcatController.text}"
                            "to ${state.selectedCategory.name}"),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
