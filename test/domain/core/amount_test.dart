// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';

void main() {
  // test('verify that Name constructor assigns correct value', () {
  //   //!Arrange
  //   const double tAmount = 88365.65;

  //   //!Act
  //   final result = Amount(tAmount.toString());
  //   final double name = result.value.getOrElse(null);

  //   //!Assert
  //   expect(name, tAmount);
  // });

  test('verify that a too big amount returns a ValueFailure.tooBigAmount', () {
    //!Arrange
    final String tAmount = "1${Amount.maxValue}"; //Appending 1 to largest number
    final tFailure = ValueFailure<String>.tooBigAmount(failedValue: tAmount);
    //!Act
    final result = Amount(tAmount);
    //!Assert

    result.value.fold(
      (failure) => expect(failure, tFailure),
      (correct) => throw TestFailure("Should have executed `failed`"),
    );
  });

  test('verify that a non-numerical amount returns a ValueFailure.invalidAmount', () {
    //!Arrange
    const String tAmount = "notanamount";
    const tFailure = ValueFailure<String>.invalidAmount(failedValue: tAmount);
    //!Act
    final result = Amount(tAmount);
    //!Assert

    result.value.fold(
      (failure) => expect(failure, tFailure),
      (correct) => throw TestFailure("Should have executed `failed`"),
    );
  });
}
