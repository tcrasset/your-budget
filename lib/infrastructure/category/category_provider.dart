// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
// Flutter imports:
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/category/category.dart';
import 'package:your_budget/domain/category/i_category_provider.dart';
import 'package:your_budget/domain/core/value_failure.dart';
// Project imports:
import 'package:your_budget/infrastructure/category/category_dto.dart';
import 'package:your_budget/models/constants.dart';

// import 'package:your_budget/domain/subcategory/subcategory.dart';

class SQFliteCategoryProvider implements ICategoryProvider {
  final Database? database;
  SQFliteCategoryProvider({required this.database});

  Future<void> init() async {
    _categoryStreamController.add(await getAllCategories());
  }

  final _categoryStreamController =
      BehaviorSubject<Either<ValueFailure, List<Category>>>.seeded(const Right([]));

  @override
  Future<Either<ValueFailure, int?>> count() async {
    try {
      const sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.categoryTable};
        """;
      final data = await database!.rawQuery(sql);

      return right(Sqflite.firstIntValue(data));
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, int>> create(Category category) async {
    try {
      final categories = [..._categoryStreamController.value!.getOrElse(() => [])];
      final CategoryDTO categoryDTO = CategoryDTO.fromDomain(category);
      final int id = await database!.insert(DatabaseConstants.categoryTable, categoryDTO.toJson());
      categories.add(category);
      _categoryStreamController.add(Right(categories));
      return right(id);
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return left(ValueFailure.uniqueName(failedValue: e.toString()));
      }
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, List<Category>>> getAllCategories() async {
    try {
      const sql = """SELECT * FROM ${DatabaseConstants.categoryTable};""";

      final data = await database!.rawQuery(sql);
      final List<Category> categories = [];
      for (final rawCategory in data) {
        final CategoryDTO categoryDTO = CategoryDTO.fromJson(rawCategory);
        categories.add(categoryDTO.toDomain());
      }

      return right(categories);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<Category>>> watchAllCategories() {
    return _categoryStreamController.asBroadcastStream();
  }
}
