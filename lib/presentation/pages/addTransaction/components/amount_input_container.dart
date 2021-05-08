// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

  static final _zero = Constants.CURRENCY_FORMAT.format(0);

  void changeAmount(BuildContext context, String value) =>
      _onAmountChange(context, _removeSymbol(value));

  String validateAmount(BuildContext context) =>
      context.read<TransactionCreatorBloc>().state.moneyTransaction.amount.value.fold(
            (f) => _failAccountClosure(f),
            (_) => null,
          );

  String getAmount(TransactionCreatorState state) {
    final value = state.moneyTransaction.amount.value.fold(
      (f) => null,
      (v) => Constants.CURRENCY_FORMAT.format(v).trim(),
    );
    return value;
  }

  void toggleSwitch(
      BuildContext context, TextEditingController controller, ValueNotifier<bool> isPositive) {
    isPositive.value = !isPositive.value;
    final String newAmount =
        isPositive.value ? _removeMinusSign(controller) : _addMinusSign(controller);
    _onAmountChange(context, _removeSymbol(newAmount));
  }

  String _addMinusSign(TextEditingController controller) => "-${controller.text}";
  String _removeMinusSign(TextEditingController controller) => controller.text.replaceAll("-", "");
  String _removeSymbol(String value) =>
      value.replaceAll(Constants.CURRENCY_FORMAT.currencySymbol, "");

  void _onAmountChange(BuildContext context, String value) =>
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

  @override
  Widget build(BuildContext context) {
    const TextStyle _positiveAmountTextStyle =
        TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
    const TextStyle _negativeAmountTextStyle =
        TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

    final _controller = useTextEditingController(text: _zero);
    final _isPositive = useState(true);

    return BlocConsumer<TransactionCreatorBloc, TransactionCreatorState>(
      listenWhen: (p, c) => getAmount(p) != getAmount(c),
      listener: (context, state) {
        // Every modification of the amount value (except initialization) gets passed through the bloc
        // Thus, here is the only time where we have to cast from number to String
        // and where we have to change the selection
        _controller
          ..text = getAmount(state)
          ..selection = TextSelection.collapsed(offset: _controller.text.length);
      },
      builder: (context, state) {
        return Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "",
                        helperText: "",
                        enabledBorder: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _controller,
                      inputFormatters: [
                        CurrencyInputFormatter(Constants.CURRENCY_FORMAT, _isPositive.value),
                      ],
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.right,
                      style:
                          _isPositive.value ? _positiveAmountTextStyle : _negativeAmountTextStyle,
                      validator: (_) => validateAmount(context),
                      onChanged: (value) => changeAmount(context, value),
                      onTap: () => changeAmount(context, _zero)),
                ),
                Switch(
                  value: _isPositive.value,
                  onChanged: (_) => toggleSwitch(context, _controller, _isPositive),
                  activeTrackColor: Constants.GREEN_COLOR,
                  activeColor: Colors.grey[300],
                  activeThumbImage: const AssetImage("assets/plus.png"),
                  inactiveThumbImage: const AssetImage("assets/minus.png"),
                  inactiveTrackColor: Constants.RED_COLOR,
                  inactiveThumbColor: Colors.grey[300],
                )
              ],
            ));
      },
    );
  }
}
