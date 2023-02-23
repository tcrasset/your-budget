// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/components/add_dialog.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/modifyCategories/components/add_subcategory_dialog.dart';
import 'package:your_budget/presentation/pages/modifyCategories/modify_categories.dart';

class ModifyMainCategoryRow extends StatelessWidget {
  final Name name;
  final UniqueId id;

  const ModifyMainCategoryRow({super.key, required this.name, required this.id});

  Future<void> handleAddSubcategory(BuildContext context) async {
    const String hintText = "Add new subcategory";

    final String? subcategoryName = await addSubcategoryDialog(superContext: context);

    if (subcategoryName != null) {
      // final AppState appState = Provider.of<AppState>(context, listen: false);
      // appState.addSubcategory(subcategoryName: subcategoryName, mainCategoryId: cat!.id.toString());
    }
  }

  Future<void> handleMainCategoryNameChange(BuildContext context) async {
    const String hintText = "Modify category name";
    final String? categoryName = await addDialog(
      context: context,
      title: hintText,
      hintText: hintText,
      successButtonName: "Submit",
      nameValidator: validateCategoryName,
    );
    if (categoryName != null) {
      // final AppState appState = Provider.of<AppState>(context, listen: false);
      // appState.updateCategoryName(MainCategory(id: cat!.id, name: categoryName));
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
                    child: Text(
                      name.getOrCrash(),
                      style: TextStyle(
                        fontSize: Constants.CATEGORY_TEXT_STYLE.fontSize,
                        fontWeight: Constants.CATEGORY_TEXT_STYLE.fontWeight,
                        color: Constants.SECONDARY_COLOR,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.circlePlus),
                    color: Constants.SECONDARY_COLOR,
                    onPressed: () => handleAddSubcategory(context),
                  ),
                  // IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: null)
                ],
              )
            ],
          ),
          const SizedBox(
            height: 2.0,
            child: ColoredBox(
              color: Constants.SECONDARY_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
