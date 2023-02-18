import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/core/value_failure.dart';

abstract class IConstantsProvider {
  Future<Either<ValueFailure, DateTime>> getStartingBudgetDate();
  Future<Either<ValueFailure, DateTime>> getMaxBudgetDate();
  Future<Either<ValueFailure, double>> getToBeBudgeted();
  Future<Either<ValueFailure<dynamic>, Unit>> setToBeBudgeted(double toBeBudgeted);
  Future<Either<ValueFailure, Unit>> setMaxBudgetDate(DateTime newMaxBudgetDate);
}
