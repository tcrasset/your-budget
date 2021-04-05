// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/models/money_transaction.dart';

abstract class ITransactionRepository {
  Future<Either<ValueFailure, Unit>> create(MoneyTransaction plant);
  Future<Either<ValueFailure, Unit>> update(MoneyTransaction plant);
  Future<Either<ValueFailure, Unit>> delete(MoneyTransaction plant);
  Future<Either<ValueFailure, List<MoneyTransaction>>> getAllTransactions();
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>>
      watchAllTransactions();
}
