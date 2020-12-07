import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/categories.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/screens/deleteCategories/DeleteCategories.dart';
import 'package:your_budget/screens/modifyCategories/components/modifyMainCategoryRow.dart';
import 'package:your_budget/screens/modifyCategories/components/modifySubCategoryRow.dart';

import '../../components/widgetViewClasses.dart';

class ModifyCategories extends StatefulWidget {
  @override
  _ModifyCategoriesController createState() => _ModifyCategoriesController();
}

class _ModifyCategoriesController extends State<ModifyCategories> {
  void handleAddCategory(BuildContext context) async {
    AppState appState = Provider.of<AppState>(context, listen: false);
    String categoryName = await createAddCategoryDialog(context, "Add new category", "");
    if (categoryName != null) appState.addCategory(categoryName);
  }

  @override
  Widget build(BuildContext context) => _ModifyCategoriesView(this);

  handleDeleteCategory(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteCategories()));
  }
}

class _ModifyCategoriesView extends WidgetView<ModifyCategories, _ModifyCategoriesController> {
  _ModifyCategoriesView(_ModifyCategoriesController state) : super(state);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);

    List<Category> categories = appState.allCategories;
    if (categories.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Modify categories"),
          actions: <Widget>[
            IconButton(
                icon: Icon(FontAwesomeIcons.trash),
                onPressed: () => state.handleDeleteCategory(context)),
            IconButton(
                icon: Icon(FontAwesomeIcons.plus),
                onPressed: () => state.handleAddCategory(context)),
          ],
        ),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];
            return (item is MainCategory)
                ? ModifyMainCategoryRow(cat: item)
                : ModifySubcategoryRow(subcat: item);
          },
        ),
      );
    }
    return Container();
  }
}

Future<String> createAddCategoryDialog(BuildContext context, String title, String hintText) {
  TextEditingController textController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Form(
            key: _formKey,
            child: TextFormField(
              decoration: new InputDecoration(
                  hintText: hintText, filled: true, fillColor: Colors.grey[200]),
              controller: textController,
              validator: (_) => validateCategoryName(textController.text),
            ),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).pop(textController.text);
                  }
                },
                child: Text("Submit"))
          ],
        );
      });
}

String validateCategoryName(String name) {
  if (name == null || name.isEmpty) return "(Sub)Category name must not be empty.";
  return null;
}
