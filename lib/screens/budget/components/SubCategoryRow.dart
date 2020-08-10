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
    if (!buttonDialState.isSelected(widget.subcat.id)) {
      buttonDialState.budgetedController = _budgetedController;
    }
    buttonDialState.toggleButtonDial(widget.subcat.id);
    buttonDialState.updateIsSelected(widget.subcat.id);
  }

  @override
  void initState() {
    super.initState();
    buttonDialState = Provider.of<BudgetPageState>(context, listen: false);
    buttonDialState.setSubcategory(widget.subcat);

    appState = Provider.of(context, listen: false);

    _budgetedController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
  }

  @override
  void dispose() {
    _budgetedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _SubcategoryRowView(this);
}

class _SubcategoryRowView extends WidgetView<SubcategoryRow, _SubcategoryRowController> {
  _SubcategoryRowView(_SubcategoryRowController state) : super(state);

  final TextStyle _greenNumberTextStyle =
      new TextStyle(color: Constants.GREEN_COLOR, fontSize: 16.0);
  final TextStyle _redNumberTextStyle = new TextStyle(color: Constants.RED_COLOR, fontSize: 16.0);

  Color setColor(double availableAmount) {
    if (availableAmount > 0) {
      return Constants.GREEN_COLOR;
    } else if (availableAmount == 0) {
      return Colors.grey[400];
    } else {
      return Constants.RED_COLOR;
    }
  }

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
                child: TextField(
              readOnly: true,
              enabled: false, //transparent for taps
              decoration: new InputDecoration.collapsed(
                hintText: "",
              ),
              controller: state._budgetedController,
              textAlign: TextAlign.right,
              style: Constants.SUBCATEGORY_TEXT_STYLE,
            )),
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: setColor(widget.subcat.available),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  child: Text("${widget.subcat.available.toStringAsFixed(2)} €",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
