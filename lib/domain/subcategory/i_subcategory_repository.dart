// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/models/categories.dart';
import '../core/value_failure.dart';

// import 'package:your_budget/models/account.dart';

abstract class ISubcategoryRepository {
  Future<Either<ValueFailure, int>> create(SubCategory subcategory);
  // Future<Either<ValueFailure, Unit>> update(NewAccount account);
  // Future<Either<ValueFailure, Unit>> delete(NewAccount account);
  Future<Either<ValueFailure, List<SubCategory>>> getAllSubcategories();
  Stream<Either<ValueFailure<dynamic>, List<SubCategory>>> watchAllSubcategories();
  Future<Either<ValueFailure, int>> count();
}
