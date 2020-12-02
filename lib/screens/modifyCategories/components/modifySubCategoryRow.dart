import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/screens/modifyCategories/ModifyCategories.dart';

class ModifySubcategoryRow extends StatelessWidget {
  final SubCategory subcat;
  const ModifySubcategoryRow({Key key, this.subcat}) : super(key: key);

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
        ),
      ),
    );
  }
}
