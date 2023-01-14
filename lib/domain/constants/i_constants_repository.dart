import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/models/constants.dart';

abstract class IConstantsRepository {
  Future<Either<ValueFailure, DateTime>> getStartingBudgetDate();
  Future<Either<ValueFailure, DateTime>> getMaxBudgetDate();
  Future<Either<ValueFailure, Unit>> setMaxBudgetDate(DateTime newMaxBudgetDate);
}
