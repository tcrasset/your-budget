// Package imports:
import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';

abstract class IBudgetValueRepository {
  Future<Either<ValueFailure, Unit>> create(BudgetValue budgetvalue);
  Future<Either<ValueFailure, Unit>> update(BudgetValue budgetvalue);
  Stream<Either<ValueFailure<dynamic>, List<BudgetValue>>> watchAllBudgetValues();
  Future<Either<ValueFailure, int?>> count();
}
