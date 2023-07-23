// Package imports:
import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/core/unique_id.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';

abstract class IBudgetValueProvider {
  Future<Either<ValueFailure, Unit>> create(BudgetValue budgetvalue);
  Future<Either<ValueFailure, Unit>> createAll(List<BudgetValue> newBudgetvalues);
  Future<Either<ValueFailure, BudgetValue>> get({
    required int year,
    required int month,
    required UniqueId subcategoryId,
  });
  Future<Either<ValueFailure, BudgetValue>> getById({required UniqueId id});

  Future<Either<ValueFailure<String>, Unit>> update(BudgetValue budgetvalue);
  Future<Either<ValueFailure<String>, Unit>> updateAll(List<BudgetValue> allBudgetvalues);
  Stream<Either<ValueFailure<dynamic>, List<BudgetValue>>> watchAllBudgetValues({
    required int year,
    required int month,
  });
  Future<Either<ValueFailure<dynamic>, List<BudgetValue>>> getAllBudgetValues();

  Future<Either<ValueFailure<String>, List<BudgetValue>>> getBudgetValuesBySubcategory({
    required UniqueId subcategoryId,
  });

  Future<Either<ValueFailure<dynamic>, List<BudgetValue>>> getBudgetValuesByDate({
    required int year,
    required int month,
  });
  Future<Either<ValueFailure, int?>> count();
}
