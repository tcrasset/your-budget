// Package imports:
import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/core/value_failure.dart';
// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';

abstract class ITransactionProvider {
  Future<Either<ValueFailure, Unit>> create(MoneyTransaction transaction);
  Future<Either<ValueFailure, Unit>> update(MoneyTransaction transaction);
  Future<Either<ValueFailure, Unit>> delete(String id);
  Either<ValueFailure, List<MoneyTransaction>> getAccountTransactions(String id);
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> watchAccountTransactions(
    String id,
  );
}
