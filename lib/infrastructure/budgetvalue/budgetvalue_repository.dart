// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
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
      final Map<String, dynamic> values = budgetvalueDTO.toJson();
      final id = values.remove("id");

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

  Future<Either<ValueFailure, List<BudgetValue>>> getAllBudgetValues() async {
    try {
      const sql = """SELECT * FROM ${DatabaseConstants.budgetValueTable};""";

      final data = await database!.rawQuery(sql);
      final List<BudgetValue> budgetvalues = [];
      for (final rawBudgetValue in data) {
        final BudgetValueDTO budgetvalueDTO = BudgetValueDTO.fromJson(rawBudgetValue);
        budgetvalues.add(budgetvalueDTO.toDomain());
      }

      return right(budgetvalues);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<BudgetValue>>> watchAllBudgetValues() {
    return getAllBudgetValues().asStream();
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
