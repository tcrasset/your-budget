// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/components/widgetViewClasses.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/budget/budget_page_state.dart';

// Widget containing and displaying the information a subcategory

class SubcategoryRow extends StatefulWidget {
  final SubCategory subcat;
  const SubcategoryRow({Key key, @required this.subcat}) : super(key: key);

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

    _budgetedController = MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: '€');
  }

  @override
  void dispose() {
    _budgetedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _SubcategoryRowView(this);
}

class _SubcategoryRowView
    extends WidgetView<SubcategoryRow, _SubcategoryRowController> {
  const _SubcategoryRowView(_SubcategoryRowController state) : super(state);

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
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: state.buttonDialState.isSelected(widget.subcat.id)
            ? Colors.grey[200]
            : Colors.white,
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
              decoration: const InputDecoration.collapsed(
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
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: setColor(widget.subcat.available),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                  ),
                  child: Text("${widget.subcat.available.toStringAsFixed(2)} €",
                      textAlign: TextAlign.right,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
