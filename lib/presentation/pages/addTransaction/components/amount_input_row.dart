// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/utils/currency.dart' as currencyUtils;
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/currency_input_formatter.dart';

// ignore: avoid_classes_with_only_static_members
class CurrencyOperations {
  static String addMinusSign(String amount) => "-$amount";
  static String removeMinusSign(String amount) => amount.replaceAll("-", "").trim();
  static String removeSymbol(String amount) =>
      amount.replaceAll(Constants.CURRENCY_FORMAT.currencySymbol, "").trim();
  static String removeAllButNumbers(String amount) => removeMinusSign(removeSymbol(amount));
  static String formatAmount(double amount) => currencyUtils.format(amount).trim();
  static final String zero = currencyUtils.format(0);
}

class AmountField extends StatelessWidget {
  const AmountField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: const AmountInputRow(
        onAmountChange: _onAmountChange,
        validateAmount: _validateAmount,
      ),
    );
  }
}

void _onAmountChange(BuildContext context, String value) =>
    context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.amountChanged(value));

String? _validateAmount(BuildContext context) {
  final state = context.read<TransactionCreatorBloc>().state;

  if (state.showErrorMessages == false) {
    // Don't show error messages after a successful save.
    return null;
  }

  return state.moneyTransaction.amount.value.fold(
    (f) => _failAmountClosure(f),
    (_) => null,
  );
}

String? _failAmountClosure(ValueFailure f) => f.maybeMap(
      tooBigAmount: (_) => "Must be smaller than ${Amount.MAX_VALUE}",
      invalidAmount: (_) => "Please specify an amount.",
      orElse: () => null,
    );

class AmountInputRow extends HookWidget {
  final void Function(BuildContext, String) onAmountChange;
  final String? Function(BuildContext) validateAmount;
  //TODO: Extract Container logic so that it is self-sufficient
  const AmountInputRow({
    super.key,
    required this.onAmountChange,
    required this.validateAmount,
  });

  double? getAmount(TransactionCreatorState state) {
    final value = state.moneyTransaction.amount.value.fold((f) => null, (v) => v);
    return value;
  }

  void updateAmountInController(
      BuildContext context, TransactionCreatorState state, TextEditingController controller) {
    // Every modification of the amount value (except initialization) gets passed through the bloc
    // Thus, here is the only time where we have to cast from number to String
    // and where we have to change the selection
    double? amount = getAmount(state);
    print("getAmount amount: $amount");
    print("getAmount zero: ${CurrencyOperations.zero}");
    if (amount == null) {
      controller.text = CurrencyOperations.zero;
      return;
    }

    final String cleanAmount =
        CurrencyOperations.removeAllButNumbers(CurrencyOperations.formatAmount(amount));
    final bool isZeroAmount =
        cleanAmount == CurrencyOperations.removeAllButNumbers(CurrencyOperations.zero);
    final String finalAmount = isZeroAmount
        ? CurrencyOperations.formatAmount(currencyUtils.parse(cleanAmount).toDouble())
        : CurrencyOperations.formatAmount(amount);

    controller
      ..text = finalAmount
      ..selection = TextSelection.collapsed(offset: controller.text.length);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        useTextEditingController(text: CurrencyOperations.zero);
    final isPositive = useState(true);

    return BlocConsumer<TransactionCreatorBloc, TransactionCreatorState>(
      listenWhen: (p, c) => getAmount(p) != getAmount(c),
      listener: (context, state) => updateAmountInController(context, state, controller),
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: AmountInput(
                // key: const Key("AmountInput"),
                isPositive: isPositive,
                controller: controller,
                changeAmount: onAmountChange,
                validateAmount: validateAmount,
              ),
            ),
            AmountSwitch(
              controller: controller,
              isPositive: isPositive,
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

  const AmountSwitch({
    super.key,
    required this.controller,
    required this.isPositive,
    required this.onAmountChange,
  });

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
    super.key,
    required this.controller,
    required this.isPositive,
    required this.validateAmount,
    required this.changeAmount,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle positiveAmountTextStyle =
        TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
    const TextStyle negativeAmountTextStyle = TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

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
      style: isPositive.value ? positiveAmountTextStyle : negativeAmountTextStyle,
      validator: (_) => validateAmount(context),
      onChanged: (value) => changeAmount(context, value),
      onTap: () => changeAmount(context, CurrencyOperations.zero),
    );
  }
}
