import 'package:flutter/material.dart';
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
    String categoryName = await createAddCategoryDialog(context, "Add new category");
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
                  ? _ModifyCategoryRow(cat: item)
                  : _ModifySubcategoryRow(subcat: item);
            },
          ));
    }
    return Container();
  }
}

class _ModifyCategoryRow extends StatelessWidget {
  final MainCategory cat;
  const _ModifyCategoryRow({Key key, this.cat}) : super(key: key);

  void handleAddSubcategory(BuildContext context) async {
    AppState appState = Provider.of<AppState>(context, listen: false);
    String subcategoryName = await createAddCategoryDialog(context, "Add new subcategory");
    if (subcategoryName != null) appState.addSubcategoryByName(subcategoryName, cat.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              cat.name,
              style: CATEGORY_TEXT_STYLE,
            ),
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.plusCircle),
                    onPressed: () => handleAddSubcategory(context)),
                IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: null)
              ],
            )
          ],
        ));
  }
}

class _ModifySubcategoryRow extends StatelessWidget {
  final SubCategory subcat;
  const _ModifySubcategoryRow({Key key, this.subcat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(subcat.name),
        Row(
          children: <Widget>[IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: null)],
        )
      ],
    ));
  }
}

Future<String> createAddCategoryDialog(BuildContext context, String title) {
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
