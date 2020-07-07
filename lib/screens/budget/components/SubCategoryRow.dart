import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mybudget/appState.dart';

import 'package:mybudget/models/categories.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
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
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    appState = Provider.of(context, listen: false);
    _nameController = new TextEditingController(text: '${widget.subcat.name}');

    _availableController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');

    _budgetedController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
  }

  @override
  void dispose() {
    _availableController.dispose();
    _budgetedController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  handleSubcategoryNameChange() {
    //TODO : On focus lost, put back old value

    print("Changed name of subcategory from ${widget.subcat.name} to ${_nameController.text} ");
    if (_nameController.text != widget.subcat.name) {
      setState(() {
        widget.subcat.name = _nameController.text;
      });

      appState.updateSubcategory(widget.subcat);
    }
  }

  /// When the budget value gets changed, change the shown budget value,
  /// but also the available value.
  handleSubcategoryBudgetedChange() {
    print("Changed budgeted value in subcategory");
    if (_budgetedController.numberValue != widget.subcat.budgeted) {
      double beforeAfterDifference = (_budgetedController.numberValue - widget.subcat.budgeted);
      setState(() {
        widget.subcat.budgeted = _budgetedController.numberValue;
        widget.subcat.available += beforeAfterDifference;
      });
      appState.updateSubcategory(widget.subcat);
      appState.updateToBeBudgeted(beforeAfterDifference);
    }
  }

  @override
  Widget build(BuildContext context) => _SubcategoryRowView(this);
}

class _SubcategoryRowView extends WidgetView<SubcategoryRow, _SubcategoryRowController> {
  _SubcategoryRowView(_SubcategoryRowController state) : super(state);

  final TextStyle _subcategoryTextStyle = new TextStyle(color: Colors.black, fontSize: 16.0);
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
              child: TextFormField(
            decoration: new InputDecoration.collapsed(
              hintText: "",
            ),
            controller: state._nameController,
            textAlign: TextAlign.left,
            inputFormatters: [LengthLimitingTextInputFormatter(25)], //To remove length counter
            textInputAction: TextInputAction.done,
            style: _subcategoryTextStyle,
            onFieldSubmitted: (value) => state.handleSubcategoryNameChange(),
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
                style: _subcategoryTextStyle,
                // When the user presses the 'Enter' key, update the respective entry in the database
                onFieldSubmitted: (String value) => state.handleSubcategoryBudgetedChange()),
          ),
          Expanded(
            child: TextField(
              readOnly: true,
              decoration: new InputDecoration.collapsed(hintText: "${widget.subcat.available}"),
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
