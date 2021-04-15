// import 'dart:js_util';

// import 'package:dartz/dartz.dart';
// import 'package:your_budget/domain/core/value_failure.dart';
// import 'package:your_budget/domain/core/value_object.dart';

// class AmountInput {
//   String value;
//   bool isPositive;
//   int amountLength;
//   AmountInput(this.value) : assert(value != null);

//   void updateAmountLength() {
//     amountLength = isPositive ? 16 : 17;
//   }

//   void addMinusSign() {
//     value = "-$value";
//   }

//   void removeMinusSign() {
//     value = value.substring(1);
//   }

//   void setAmountToZero() {
//     final String zero = currencyNumberFormat.format(0).trim();
//     amountController.text = isPositive ? zero : "-$zero";
//   }
// }
