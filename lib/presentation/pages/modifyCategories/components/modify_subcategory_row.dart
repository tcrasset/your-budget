// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/components/add_dialog.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/modifyCategories/modify_categories.dart';

class ModifySubcategoryRow extends StatelessWidget {
  final SubCategory? subcat;
  const ModifySubcategoryRow({super.key, this.subcat});

  Future<void> handleSubCategoryNameChange(BuildContext context) async {
    const String hintText = "Modify subcategory name";
    final String? subcategoryName = await addDialog(
      context: context,
      title: hintText,
      hintText: hintText,
      successButtonName: "Submit",
      nameValidator: validateCategoryName,
    );
    if (subcategoryName != null) {
      final AppState appState = Provider.of<AppState>(context, listen: false);
      appState.updateSubcategoryName(subcat!.id, subcategoryName);
    }
  }

  Future<String?> _showDeleteDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Subcategory ${subcat!.name} ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop("Cancel");
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Constants.RED_COLOR),
              onPressed: () {
                Navigator.of(context).pop("Delete");
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteSubcategory(BuildContext context) async {
    final String? result = await _showDeleteDialog(context);
    if (result == "Delete") {
      final AppState appState = Provider.of<AppState>(context, listen: false);
      appState.removeSubcategory(subcat!.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleSubCategoryNameChange(context),
      onLongPress: () => deleteSubcategory(context),
      child: SizedBox(
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                subcat!.name!,
                style: TextStyle(
                  fontSize: Constants.SUBCATEGORY_TEXT_STYLE.fontSize,
                  fontWeight: Constants.SUBCATEGORY_TEXT_STYLE.fontWeight,
                ),
              ),
            )
            // Row(
            //   children: <Widget>[IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: null)],
            // )
          ],
        ),
      ),
    );
  }
}
