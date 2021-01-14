import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/categories.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/screens/deleteCategories/DeleteCategories.dart';
import 'package:your_budget/screens/modifyCategories/components/modifyMainCategoryRow.dart';
import 'package:your_budget/screens/modifyCategories/components/modifySubCategoryRow.dart';

import '../../components/widgetViewClasses.dart';
import '../../components/addDialog.dart';

class ModifyCategories extends StatefulWidget {
  @override
  _ModifyCategoriesController createState() => _ModifyCategoriesController();
}

class _ModifyCategoriesController extends State<ModifyCategories> {
  void handleAddCategory(BuildContext context) async {
    AppState appState = Provider.of<AppState>(context, listen: false);
    String hintText = "Add new category";

    String categoryName = await addDialog(
        context: context,
        title: hintText,
        hintText: hintText,
        nameValidator: validateCategoryName,
        successButtonName: "Submit");
    if (categoryName != null) appState.addCategory(categoryName: categoryName);
  }

  @override
  Widget build(BuildContext context) => _ModifyCategoriesView(this);

  handleDeleteCategory(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DeleteCategories()));
  }
}

class _ModifyCategoriesView
    extends WidgetView<ModifyCategories, _ModifyCategoriesController> {
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

String validateCategoryName(String name) {
  if (name == null || name.isEmpty) return "Name can't be empty.";
  return null;
}
