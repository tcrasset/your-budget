import 'package:flutter/material.dart';
import 'package:mybudget/components/overlayNotifications.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:provider/provider.dart';

class AddSubcategoryRoute extends StatefulWidget {
  AddSubcategoryRoute({Key key}) : super(key: key);

  @override
  _AddSubcategoryRouteController createState() => _AddSubcategoryRouteController();
}

class _AddSubcategoryRouteController extends State<AddSubcategoryRoute> {
  final _subcatFormKey = GlobalKey<FormState>();
  final mySubcatController = TextEditingController();
  AppState appState;
  MainCategory selectedCategory;

  @override
  void initState() {
    //Initialize the state to get the categories from the Widget
    super.initState();
    appState = Provider.of<AppState>(context, listen: false);
    selectedCategory = getFirstCategory();
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

  void handleAddSubcategoryAndPopContext() async {
    // Check that the form is valid
    if (selectedCategory == null) {
      showOverlayNotification(context, "You must select a category!");
    } else if (_subcatFormKey.currentState.validate()) {
      //Add subcategory to database
      // + 2 because we do not want to have an ID of 0
      SubCategory subcategory = SubCategory(
          appState.subcategoryCount + 2, selectedCategory.id, mySubcatController.text, 0.00, 0.00);
      appState.addSubcategory(subcategory);

      Navigator.pop(context);
    }

    return;
  }

  List<dynamic> getDropdownMenuOptions() {
    //Only take categories to display in the dropdown menu
    List<DropdownMenuItem<MainCategory>> dropdownMenuOptions =
        this.appState.allCategories.map((Category category) {
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

  MainCategory getFirstCategory() {
    this.appState.allCategories.forEach((cat) {
      if (cat is MainCategory) {
        return cat;
      }
    });
    return null;
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
                        onPressed: () => state.handleAddSubcategoryAndPopContext(),
                        child: Text("Add subcategory ${state.mySubcatController.text}"),
                        //"to ${state.selectedCategory.name}"),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
