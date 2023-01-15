// Package imports:
import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/core/unique_id.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';

abstract class IBudgetValueProvider {
  Future<Either<ValueFailure, Unit>> create(BudgetValue budgetvalue);
  Future<Either<ValueFailure, BudgetValue>> get(
      {required int year, required int month, required UniqueId subcategoryId});
  Future<Either<ValueFailure, Unit>> update(BudgetValue budgetvalue);
  Stream<Either<ValueFailure<dynamic>, List<BudgetValue>>> watchAllBudgetValues(
      {required int year, required int month});

  Future<Either<ValueFailure<dynamic>, List<BudgetValue>>> getAllBudgetValues(
      {required int year, required int month});
  Future<Either<ValueFailure, int?>> count();
}
