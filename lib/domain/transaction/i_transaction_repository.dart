// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../models/money_transaction.dart';
import '../core/value_failure.dart';

abstract class ITransactionRepository {
  Future<Either<ValueFailure, Unit>> create(MoneyTransaction transaction);
  Future<Either<ValueFailure, Unit>> update(MoneyTransaction transaction);
  Future<Either<ValueFailure, Unit>> delete(MoneyTransaction transaction);
  Future<Either<ValueFailure, List<MoneyTransaction>>> getAccountTransactions(int accountID);
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> watchAccountTransactions(
      int accountID);
}
