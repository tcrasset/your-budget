// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/models/categories.dart';
import '../../domain/core/value_failure.dart';
import '../../domain/subcategory/i_subcategory_repository.dart';
import '../../models/constants.dart';

// import 'package:your_budget/domain/subcategory/subcategory.dart';

class SQFliteSubcategoryRepository implements ISubcategoryRepository {
  final Database database;
  SQFliteSubcategoryRepository({@required this.database});

  @override
  Future<Either<ValueFailure, int>> count() async {
    try {
      const sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.subcategoryTable};
        """;
      final data = await database.rawQuery(sql);

      return right(Sqflite.firstIntValue(data));
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, int>> create(SubCategory subcategory) async {}

  @override
  Future<Either<ValueFailure, List<SubCategory>>> getAllSubcategories() async {}

  @override
  Stream<Either<ValueFailure<dynamic>, List<SubCategory>>> watchAllSubcategories() {}
}
