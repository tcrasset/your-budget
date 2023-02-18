// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/presentation/pages/deleteCategories/delete_categories_state.dart';

class CheckedRow extends StatefulWidget {
  final String? categoryName;
  final int? categoryId;
  final Type type;
  final TextStyle textStyle;

  const CheckedRow(
    this.categoryName,
    this.categoryId,
    this.type,
    this.textStyle, {
    super.key,
  });

  @override
  _CheckedRowState createState() => _CheckedRowState();
}

class _CheckedRowState extends State<CheckedRow> {
  bool? isChecked = false;

  void handleCheckboxOnChanged(bool? value) {
    final DeleteCategoriesState showCategoriesState =
        Provider.of<DeleteCategoriesState>(context, listen: false);
    showCategoriesState.updateIsSelected(widget.categoryId, widget.type);
    setState(() {
      isChecked = value;
    });
  }

  @override
  void initState() {
    final DeleteCategoriesState showCategoriesState =
        Provider.of<DeleteCategoriesState>(context, listen: false);

    showCategoriesState.setCategoriesToFalse(widget.categoryId, widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Checkbox(value: isChecked, onChanged: handleCheckboxOnChanged),
          Expanded(
            child: Text(
              widget.categoryName!,
              style: widget.textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
