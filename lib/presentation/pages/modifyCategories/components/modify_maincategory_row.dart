// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../../appstate.dart';
import '../../../../components/add_dialog.dart';
import '../../../../models/categories.dart';
import '../../../../models/constants.dart';
import '../modify_categories.dart';

class ModifyMainCategoryRow extends StatelessWidget {
  final MainCategory cat;

  const ModifyMainCategoryRow({Key key, this.cat}) : super(key: key);

  Future<void> handleAddSubcategory(BuildContext context) async {
    const String hintText = "Add new subcategory";
    final String subcategoryName = await addDialog(
        context: context,
        title: hintText,
        hintText: hintText,
        successButtonName: "Submit",
        nameValidator: validateCategoryName);
    if (subcategoryName != null) {
      final AppState appState = Provider.of<AppState>(context, listen: false);
      appState.addSubcategory(
          subcategoryName: subcategoryName, maincategoryId: cat.id);
    }
  }

  Future<void> handleMainCategoryNameChange(BuildContext context) async {
    const String hintText = "Modify category name";
    final String categoryName = await addDialog(
        context: context,
        title: hintText,
        hintText: hintText,
        successButtonName: "Submit",
        nameValidator: validateCategoryName);
    if (categoryName != null) {
      final AppState appState = Provider.of<AppState>(context, listen: false);
      appState.updateCategoryName(MainCategory(id: cat.id, name: categoryName));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                            fontWeight:
                                Constants.CATEGORY_TEXT_STYLE.fontWeight,
                            color: Constants.SECONDARY_COLOR)),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: const Icon(FontAwesomeIcons.plusCircle),
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
            ),
          ),
        ],
      ),
    );
  }
}
