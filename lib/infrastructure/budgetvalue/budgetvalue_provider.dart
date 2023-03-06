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
// Project imports:
import 'package:your_budget/infrastructure/budgetvalue/budgetvalue_dto.dart';
import 'package:your_budget/models/constants.dart';

// import 'package:your_budget/domain/subcategory/subcategory.dart';

class SQFliteBudgetValueProvider implements IBudgetValueProvider {
  final Database? database;
  SQFliteBudgetValueProvider({required this.database});

  Future<void> init() async {
    _budgetvalueStreamController.add(await getAllBudgetValues());
  }

  final _budgetvalueStreamController =
      BehaviorSubject<Either<ValueFailure, List<BudgetValue>>>.seeded(const Right([]));

  List<BudgetValue> get _budgetvalues {
    final lastEmitted = _budgetvalueStreamController.value;

    if (lastEmitted == null) {
      // Should not happen as it's seeded with Right([])
      throw Exception();
    }

    return lastEmitted.fold((l) => throw Exception(l), (r) => r);
  }

  @override
  Future<Either<ValueFailure, int>> count() async {
    final budgetvalues = [..._budgetvalues];
    return right(budgetvalues.length);
  }

  @override
  Future<Either<ValueFailure, Unit>> create(BudgetValue budgetvalue) async {
    late int id;
    try {
      id = await database!.insert(
        DatabaseConstants.budgetValueTable,
        BudgetValueDTO.fromDomain(budgetvalue).toJson(),
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    if (id == 0) {
      return left(
        ValueFailure.unexpected(
          message: "BudgetValue with id ${budgetvalue.id} could not be created.",
        ),
      );
    }

    final budgetvalues = [..._budgetvalues];
    budgetvalues.add(budgetvalue);
    _budgetvalueStreamController.add(Right(budgetvalues));

    return right(unit);
  }

  @override
  Future<Either<ValueFailure, Unit>> createAll(List<BudgetValue> newBudgetvalues) async {
    final toCreate = newBudgetvalues.map((item) => BudgetValueDTO.fromDomain(item).toJson());

    int totalCreated = 0;
    try {
      for (final entry in toCreate) {
        final int result = await database!.insert(
          DatabaseConstants.budgetValueTable,
          entry,
        );

        if (result != 0) {
          totalCreated = totalCreated + 1;
        }
      }
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    if (totalCreated != toCreate.length) {
      return left(const ValueFailure.unexpected(message: "Not all budgetvalues were created."));
    }
    final budgetvalues = [..._budgetvalues];
    budgetvalues.addAll(newBudgetvalues);
    _budgetvalueStreamController.add(Right(budgetvalues));
    return right(unit);
  }

  @override
  Future<Either<ValueFailure, Unit>> updateAll(List<BudgetValue> toUpdate) async {
    final bvMap = {for (var item in toUpdate) item.id: BudgetValueDTO.fromDomain(item).toJson()};

    int totalUpdated = 0;
    try {
      for (final entry in bvMap.entries) {
        final int count = await database!.update(
          DatabaseConstants.budgetValueTable,
          entry.value,
          where: '${DatabaseConstants.BUDGET_VALUE_ID} = ?',
          whereArgs: [entry.key.getOrCrash()],
        );
        totalUpdated = totalUpdated + count;
      }
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    if (totalUpdated != toUpdate.length) {
      return left(const ValueFailure.unexpected(message: "Not all budgetvalues were updated."));
    }

    final budgetvalues = [..._budgetvalues];
    final indices = toUpdate
        .map((value) => budgetvalues.indexWhere((stored) => stored.id == value.id))
        .toList();

    indices.asMap().forEach((currentIndex, savingIndex) {
      budgetvalues[savingIndex] = toUpdate[currentIndex];
    });

    _budgetvalueStreamController.add(Right(budgetvalues));
    return right(unit);
  }

  @override
  Future<Either<ValueFailure, Unit>> update(BudgetValue budgetvalue) async {
    try {
      final BudgetValueDTO budgetvalueDTO = BudgetValueDTO.fromDomain(budgetvalue);
      final String id = budgetvalueDTO.id;
      final Map<String, dynamic> values = budgetvalueDTO.toJson();
      values.remove("id");

      final result = await database!.update(
        DatabaseConstants.budgetValueTable,
        values,
        where: '${DatabaseConstants.BUDGET_VALUE_ID} = ?',
        whereArgs: [id],
      );

      if (result == 0) {
        return left(
          ValueFailure.unexpected(
            message: "BudgetValue with id $id not found. Could not update.",
          ),
        );
      }

      final budgetvalues = [..._budgetvalues];
      final index = budgetvalues.indexWhere((t) => t.id == budgetvalue.id);
      if (index >= 0) {
        budgetvalues[index] = budgetvalue;
        _budgetvalueStreamController.add(Right(budgetvalues));
        return right(unit);
      }

      return left(const ValueFailure.unexpected(message: "BudgetValue not in current stream."));
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
    final budgetvalues = [..._budgetvalues];
    final index = budgetvalues.indexWhere(
      (t) => t.subcategoryId == subcategoryId && t.date.year == year && t.date.month == month,
    );
    if (index >= 0) {
      return right(budgetvalues[index]);
    } else {
      return left(const ValueFailure.unexpected(message: "BudgetValue not in current stream."));
    }
  }

  @override
  Future<Either<ValueFailure, BudgetValue>> getById({
    required UniqueId id,
  }) async {
    final budgetvalues = [..._budgetvalues];
    final index = budgetvalues.indexWhere((t) => t.id == id);
    if (index >= 0) {
      return right(budgetvalues[index]);
    } else {
      return left(const ValueFailure.unexpected(message: "BudgetValue not in current stream."));
    }
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
    final budgetvalues = [..._budgetvalues];
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
              List.unmodifiable(
                r.where((element) => element.date.year == year && element.date.month == month),
              ),
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
