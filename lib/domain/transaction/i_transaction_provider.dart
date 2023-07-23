// Package imports:
import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';

abstract class ITransactionProvider {
  Future<Either<ValueFailure<String>, Unit>> create(MoneyTransaction transaction);
  Future<Either<ValueFailure, Unit>> update(MoneyTransaction transaction);
  Future<Either<ValueFailure<String>, Unit>> delete(UniqueId id);
  Either<ValueFailure<String>, List<MoneyTransaction>> getAccountTransactions(UniqueId id);
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> watchAccountTransactions(
    UniqueId id,
  );
}
