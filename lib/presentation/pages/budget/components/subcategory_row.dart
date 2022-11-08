// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/currency_input_formatter.dart';

// Widget containing and displaying the information a subcategory

class SubcategoryRow extends HookWidget {
  final Subcategory subcat;
  const SubcategoryRow({Key? key, required this.subcat}) : super(key: key);

  void handleOnTap() {}

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
    final double budgeted = subcat.budgeted.getOrCrash();
    final double available = subcat.available.getOrCrash();
    final TextEditingController _budgetedController =
        useTextEditingController(text: Constants.CURRENCY_FORMAT.format(budgeted));

    final budgetedText = _budgetedController.text;
    final availableText = Constants.CURRENCY_FORMAT.format(available);

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
                subcat.name.getOrCrash(),
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
                    color: setColor(budgeted),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                  ),
                  child: Text(
                    budgetedText,
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
                    color: setColor(available),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(9.0),
                    ),
                  ),
                  child: Text(
                    availableText,
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
