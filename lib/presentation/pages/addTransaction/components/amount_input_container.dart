// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// import 'package:intl/intl.dart';
// import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';

// import '../../../../models/constants.dart';
// import 'currency_input_formatter.dart';

// class AmountInputContainer extends HookWidget {
//   // Create number controller
//   /// This [TextFormField] handles the amount selected while providing
//   /// an intuitive experience to the user, who does not need to manually
//   /// separators and currencies.
//   /// The length is limited by a [LengthLimitingTextInputFormatter] to
//   /// [state.amountLength] which is equivalent to a maximal value of
//   /// 999.999.999,99 €.
//   /// The currency format is handled by [CurrencyInputFormatter].
//   /// [onTap()] resets the value to a chosen default value.

//   const AmountInputContainer({
//     Key key,
//   }) : super(key: key);

//   void onNameChange(BuildContext context, String value) {
//     // context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.nameChanged(
//     //       value,
//     //     ));
//   }

//   String _failNameClosure(dynamic f) {
//     // final result = f.maybeMap(
//     //   longName: (_) => "Must be smaller than ${Name.maxLength}",
//     //   emptyName: (_) => "Must not be empty",
//     //   orElse: () => null,
//     // );

//     // return result is String ? result : null;
//   }

//   String validateName(BuildContext context) {
//     // return context.read<TransactionCreatorBloc>().state.account.name.value.fold(
//     //       (f) => _failNameClosure(f),
//     //       (_) => null,
//     //     );
//   }

//   String getName(TransactionCreatorState state) {
//     // return state.account.name.value.fold(
//     //     (_) => null,
//     //     (v) {
//     //       return v;
//     //     },
//     //   );
//   }

//   void handleAmountOnTap() {
//     _setAmountToZero();
//     _setOffsetToLastDigit();
//   }

//   void handleAmountOnSave() {
//     _amount = formatCurrencyToDouble(amountController.text, isPositive);
//   }

//   void handleSwitchOnChanged() {
//     setState(() {
//       isPositive = !isPositive;

//       final bool positiveWithMinusSign = isPositive && amountController.text[0] == '-';
//       if (positiveWithMinusSign) {
//         _removeMinusSign();
//       } else if (!isPositive) _addMinusSign();

//       _updateAmountLength();
//       _setOffsetToLastDigit();
//     });
//   }

//   void _updateAmountLength() {
//     amountLength = isPositive ? 16 : 17;
//   }

//   void _addMinusSign() {
//     amountController.text = "-${amountController.text}";
//   }

//   void _removeMinusSign() {
//     amountController.text = amountController.text.substring(1);
//   }

//   String handleAmountValidate(String value) {
//     if (formatCurrencyToDouble(amountController.text, isPositive) == 0) {
//       return "Value must be different than 0";
//     }
//     return null;
//   }

//   void _setAmountToZero() {
//     final String zero = currencyNumberFormat.format(0).trim();
//     amountController.text = isPositive ? zero : "-$zero";
//   }

//   void _setOffsetToLastDigit() {
//     amountController.selection = TextSelection.collapsed(offset: amountController.text.length - 2);
//   }

//   @override
//   Widget build(BuildContext context) {
//     const TextStyle _positiveAmountTextStyle =
//         TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
//     const TextStyle _negativeAmountTextStyle =
//         TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

//     final controller = useTextEditingController();
//     return BlocConsumer<TransactionCreatorBloc, TransactionCreatorState>(
//       listenWhen: (p, c) => getName(p) != getName(c),
//       listener: (context, state) {
//         controller
//           ..text = getName(state)
//           ..selection = TextSelection.collapsed(offset: controller.text.length);
//       },
//       builder: (context, state) {
//         final int amountLength = state.amountLength;
//         final NumberFormat currencyNumberFormat = state.currencyNumberFormat;
//         final bool isPositive = state.isPositive;
//         return Container(
//             alignment: Alignment.centerRight,
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 hintText: "",
//                 helperText: "",
//                 enabledBorder: InputBorder.none,
//               ),
//               keyboardType: TextInputType.number,
//               controller: controller,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(amountLength),
//                 CurrencyInputFormatter(currencyNumberFormat, isPositive),
//               ],
//               textInputAction: TextInputAction.done,
//               textAlign: TextAlign.right,
//               style: isPositive ? _positiveAmountTextStyle : _negativeAmountTextStyle,
//               validator: (value) => validateName(value),
//               // onSaved: state.han dleAmountOnSave(),
//               onTap: () => state.handleAmountOnTap(),
//             ));
//       },
//     );
//   }
// }
