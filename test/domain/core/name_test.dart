// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';

void main() {
  test('verify that Name constructor assigns correct value', () {
    //!Arrange
    const String tName = "Test name";

    //!Act
    final result = Name(tName);

    final String name = result.value.getOrElse(null);
    //!Assert
    expect(name, tName);
  });

  test('verify that a too long name returns a ValueFailure.longName', () {
    //!Arrange
    final String tName = List.generate(Name.maxLength + 1, (index) => 'a').join();
    final tFailure = ValueFailure<String>.longName(failedValue: tName);
    //!Act
    final result = Name(tName);
    //!Assert

    result.value.fold(
      (failure) => expect(failure, tFailure),
      (correct) => throw TestFailure("Should have executed `failed`"),
    );
  });

  test('verify that an empty name returns a EmptyName ValueFailure', () {
    //!Arrange
    const String tName = "";
    const tFailure = ValueFailure<String>.emptyName(failedValue: tName);
    //!Act
    final result = Name(tName);
    //!Assert

    result.value.fold(
      (failure) => expect(failure, tFailure),
      (correct) => throw TestFailure("Should have executed `failed`"),
    );
  });
}
