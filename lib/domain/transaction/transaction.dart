// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/models/constants.dart';

part 'transaction.freezed.dart';

enum MoneyTransactionType {
  initial("initial"),
  subcategory("subcategory"),
  betweenAccount("betweenAccount"),
  toBeBudgeted("toBeBudgeted");

  const MoneyTransactionType(this.value);

  factory MoneyTransactionType.fromValue(String value) {
    return values.firstWhere((e) => e.value == value);
  }

  final String value;
}

/// Class that defines a MoneyTransaction between the user and another entity.
/// The [amount] is transferred between the user and the entity specified by [payeeID] at the given
/// [date], from the account specified by [accountID] and the subcategory specified
/// by [subcategoryID].
/// A [memo] detailing the transaction is added as well.
@freezed
class MoneyTransaction with _$MoneyTransaction {
  const factory MoneyTransaction({
    required UniqueId id,
    required Subcategory? subcategory,
    required Either<Payee, Account> receiver,
    required Either<Payee, Account> giver,
    required Amount amount,
    required Name memo,
    required DateTime date,
    required MoneyTransactionType type,
  }) = _MoneyTransaction;

  const MoneyTransaction._();

  factory MoneyTransaction.empty() => MoneyTransaction(
        id: UniqueId(),
        subcategory: Subcategory(
          id: UniqueId(),
          categoryID: UniqueId(),
          name: Name(""),
        ),
        giver: Right(Account(id: UniqueId(), name: Name(""), balance: Amount(""))),
        receiver: Left(Payee(id: UniqueId(), name: Name(""))),
        memo: Name(""),
        amount: Amount(""),
        date: DateTime.now(),
        type: MoneyTransactionType.subcategory,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    final bool isBetweenAccountTransactionWithSelectedSubcategory =
        giver.isRight() && receiver.isRight() && subcategory != null && subcategory!.isSelectable();

    if (isBetweenAccountTransactionWithSelectedSubcategory) {
      // Between account transactions should not have a subcategory selected
      return some(const ValueFailure.betweenAccountTransactionWithSubcategorySelected());
    }

    final bool isInflowTransactionNotIntoToBeBudgeted = !amount.getOrCrash().isNegative &&
        subcategory!.name.getOrCrash() != DatabaseConstants.TO_BE_BUDGETED;

    if (isInflowTransactionNotIntoToBeBudgeted) {
      // Inflow transactions with Payee can only be made towards TO_BE_BUDGETED subcategory
      return some(const ValueFailure.inflowTransactionNotIntoToBeBudgeted());
    }

    final bool isOutflowTransactionFromToBeBudgeted = amount.getOrCrash().isNegative &&
        subcategory!.name.getOrCrash() == DatabaseConstants.TO_BE_BUDGETED;

    if (isOutflowTransactionFromToBeBudgeted) {
      // Outflow transactions cannot be made from TO_BE_BUDGETED.
      return some(const ValueFailure.outflowTransactionFromToBeBudgeted());
    }
    return amount.failureOrUnit.andThen(memo.failureOrUnit).fold(
          (f) => some(f),
          (_) => none(),
        );
  }

  Name get receiverName => receiver.fold((payee) => payee.name, (account) => account.name);
  Name get giverName => giver.fold((payee) => payee.name, (account) => account.name);
  UniqueId get receiverId => receiver.fold((payee) => payee.id, (account) => account.id);
  UniqueId get giverId => giver.fold((payee) => payee.id, (account) => account.id);
  Option<Amount> get receiverBalance => receiver.fold(
        (payee) => none(),
        (account) => some(account.balance),
      );
  Option<Amount> get giverBalance => giver.fold(
        (payee) => none(),
        (account) => some(account.balance),
      );
}
