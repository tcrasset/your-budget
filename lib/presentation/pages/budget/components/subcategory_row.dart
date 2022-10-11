// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/budget/budget_page_state.dart';

// Widget containing and displaying the information a subcategory

class SubcategoryRow extends StatefulWidget {
  final Subcategory subcat;
  const SubcategoryRow({Key? key, required this.subcat}) : super(key: key);

  @override
  _SubcategoryRowState createState() => _SubcategoryRowState();
}

class _SubcategoryRowState extends State<SubcategoryRow> {
  AppState? appState;
  // MoneyMaskedTextController? _budgetedController;
  late BudgetPageState buttonDialState;

  void handleOnTap() {
    // if (!buttonDialState.isSelected(widget.subcat.id.getOrCrash())) {
    //   // buttonDialState.budgetedController = _budgetedController;
    // }
    // buttonDialState.toggleButtonDial(widget.subcat.id.getOrCrash());
    // buttonDialState.updateIsSelected(widget.subcat.id.getOrCrash());
  }

  Color? setColor(double availableAmount) {
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
    // state._budgetedController!.updateValue(widget.subcat.budgeted!);

    return GestureDetector(
      onTap: handleOnTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: true ? Colors.grey[200] : Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                widget.subcat.name.getOrCrash(),
                style: Constants.SUBCATEGORY_TEXT_STYLE,
              ),
            ),
            const Expanded(
              child: TextField(
                readOnly: true,
                enabled: false, //transparent for taps
                decoration: InputDecoration.collapsed(
                  hintText: "",
                ),
                // controller: state._budgetedController,
                textAlign: TextAlign.right,
                style: Constants.SUBCATEGORY_TEXT_STYLE,
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: setColor(widget.subcat.available.getOrCrash()),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                  ),
                  child: Text(
                    "${widget.subcat.budgeted.getOrCrash().toStringAsFixed(2)} €",
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: setColor(widget.subcat.available.getOrCrash()),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                  ),
                  child: Text(
                    "${widget.subcat.available.getOrCrash().toStringAsFixed(2)} €",
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
