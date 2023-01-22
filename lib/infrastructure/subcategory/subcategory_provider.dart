// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
// Project imports:
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/infrastructure/subcategory/subcategory_dto.dart';
import 'package:your_budget/models/constants.dart';

// import 'package:your_budget/domain/subcategory/subcategory.dart';

class SQFliteSubcategoryProvider implements ISubcategoryProvider {
  final Database? database;
  SQFliteSubcategoryProvider({required this.database}) {
    _init();
  }

  void _init() async {
    _subcategoryStreamController.add(await getAllSubcategories());
  }

  final _subcategoryStreamController =
      BehaviorSubject<Either<ValueFailure, List<Subcategory>>>.seeded(const Right([]));

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
  Future<Either<ValueFailure, Subcategory>> get(int id) async {
    try {
      final result = await database!.query(
        DatabaseConstants.subcategoryTable,
        where: '${DatabaseConstants.SUBCAT_ID} = ?',
        whereArgs: [id],
      );

      if (result == null) {
        return left(ValueFailure.unexpected(message: "Subcategory with id $id not found"));
      }

      final SubcategoryDTO subcategoryDTO = SubcategoryDTO.fromJson(result.first);
      final Subcategory subcategory = subcategoryDTO.toDomain();

      return right(subcategory);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> create(Subcategory subcategory) async {
    try {
      final subcategories = [..._subcategoryStreamController.value!.getOrElse(() => [])];

      final SubcategoryDTO subcategoryDTO = SubcategoryDTO.fromDomain(subcategory);
      await database!.insert(DatabaseConstants.subcategoryTable, subcategoryDTO.toJson());

      subcategories.add(subcategory);
      _subcategoryStreamController.add(Right(subcategories));

      return right(unit);
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return left(ValueFailure.uniqueName(failedValue: e.toString()));
      }
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> update(Subcategory subcategory) async {
    try {
      final subcategories = [..._subcategoryStreamController.value!.getOrElse(() => [])];
      final index = subcategories.indexWhere((t) => t.id == subcategory.id);
      if (index >= 0) {
        subcategories[index] = subcategory;
        _subcategoryStreamController.add(Right(subcategories));
      } else {
        return left(ValueFailure.unexpected(message: "Subcategory not in current stream."));
      }

      final SubcategoryDTO subcategoryDTO = SubcategoryDTO.fromDomain(subcategory);
      final Map<String, dynamic> values = subcategoryDTO.toJson();
      final id = values.remove("id");

      final result = await database!.update(
        DatabaseConstants.subcategoryTable,
        values,
        where: '${DatabaseConstants.SUBCAT_ID} = ?',
        whereArgs: [id],
      );

      if (result == 0) {
        return left(
            ValueFailure.unexpected(message: "Subcategory with id $id not found in database."));
      }

      return right(unit);
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
        final SubcategoryDTO subcategoryDTO = SubcategoryDTO.fromJson(rawSubcategory);
        subcategories.add(subcategoryDTO.toDomain());
      }

      return right(subcategories);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<Subcategory>>> watchAllSubcategories() {
    return _subcategoryStreamController.asBroadcastStream();
  }

  @override
  Future<Either<ValueFailure, Subcategory>> getToBeBudgetedSubcategory() async {
    try {
      const sql = """
        SELECT * FROM ${DatabaseConstants.subcategoryTable}
        WHERE ${DatabaseConstants.SUBCAT_NAME}  = '${DatabaseConstants.TO_BE_BUDGETED}';
        """;

      final data = await database!.rawQuery(sql);
      final SubcategoryDTO subcategoryDTO = SubcategoryDTO.fromJson(data.first);
      final Subcategory subcategory = subcategoryDTO.toDomain();

      return right(subcategory);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }
}
