// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';
import '../core/value_failure.dart';

abstract class ITransactionRepository {
  Future<Either<ValueFailure, Unit>> create(MoneyTransaction transaction);
  Future<Either<ValueFailure, Unit>> update(MoneyTransaction transaction);
  Future<Either<ValueFailure, Unit>> delete(String id);
  Future<Either<ValueFailure, List<MoneyTransaction>>> getAccountTransactions(int accountID);
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> watchAccountTransactions(
    int accountID,
  );
}
