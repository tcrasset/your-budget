// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:your_budget/application/budget/budget_bloc/budget_bloc.dart';
import 'package:your_budget/domain/budget/budget_entry.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/currency_input_formatter.dart';
import 'package:your_budget/utils/currency.dart' as currency_utils;

// Widget containing and displaying the information a subcategory

class BudgetEntryRow extends HookWidget {
  final BudgetEntry entry;
  const BudgetEntryRow({super.key, required this.entry});

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
    final double budgeted = entry.budgeted.getOrCrash();
    final double available = entry.available.getOrCrash();
    final TextEditingController budgetedController =
        useTextEditingController(text: Constants.CURRENCY_FORMAT.format(budgeted).trim());
    budgetedController.selection = TextSelection.collapsed(offset: budgetedController.text.length);

    final availableText = Constants.CURRENCY_FORMAT.format(available).trim();
    final FocusNode budgetedFocusNode = useFocusNode();

    return GestureDetector(
      onTap: () => budgetedFocusNode.hasFocus
          ? budgetedFocusNode.unfocus()
          : FocusScope.of(context).requestFocus(budgetedFocusNode),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.grey[200],
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                entry.name.getOrCrash(),
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
                  child: TextField(
                    onTap: () => budgetedController.selection =
                        TextSelection.collapsed(offset: budgetedController.text.length),
                    keyboardType: TextInputType.number,
                    controller: budgetedController,
                    decoration: const InputDecoration.collapsed(hintText: ""),
                    focusNode: budgetedFocusNode,
                    inputFormatters: [
                      CurrencyInputFormatter(Constants.CURRENCY_FORMAT, isPositive: true),
                    ],
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    onSubmitted: (submitted) => context.read<BudgetBloc>().add(
                          BudgetEvent.budgetValueModified(
                            entry.budgetValue.copyWith(
                              budgeted: Amount(currency_utils.parse(submitted).toString()),
                            ),
                          ),
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
