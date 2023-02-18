// Package imports:
import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/category/category.dart';
import 'package:your_budget/domain/core/value_failure.dart';

abstract class ICategoryProvider {
  Future<Either<ValueFailure, int>> create(Category category);
  // Future<Either<ValueFailure, Unit>> update(NewAccount account);
  // Future<Either<ValueFailure, Unit>> delete(NewAccount account);
  Future<Either<ValueFailure, List<Category>>> getAllCategories();
  Stream<Either<ValueFailure<dynamic>, List<Category>>> watchAllCategories();
  Future<Either<ValueFailure, int?>> count();
}
