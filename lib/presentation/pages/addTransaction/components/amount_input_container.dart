// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import '../../../../models/constants.dart';
import 'currency_input_formatter.dart';

class AmountInputContainer extends HookWidget {
  // Create number controller
  /// This [TextFormField] handles the amount selected while providing
  /// an intuitive experience to the user, who does not need to manually
  /// separators and currencies.
  /// The length is limited by a [LengthLimitingTextInputFormatter] to
  /// [state.amountLength] which is equivalent to a maximal value of
  /// 999.999.999,99 €.
  /// The currency format is handled by [CurrencyInputFormatter].
  /// [onTap()] resets the value to a chosen default value.

  const AmountInputContainer({
    Key key,
  }) : super(key: key);

  void onAmountChange(BuildContext context, String value) =>
      context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.amountChanged(
            value,
          ));

  String _failAccountClosure(ValueFailure f) {
    final result = f.maybeMap(
      tooBigAmount: (_) => "Must be smaller than ${Amount.maxValue}",
      invalidAmount: (_) => "Amount is invalid. Use only numerical characters.",
      orElse: () => null,
    );

    return result is String ? result : null;
  }

  String validateAmount(BuildContext context) =>
      context.read<TransactionCreatorBloc>().state.moneyTransaction.amount.value.fold(
            (f) => _failAccountClosure(f),
            (_) => null,
          );

  String getAmount(TransactionCreatorState state) {
    return state.moneyTransaction.amount.value.fold(
      (_) => null,
      (v) => v.toString(),
    );
  }

  void _resetValue(NumberFormat currencyNumberFormat, TextEditingController controller) {
    _setAmountToZero(currencyNumberFormat, controller);
    _setOffsetToLastDigit(controller);
  }

  // void handleSwitchOnChanged() {
  //   setState(() {
  //     isPositive = !isPositive;

  //     final bool positiveWithMinusSign = isPositive && amountController.text[0] == '-';
  //     if (positiveWithMinusSign) {
  //       _removeMinusSign();
  //     } else if (!isPositive) _addMinusSign();

  //     _updateAmountLength();
  //     _setOffsetToLastDigit();
  //   });
  // }

  // void _updateAmountLength() {
  //   amountLength = isPositive ? 16 : 17;
  // }

  // void _addMinusSign() {
  //   amountController.text = "-${amountController.text}";
  // }

  // void _removeMinusSign() {
  //   amountController.text = amountController.text.substring(1);
  // }

  // String handleAmountValidate(String value) {
  //   if (formatCurrencyToDouble(amountController.text, isPositive) == 0) {
  //     return "Value must be different than 0";
  //   }
  //   return null;
  // }

  void _setAmountToZero(NumberFormat currencyNumberFormat, TextEditingController controller) {
    final String zero = currencyNumberFormat.format(0).trim();
    controller.text = zero;
  }

  void _setOffsetToLastDigit(TextEditingController controller) {
    controller.selection = TextSelection.collapsed(offset: controller.text.length - 2);
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle _positiveAmountTextStyle =
        TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
    const TextStyle _negativeAmountTextStyle =
        TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);
    final NumberFormat currencyNumberFormat =
        NumberFormat.currency(locale: 'de', decimalDigits: 2, symbol: '€');
    const num defaultValue = 0.00;
    final controller = useTextEditingController(text: currencyNumberFormat.format(defaultValue))
      ..selection = TextSelection.collapsed(offset: defaultValue.toString().length);
    _resetValue(currencyNumberFormat, controller);

    return BlocConsumer<TransactionCreatorBloc, TransactionCreatorState>(
      listenWhen: (p, c) => getAmount(p) != getAmount(c),
      listener: (context, state) {
        controller
          ..text = getAmount(state)
          ..selection = TextSelection.collapsed(offset: controller.text.length);
      },
      builder: (context, state) {
        bool isPositive = true;
        return Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "",
                helperText: "",
                enabledBorder: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              controller: controller,
              inputFormatters: [
                CurrencyInputFormatter(currencyNumberFormat, isPositive),
              ],
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.right,
              style: isPositive ? _positiveAmountTextStyle : _negativeAmountTextStyle,
              validator: (_) => validateAmount(context),
              onChanged: (value) => onAmountChange(context, value),
              onTap: () => _resetValue(currencyNumberFormat, controller),
            ));
      },
    );
  }
}
