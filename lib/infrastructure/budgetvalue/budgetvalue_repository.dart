// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
// Project imports:
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/infrastructure/budgetvalue/bugetvalue_dto.dart';
import 'package:your_budget/infrastructure/subcategory/subcategory_dto.dart';
import 'package:your_budget/models/constants.dart';

// import 'package:your_budget/domain/subcategory/subcategory.dart';

class SQFliteBudgetValueRepository implements IBudgetValueRepository {
  final Database? database;
  SQFliteBudgetValueRepository({required this.database});

  @override
  Future<Either<ValueFailure, int?>> count() async {
    try {
      const sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.budgetValueTable};
        """;
      final data = await database!.rawQuery(sql);

      return right(Sqflite.firstIntValue(data));
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> create(BudgetValue budgetvalue) async {
    try {
      final BudgetValueDTO budgetvalueDTO = BudgetValueDTO.fromDomain(budgetvalue);
      await database!.insert(DatabaseConstants.budgetValueTable, budgetvalueDTO.toJson());
      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> update(BudgetValue budgetvalue) async {
    try {
      final BudgetValueDTO budgetvalueDTO = BudgetValueDTO.fromDomain(budgetvalue);
      String id = budgetvalueDTO.id;
      final Map<String, dynamic> values = budgetvalueDTO.toJson();
      values.remove("id");

      final result = await database!.update(
        DatabaseConstants.budgetValueTable,
        values,
        where: '${DatabaseConstants.BUDGET_VALUE_ID} = ?',
        whereArgs: [id],
      );

      if (result == 0) {
        return left(ValueFailure.unexpected(message: "BudgetValue with id $id not found"));
      }

      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, BudgetValue>> get({
    required int year,
    required int month,
    required UniqueId subcategoryId,
  }) async {
    try {
      final result = await database!.query(
        DatabaseConstants.budgetValueTable,
        where:
            '${DatabaseConstants.BUDGET_VALUE_YEAR} = ? and ${DatabaseConstants.BUDGET_VALUE_MONTH} = ? and ${DatabaseConstants.SUBCAT_ID_OUTSIDE} = ?',
        whereArgs: [year, month, subcategoryId.getOrCrash()],
      );

      final BudgetValueDTO budgetValueDTO = BudgetValueDTO.fromJson(result.first);
      return right(budgetValueDTO.toDomain());
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, List<BudgetValue>>> getAllBudgetValues(
      {required int year, required int month}) async {
    try {
      final result = await database!.query(
        DatabaseConstants.budgetValueTable,
        where:
            '${DatabaseConstants.BUDGET_VALUE_YEAR} = ? and ${DatabaseConstants.BUDGET_VALUE_MONTH} = ?',
        whereArgs: [year, month],
      );

      final List<BudgetValue> budgetvalues = [];

      for (final rawBudgetValue in result) {
        final BudgetValueDTO budgetvalueDTO = BudgetValueDTO.fromJson(rawBudgetValue);
        budgetvalues.add(budgetvalueDTO.toDomain());
      }

      return right(budgetvalues);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<BudgetValue>>> watchAllBudgetValues(
      {required int year, required int month}) {
    return getAllBudgetValues(year: year, month: month).asStream();
  }

  // @override
  // Future<Either<ValueFailure, BudgetValue>> getToBeBudgetedBudgetValue() async {
  //   try {
  //     const sql = """
  //       SELECT * FROM ${DatabaseConstants.budgetValueTable}
  //       WHERE ${DatabaseConstants.SUBCAT_NAME}  = '${DatabaseConstants.TO_BE_BUDGETED}';
  //       """;

  //     final data = await database!.rawQuery(sql);
  //     final BudgetValueDTO budgetvalueDTO = BudgetValueDTO.fromJson(data.first);
  //     final BudgetValue subcategory = budgetvalueDTO.toDomain();

  //     return right(subcategory);
  //   } on DatabaseException catch (e) {
  //     return left(ValueFailure.unexpected(message: e.toString()));
  //   }
  // }
}
