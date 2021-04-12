// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';

void main() {
  test('verify that Account.empty() returns a valid account', () {
    //!Arrange
    final Account tAccount = Account(id: UniqueId(), name: Name(""), balance: Amount(""));
    //!Act
    final Account account = Account.empty();
    //!Assert
    expect(account.name, tAccount.name);
    expect(account.balance, tAccount.balance);
  });

  test('verify that Account creation fails if any of the fields are invalid', () {
    //!Arrange
    final Account tAccount1 = Account(id: UniqueId(), name: Name(""), balance: Amount("123"));
    final Account tAccount2 = Account(id: UniqueId(), name: Name("aaa"), balance: Amount(""));
    final Account tAccountCorrect =
        Account(id: UniqueId(), name: Name("aaa"), balance: Amount("123"));

    //!Act
    final failureOrUnit1 = tAccount1.failureOption;
    final failureOrUnit2 = tAccount2.failureOption;
    final failureOrUnitCorrect = tAccountCorrect.failureOption;

    // Expect some type of error (empty name or invalid amount)
    expect(failureOrUnit1 == none(), false);
    expect(failureOrUnit2 == none(), false);

    // Expect no error
    expect(failureOrUnitCorrect, none());
    //!Assert
  });
}
