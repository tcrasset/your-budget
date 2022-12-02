// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:your_budget/application/budget/budget_entry.dart';
import 'package:your_budget/application/budget/budget_entry_manager_bloc/budget_entry_manager_bloc.dart';
import 'package:your_budget/application/core/subcategory_watcher_bloc/subcategory_watcher_bloc.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/utils/currency.dart' as currency_utils;
import 'package:your_budget/presentation/pages/addTransaction/components/currency_input_formatter.dart';

// Widget containing and displaying the information a subcategory

class BudgetEntryRow extends HookWidget {
  final BudgetEntry entry;
  const BudgetEntryRow({Key? key, required this.entry}) : super(key: key);

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
    final TextEditingController _budgetedController =
        useTextEditingController(text: Constants.CURRENCY_FORMAT.format(budgeted).trim());
    _budgetedController.selection =
        TextSelection.collapsed(offset: _budgetedController.text.length);

    final budgetedText = _budgetedController.text;
    final availableText = Constants.CURRENCY_FORMAT.format(available).trim();
    final FocusNode budgetedFocusNode = useFocusNode();

    return GestureDetector(
      onTap: () => budgetedFocusNode.hasFocus
          ? budgetedFocusNode.unfocus()
          : FocusScope.of(context).requestFocus(budgetedFocusNode),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: true ? Colors.grey[200] : Colors.white,
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
                  child: TextField(
                    onTap: () => _budgetedController.selection =
                        TextSelection.collapsed(offset: _budgetedController.text.length),
                    keyboardType: TextInputType.number,
                    controller: _budgetedController,
                    decoration: const InputDecoration.collapsed(hintText: ""),
                    focusNode: budgetedFocusNode,
                    inputFormatters: [
                      CurrencyInputFormatter(Constants.CURRENCY_FORMAT, true),
                    ],
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    onSubmitted: (submitted) => context.read<BudgetEntryManagerBloc>().add(
                          BudgetEntryManagerEvent.budgetedChanged(
                            entry,
                            currency_utils.parse(submitted).toString(),
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
            )
          ],
        ),
      ),
    );
  }
}
