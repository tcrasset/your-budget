// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/infrastructure/subcategory/subcategory_dto.dart';
import 'package:your_budget/models/categories.dart';
import '../../domain/core/value_failure.dart';
import '../../domain/subcategory/i_subcategory_repository.dart';
import '../../models/constants.dart';

// import 'package:your_budget/domain/subcategory/subcategory.dart';

class SQFliteSubcategoryRepository implements ISubcategoryRepository {
  final Database? database;
  SQFliteSubcategoryRepository({required this.database});

  @override
  Future<Either<ValueFailure, int?>> count() async {
    try {
      const sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.subcategoryTable};
        """;
      final data = await database!.rawQuery(sql);

      return right(Sqflite.firstIntValue(data));
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, int>> create(Subcategory subcategory) async {
    try {
      final SubcategoryDTO subcategoryDTO = SubcategoryDTO.fromDomain(subcategory);
      final int id =
          await database!.insert(DatabaseConstants.subcategoryTable, subcategoryDTO.toJson());
      return right(id);
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return left(ValueFailure.uniqueName(failedValue: e.toString()));
      }
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, List<Subcategory>>> getAllSubcategories() async {
    try {
      const sql = """SELECT * FROM ${DatabaseConstants.subcategoryTable};""";

      final data = await database!.rawQuery(sql);
      final List<Subcategory> subcategories = [];
      for (final rawSubcategory in data) {
        final SubcategoryDTO subcategoryDTO = SubcategoryDTO.fromSQL(rawSubcategory);
        subcategories.add(subcategoryDTO.toDomain());
      }

      return right(subcategories);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<Subcategory>>> watchAllSubcategories() {
    return getAllSubcategories().asStream();
  }
}
