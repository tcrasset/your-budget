// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/domain/payee/payee.dart';
import '../core/value_failure.dart';

// import 'package:your_budget/models/payee.dart';

abstract class IPayeeRepository {
  Future<Either<ValueFailure, int>> create(Payee payee);
  // Future<Either<ValueFailure, Unit>> update(NewPayee payee);
  // Future<Either<ValueFailure, Unit>> delete(NewPayee payee);
  Future<Either<ValueFailure, List<Payee>>> getAllPayees();
  Stream<Either<ValueFailure<dynamic>, List<Payee>>> watchAllPayees();
  Future<Either<ValueFailure, int>> count();
}
