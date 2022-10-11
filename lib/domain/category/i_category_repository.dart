// Package imports:
import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/category/category.dart';

// Project imports:
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/domain/core/value_failure.dart';

abstract class ICategoryRepository {
  Future<Either<ValueFailure, int>> create(Category Category);
  // Future<Either<ValueFailure, Unit>> update(NewAccount account);
  // Future<Either<ValueFailure, Unit>> delete(NewAccount account);
  Future<Either<ValueFailure, List<Category>>> getAllCategories();
  Stream<Either<ValueFailure<dynamic>, List<Category>>> watchAllCategories();
  Future<Either<ValueFailure, int?>> count();
}
