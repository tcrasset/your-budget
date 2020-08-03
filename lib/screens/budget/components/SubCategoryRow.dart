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
  //TODO : Make toggling buttonDial + highlighting work, while fixing the
  // problem of switching the months not changing the subcategories
  // A wrong approach is moving all the stuff from initState in build,
  // because then highligting doesn't work because all the widgets get built twice.
  void handleOnTap() {
    buttonDialState.toggleButtonDial(widget.subcat.id);
    buttonDialState.updateIsSelected(widget.subcat.id);
    if (!buttonDialState.isSelected(widget.subcat.id)) {
      buttonDialState.budgetedController = _budgetedController;
    }
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
              decoration: new InputDecoration.collapsed(
                hintText: "",
              ),
              controller: state._budgetedController,
              textAlign: TextAlign.right,
              style: Constants.SUBCATEGORY_TEXT_STYLE,
            )),
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
