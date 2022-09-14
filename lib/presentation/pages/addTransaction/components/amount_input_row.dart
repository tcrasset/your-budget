// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import '../../../../models/constants.dart';
import 'currency_input_formatter.dart';

// ignore: avoid_classes_with_only_static_members
class CurrencyOperations {
  static String addMinusSign(String amount) => "-$amount";
  static String removeMinusSign(String amount) => amount.replaceAll("-", "").trim();
  static String removeSymbol(String amount) =>
      amount.replaceAll(Constants.CURRENCY_FORMAT.currencySymbol, "").trim();
  static String formatAmount(double amount) => Constants.CURRENCY_FORMAT.format(amount).trim();
  static final zero = Constants.CURRENCY_FORMAT.format(0);
}

class AmountInputRow extends HookWidget {
  final void Function(BuildContext, String) onAmountChange;
  final String? Function(BuildContext) validateAmount;
  //TODO: Extract Container logic so that it is self-sufficient
  const AmountInputRow({
    Key? key,
    required this.onAmountChange,
    required this.validateAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller =
        useTextEditingController(text: CurrencyOperations.zero);
    final _isPositive = useState(true);

    String? _getAmount(TransactionCreatorState state) {
      final value = state.moneyTransaction.amount.value.fold(
        (f) => null,
        (v) => CurrencyOperations.formatAmount(v),
      );
      return value;
    }

    return BlocConsumer<TransactionCreatorBloc, TransactionCreatorState>(
      listenWhen: (p, c) => _getAmount(p) != _getAmount(c),
      listener: (context, state) {
        // Every modification of the amount value (except initialization) gets passed through the bloc
        // Thus, here is the only time where we have to cast from number to String
        // and where we have to change the selection
        String? amount = _getAmount(state);
        if (amount == null) return;
        _controller
          ..text = amount
          ..selection = TextSelection.collapsed(offset: _controller.text.length);
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: AmountInput(
                key: const Key("AmountInput"),
                isPositive: _isPositive,
                controller: _controller,
                changeAmount: onAmountChange,
                validateAmount: validateAmount,
              ),
            ),
            AmountSwitch(
              controller: _controller,
              isPositive: _isPositive,
              // toggleSwitch: toggleSwitch,
              onAmountChange: onAmountChange,
            )
          ],
        );
      },
    );
  }
}

class AmountSwitch extends StatelessWidget {
  final ValueNotifier<bool> isPositive;
  final TextEditingController controller;
  final void Function(BuildContext, String) onAmountChange;

  // final Function(BuildContext, TextEditingController, ValueNotifier<bool>) toggleSwitch;
  const AmountSwitch({
    Key? key,
    required this.controller,
    required this.isPositive,
    required this.onAmountChange,
    // required this.toggleSwitch,
  }) : super(key: key);

  void toggleSwitch(
    BuildContext context,
    TextEditingController? controller,
    ValueNotifier<bool> isPositive,
  ) {
    isPositive.value = !isPositive.value;
    final String newAmount = isPositive.value
        ? CurrencyOperations.removeMinusSign(controller!.text)
        : CurrencyOperations.addMinusSign(controller!.text);
    onAmountChange(context, newAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isPositive.value,
      onChanged: (_) => toggleSwitch(context, controller, isPositive),
      activeTrackColor: Constants.GREEN_COLOR,
      activeColor: Colors.grey[300],
      activeThumbImage: const AssetImage("assets/plus.png"),
      inactiveThumbImage: const AssetImage("assets/minus.png"),
      inactiveTrackColor: Constants.RED_COLOR,
      inactiveThumbColor: Colors.grey[300],
    );
  }
}

class AmountInput extends StatelessWidget {
  final ValueNotifier<bool> isPositive;
  final TextEditingController controller;
  final String? Function(BuildContext) validateAmount;
  final void Function(BuildContext, String) changeAmount;

  const AmountInput({
    Key? key,
    required this.controller,
    required this.isPositive,
    required this.validateAmount,
    required this.changeAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle _positiveAmountTextStyle =
        TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
    const TextStyle _negativeAmountTextStyle =
        TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

    return TextFormField(
      decoration: const InputDecoration(
        hintText: "",
        enabledBorder: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      controller: controller,
      inputFormatters: [
        CurrencyInputFormatter(Constants.CURRENCY_FORMAT, isPositive.value),
      ],
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.right,
      style: isPositive.value ? _positiveAmountTextStyle : _negativeAmountTextStyle,
      validator: (_) => validateAmount(context),
      onChanged: (value) => changeAmount(context, value),
      onTap: () => changeAmount(context, CurrencyOperations.zero),
    );
  }
}
