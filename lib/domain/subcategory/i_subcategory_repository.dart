// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/domain/subcategory/subcategory.dart';
import '../core/value_failure.dart';

// import 'package:your_budget/models/account.dart';

abstract class ISubcategoryRepository {
  Future<Either<ValueFailure, Unit>> create(Subcategory subcategory);
  Future<Either<ValueFailure, Unit>> update(Subcategory subcategory);
  // Future<Either<ValueFailure, Unit>> delete(NewAccount account);
  Future<Either<ValueFailure, List<Subcategory>>> getAllSubcategories();
  Future<Either<ValueFailure, Subcategory>> getToBeBudgetedSubcategory();
  Stream<Either<ValueFailure<dynamic>, List<Subcategory>>> watchAllSubcategories();
  Future<Either<ValueFailure, int?>> count();
}
