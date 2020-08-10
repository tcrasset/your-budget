import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/constants.dart';
import 'package:provider/provider.dart';

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
                  icon: Icon(FontAwesomeIcons.plus),
                  onPressed: () => state.handleAddCategory(context)),
            ],
          ),
          body: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final item = categories[index];
              return (item is MainCategory)
                  ? _ModifyMainCategoryRow(cat: item)
                  : _ModifySubcategoryRow(subcat: item);
            },
          ));
    }
    return Container();
  }
}

class _ModifyMainCategoryRow extends StatelessWidget {
  final MainCategory cat;

  _ModifyMainCategoryRow({Key key, this.cat}) : super(key: key);

  void handleAddSubcategory(BuildContext context) async {
    String subcategoryName = await createAddCategoryDialog(context, "Add new subcategory", "");
    if (subcategoryName != null) {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.addSubcategoryByName(subcategoryName, cat.id);
    }
  }

  void handleMainCategoryNameChange(BuildContext context) async {
    String categoryName = await createAddCategoryDialog(context, "Modify category name", cat.name);
    if (categoryName != null) {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.updateCategoryName(MainCategory(cat.id, categoryName));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => handleMainCategoryNameChange(context),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(cat.name,
                          style: TextStyle(
                              fontSize: Constants.CATEGORY_TEXT_STYLE.fontSize,
                              fontWeight: Constants.CATEGORY_TEXT_STYLE.fontWeight,
                              color: Constants.SECONDARY_COLOR)),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(FontAwesomeIcons.plusCircle),
                        color: Constants.SECONDARY_COLOR,
                        onPressed: () => handleAddSubcategory(context)),
                    // IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: null)
                  ],
                )
              ],
            ),
            SizedBox(
                height: 2.0,
                child: Container(
                  color: Constants.SECONDARY_COLOR,
                )),
          ],
        ));
  }
}

class _ModifySubcategoryRow extends StatelessWidget {
  final SubCategory subcat;
  const _ModifySubcategoryRow({Key key, this.subcat}) : super(key: key);

  handleSubCategoryNameChange(BuildContext context) async {
    String subcategoryName =
        await createAddCategoryDialog(context, "Modify subcategory name", subcat.name);
    if (subcategoryName != null) {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.updateSubcategory(SubCategory(
          subcat.id, subcat.parentId, subcategoryName, subcat.budgeted, subcat.available));
    }
  }

  Future<String> _showDeleteDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Subcategory ${subcat.name} ?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop("Cancel");
              },
            ),
            FlatButton(
              child: Text('Delete'),
              textColor: Constants.RED_COLOR,
              onPressed: () {
                Navigator.of(context).pop("Delete");
              },
            ),
          ],
        );
      },
    );
  }

  void deleteSubcategory(BuildContext context) async {
    String result = await _showDeleteDialog(context);
    if (result == "Delete") {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.removeSubcategory(subcat.id);
      print("Deleted subcategory");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => handleSubCategoryNameChange(context),
        onLongPress: () => deleteSubcategory(context),
        child: Container(
            color: Colors.blue,
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(subcat.name,
                      style: TextStyle(
                        fontSize: Constants.SUBCATEGORY_TEXT_STYLE.fontSize,
                        fontWeight: Constants.SUBCATEGORY_TEXT_STYLE.fontWeight,
                      )),
                )
                // Row(
                //   children: <Widget>[IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: null)],
                // )
              ],
            )));
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
