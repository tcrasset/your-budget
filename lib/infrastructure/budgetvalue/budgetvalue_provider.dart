// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
// Project imports:
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/infrastructure/budgetvalue/bugetvalue_dto.dart';
import 'package:your_budget/infrastructure/subcategory/subcategory_dto.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';

// import 'package:your_budget/domain/subcategory/subcategory.dart';

class SQFliteBudgetValueProvider implements IBudgetValueProvider {
  final Database? database;
  SQFliteBudgetValueProvider({required this.database}) {
    _init();
  }

  Future<void> _init() async {
    _budgetvalueStreamController.add(await getAllBudgetValues());
  }

  final _budgetvalueStreamController =
      BehaviorSubject<Either<ValueFailure, List<BudgetValue>>>.seeded(const Right([]));

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
      final budgetvalues = [..._budgetvalueStreamController.value!.getOrElse(() => [])];

      final BudgetValueDTO budgetvalueDTO = BudgetValueDTO.fromDomain(budgetvalue);
      await database!.insert(DatabaseConstants.budgetValueTable, budgetvalueDTO.toJson());

      budgetvalues.add(budgetvalue);
      _budgetvalueStreamController.add(Right(budgetvalues));

      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> update(BudgetValue budgetvalue) async {
    try {
      final budgetvalues = [..._budgetvalueStreamController.value!.getOrElse(() => [])];
      final index = budgetvalues.indexWhere((t) => t.id == budgetvalue.id);
      if (index >= 0) {
        budgetvalues[index] = budgetvalue;
        _budgetvalueStreamController.add(Right(budgetvalues));
      } else {
        return left(ValueFailure.unexpected(message: "BudgetValue not in current stream."));
      }

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
    final budgetvalues = [..._budgetvalueStreamController.value!.getOrElse(() => [])];
    final index = budgetvalues.indexWhere(
      (t) => t.subcategoryId == subcategoryId && t.date.year == year && t.date.month == month,
    );
    if (index >= 0) {
      return right(budgetvalues[index]);
    } else {
      return left(ValueFailure.unexpected(message: "BudgetValue not in current stream."));
    }

    // try {
    //   final result = await database!.query(
    //     DatabaseConstants.budgetValueTable,
    //     where:
    //         '${DatabaseConstants.BUDGET_VALUE_YEAR} = ? and ${DatabaseConstants.BUDGET_VALUE_MONTH} = ? and ${DatabaseConstants.SUBCAT_ID_OUTSIDE} = ?',
    //     whereArgs: [year, month, subcategoryId.getOrCrash()],
    //   );

    //   final BudgetValueDTO budgetValueDTO = BudgetValueDTO.fromJson(result.first);
    //   return right(budgetValueDTO.toDomain());
    // } on DatabaseException catch (e) {
    //   return left(ValueFailure.unexpected(message: e.toString()));
    // }
  }

  @override
  Future<Either<ValueFailure, List<BudgetValue>>> getBudgetValuesByDate({
    required int year,
    required int month,
  }) async {
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
  Future<Either<ValueFailure, List<BudgetValue>>> getBudgetValuesBySubcategory({
    required UniqueId subcategoryId,
  }) async {
    final budgetvalues = [..._budgetvalueStreamController.value!.getOrElse(() => [])];
    return right(budgetvalues.where((t) => t.subcategoryId == subcategoryId).toList());
  }

  @override
  Future<Either<ValueFailure, List<BudgetValue>>> getAllBudgetValues() async {
    try {
      return right(
        (await database!.query(DatabaseConstants.budgetValueTable))
            .map((e) => BudgetValueDTO.fromJson(e).toDomain())
            .toList(),
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<BudgetValue>>> watchAllBudgetValues({
    required int year,
    required int month,
  }) {
    return _budgetvalueStreamController.asBroadcastStream().map(
          (event) => event.fold(
            (l) => left(l),
            (r) => right(
              r
                  .where((element) => element.date.year == year && element.date.month == month)
                  .toList(),
            ),
          ),
        );
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
