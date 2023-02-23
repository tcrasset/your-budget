// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:your_budget/components/add_dialog.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/modifyCategories/modify_categories.dart';

class ModifySubcategoryRow extends StatelessWidget {
  final UniqueId id;
  final Name name;
  const ModifySubcategoryRow({super.key, required this.name, required this.id});

  Future<void> handleSubCategoryNameChange(BuildContext context) async {
    const String hintText = "Modify subcategory name";
    // final bloc = context.read<SubcategoryCreatorBloc>();

    final String? subcategoryName = await addDialog(
      context: context,
      title: hintText,
      hintText: hintText,
      successButtonName: "Submit",
      nameValidator: validateCategoryName,
    );
    if (subcategoryName != null) {
      // bloc.add(CategoryCreatorEvent.nameChanged(categoryName));
      // bloc.add(const CategoryCreatorEvent.saved());
    }
  }

  Future<String?> _showDeleteDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Subcategory ${name.getOrCrash()} ?'),
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
    // final bloc = context.read<SubcategoryCreatorBloc>();
    final String? result = await _showDeleteDialog(context);

    if (result == "Delete") {
      // bloc.add(SubcategoryCreatorEvent.delete(id));
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
                name.getOrCrash(),
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
