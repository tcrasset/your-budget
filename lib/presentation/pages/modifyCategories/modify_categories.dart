// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../appstate.dart';
import '../../../components/add_dialog.dart';
import '../../../components/widgetViewClasses.dart';
import '../../../models/categories.dart';
import '../deleteCategories/delete_categories.dart';
import 'components/modify_maincategory_row.dart';
import 'components/modify_subcategory_row.dart';

class ModifyCategories extends StatefulWidget {
  @override
  _ModifyCategoriesController createState() => _ModifyCategoriesController();
}

class _ModifyCategoriesController extends State<ModifyCategories> {
  Future<void> handleAddCategory(BuildContext context) async {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    const String hintText = "Add new category";

    final String? categoryName = await addDialog(
        context: context,
        title: hintText,
        hintText: hintText,
        nameValidator: validateCategoryName,
        successButtonName: "Submit");
    if (categoryName != null) appState.addCategory(categoryName: categoryName);
  }

  @override
  Widget build(BuildContext context) => _ModifyCategoriesView(this);

  void handleDeleteCategory(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DeleteCategories()));
  }
}

class _ModifyCategoriesView extends WidgetView<ModifyCategories, _ModifyCategoriesController> {
  const _ModifyCategoriesView(_ModifyCategoriesController state) : super(state);

  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);

    final List<Category?> categories = appState.allCategories;
    if (categories.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Modify categories"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(FontAwesomeIcons.trash),
                onPressed: () => state.handleDeleteCategory(context)),
            IconButton(
                icon: const Icon(FontAwesomeIcons.plus),
                onPressed: () => state.handleAddCategory(context)),
          ],
        ),
        body: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];
            return (item is MainCategory)
                ? ModifyMainCategoryRow(cat: item)
                : ModifySubcategoryRow(subcat: item as SubCategory?);
          },
        ),
      );
    }
    return Container();
  }
}

String? validateCategoryName(String name) {
  if (name == null || name.isEmpty) return "Name can't be empty.";
  return null;
}
