import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/screens/modifyCategories/ModifyCategories.dart';

import '../../../appState.dart';
import '../../../models/categories.dart';
import '../../../models/constants.dart';
import '../../../components/addDialog.dart';

class ModifyMainCategoryRow extends StatelessWidget {
  final MainCategory cat;

  ModifyMainCategoryRow({Key key, this.cat}) : super(key: key);

  void handleAddSubcategory(BuildContext context) async {
    String hintText = "Add new subcategory";
    String subcategoryName = await addDialog(
        context: context,
        title: hintText,
        hintText: hintText,
        successButtonName: "Submit",
        nameValidator: validateCategoryName);
    if (subcategoryName != null) {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.addSubcategory(subcategoryName:subcategoryName, maincategoryId: cat.id);
    }
  }

  void handleMainCategoryNameChange(BuildContext context) async {
    String hintText = "Modify category name";
    String categoryName = await addDialog(
        context: context,
        title: hintText,
        hintText: hintText,
        successButtonName: "Submit",
        nameValidator: validateCategoryName);
    if (categoryName != null) {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.updateCategoryName(MainCategory(id:cat.id, name:categoryName));
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
                            fontWeight:
                                Constants.CATEGORY_TEXT_STYLE.fontWeight,
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
            ),
          ),
        ],
      ),
    );
  }
}
