import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mybudget/appState.dart';

import 'package:mybudget/models/categories.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/models/constants.dart';
import 'package:provider/provider.dart';

// Widget containing and displaying the information a subcategory

class SubcategoryRow extends StatefulWidget {
  final SubCategory subcat;
  SubcategoryRow({Key key, @required this.subcat}) : super(key: key);

  @override
  _SubcategoryRowController createState() => _SubcategoryRowController();
}

class _SubcategoryRowController extends State<SubcategoryRow> {
  AppState appState;
  MoneyMaskedTextController _budgetedController;
  MoneyMaskedTextController _availableController;

  @override
  void initState() {
    super.initState();
    appState = Provider.of(context, listen: false);

    _availableController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');

    _budgetedController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
  }

  @override
  void dispose() {
    _availableController.dispose();
    _budgetedController.dispose();
    super.dispose();
  }

  /// When the budget value gets changed, change the shown budget value,
  /// but also the available value.
  handleSubcategoryBudgetedChange() {
    print("Changed budgeted value in subcategory");
    if (_budgetedController.numberValue != widget.subcat.budgeted) {
      double beforeAfterDifference = (_budgetedController.numberValue - widget.subcat.budgeted);

      appState.updateSubcategory(SubCategory(
          widget.subcat.id,
          widget.subcat.parentId,
          widget.subcat.name,
          _budgetedController.numberValue,
          widget.subcat.available + beforeAfterDifference));
    }
  }

  @override
  Widget build(BuildContext context) => _SubcategoryRowView(this);
}

class _SubcategoryRowView extends WidgetView<SubcategoryRow, _SubcategoryRowController> {
  _SubcategoryRowView(_SubcategoryRowController state) : super(state);

  final TextStyle _greenNumberTextStyle = new TextStyle(color: Colors.green, fontSize: 16.0);
  final TextStyle _redNumberTextStyle = new TextStyle(color: Colors.red, fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    state._budgetedController.updateValue(widget.subcat.budgeted);
    state._availableController.updateValue(widget.subcat.available);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            widget.subcat.name,
            style: Constants.SUBCATEGORY_TEXT_STYLE,
          )),
          Expanded(
            child: TextFormField(
                decoration: new InputDecoration.collapsed(
                  hintText: "",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: state._budgetedController,
                inputFormatters: [LengthLimitingTextInputFormatter(12)], //To remove length counter
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.right,
                style: Constants.SUBCATEGORY_TEXT_STYLE,
                // When the user presses the 'Enter' key, update the respective entry in the database
                onFieldSubmitted: (String value) => state.handleSubcategoryBudgetedChange()),
          ),
          Expanded(
            child: TextField(
              readOnly: true,
              decoration: new InputDecoration.collapsed(
                  hintText: "${widget.subcat.available.toStringAsFixed(2)}"),
              controller: state._availableController,
              textAlign: TextAlign.right,
              style: widget.subcat.available > 0 ? _greenNumberTextStyle : _redNumberTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
