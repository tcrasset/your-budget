// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/payee.dart';

part 'transaction.freezed.dart';

/// Class that defines a MoneyTransaction between the user and another entity.
/// The [amount] is transfered between the user and the entity specified by [payeeID] at the given
/// [date], from the account specified by [accountID] and the subcategory specified
/// by [subcategoryID].
/// A [memo] detailing the transaction is added as well.
@freezed
abstract class MoneyTransaction implements _$MoneyTransaction {
  const factory MoneyTransaction({
    required UniqueId id,
    required UniqueId subcatID,
    required Name subcatName,
    required UniqueId payeeID,
    required Name payeeName,
    required Payee payee,
    required UniqueId accountID,
    required Name accountName,
    required Amount amount,
    required Name memo,
    required DateTime date,
  }) = _MoneyTransaction;

  const MoneyTransaction._();

  factory MoneyTransaction.empty() => MoneyTransaction(
        id: UniqueId(),
        subcatID: UniqueId(),
        subcatName: Name(""),
        payeeID: UniqueId(),
        payeeName: Name(""),
        payee: Payee(id: UniqueId(), name: Name("")),
        accountID: UniqueId(),
        accountName: Name(""),
        memo: Name(""),
        amount: Amount(""),
        date: DateTime.now(),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return amount.failureOrUnit.andThen(memo.failureOrUnit).fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
