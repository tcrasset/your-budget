import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/screens/deleteCategories/DeleteCategoriesState.dart';

class CheckedRow extends StatefulWidget {
  final String subcategoryName;
  final int subcategoryId;
  final type;
  final TextStyle textStyle;

  const CheckedRow(this.subcategoryName, this.subcategoryId, this.type, this.textStyle, {Key key})
      : super(key: key);

  @override
  _CheckedRowState createState() => _CheckedRowState();
}

class _CheckedRowState extends State<CheckedRow> {
  bool isChecked = false;

  void handleCheckboxOnChanged(bool value) {
    DeleteCategoriesState showCategoriesState =
        Provider.of<DeleteCategoriesState>(context, listen: false);
    showCategoriesState.updateIsSelected(widget.subcategoryId);
    setState(() {
      isChecked = value;
    });
  }

  @override
  void initState() {
    DeleteCategoriesState showCategoriesState =
        Provider.of<DeleteCategoriesState>(context, listen: false);

    showCategoriesState.setCategories(widget.subcategoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Checkbox(value: isChecked, onChanged: handleCheckboxOnChanged),
          Expanded(
            child: Text(
              widget.subcategoryName,
              style: widget.textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
