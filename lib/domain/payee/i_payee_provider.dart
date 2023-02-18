// Package imports:
import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/core/value_failure.dart';
// Project imports:
import 'package:your_budget/domain/payee/payee.dart';

// import 'package:your_budget/models/payee.dart';

abstract class IPayeeProvider {
  Future<Either<ValueFailure, Unit>> create(Payee payee);
  // Future<Either<ValueFailure, Unit>> update(NewPayee payee);
  // Future<Either<ValueFailure, Unit>> delete(NewPayee payee);
  Future<Either<ValueFailure, List<Payee>>> getAllPayees();
  Future<Either<ValueFailure, Payee>> getStartingBalancePayee();
  Stream<Either<ValueFailure<dynamic>, List<Payee>>> watchAllPayees();
  Future<Either<ValueFailure, int?>> count();
}
