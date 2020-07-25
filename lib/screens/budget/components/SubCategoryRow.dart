import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mybudget/appState.dart';

import 'package:mybudget/models/categories.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/models/constants.dart';
import 'package:mybudget/screens/budget/budgetPageState.dart';
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
  BudgetPageState buttonDialState;

  void handleOnTap() {
    buttonDialState.toggleButtonDial(widget.subcat.id);
    buttonDialState.updateIsSelected(widget.subcat.id);
  }

  @override
  void initState() {
    buttonDialState = Provider.of<BudgetPageState>(context, listen: false);
    buttonDialState.addEntry(widget.subcat.id);

    appState = Provider.of(context, listen: false);

    _budgetedController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
    super.initState();
  }

  @override
  void dispose() {
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

    return GestureDetector(
      onTap: state.handleOnTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: state.buttonDialState.isSelected(widget.subcat.id) ? Colors.grey[200] : Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              widget.subcat.name,
              style: Constants.SUBCATEGORY_TEXT_STYLE,
            )),
            Expanded(
              child: TextFormField(
                  readOnly: true,
                  decoration: new InputDecoration.collapsed(
                    hintText: "",
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: state._budgetedController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(12)
                  ], //To remove length counter
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.right,
                  style: Constants.SUBCATEGORY_TEXT_STYLE,
                  // When the user presses the 'Enter' key, update the respective entry in the database
                  onFieldSubmitted: (String value) => state.handleSubcategoryBudgetedChange()),
            ),
            Expanded(
              child: Text(
                "${widget.subcat.available.toStringAsFixed(2)} €",
                textAlign: TextAlign.right,
                style: widget.subcat.available > 0 ? _greenNumberTextStyle : _redNumberTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
