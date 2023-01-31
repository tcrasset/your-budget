import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/models/constants.dart';

class SQFliteConstantsProvider implements IConstantsProvider {
  final Database? database;
  SQFliteConstantsProvider({required this.database});

  @override
  Future<Either<ValueFailure, DateTime>> getStartingBudgetDate() async {
    try {
      final failureOrData = await _get(DatabaseConstants.STARTING_BUDGET_DATE);

      return failureOrData.fold(
        (l) => left(l),
        (r) => right(DateTime.fromMillisecondsSinceEpoch(int.parse(r))),
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, DateTime>> getMaxBudgetDate() async {
    final failureOrData = await _get(DatabaseConstants.MAX_BUDGET_DATE);

    return failureOrData.fold(
      (l) => left(l),
      (r) => right(DateTime.fromMillisecondsSinceEpoch(int.parse(r))),
    );
  }

  @override
  Future<Either<ValueFailure, double>> getToBeBudgeted() async {
    final failureOrData = await _get(DatabaseConstants.TO_BE_BUDGETED);

    return failureOrData.fold(
      (l) => left(l),
      (r) => optionOf(double.tryParse(r)).fold(
        () => left(const ValueFailure.unexpected(message: "Could not load to be budgeted")),
        (a) => right(a),
      ),
    );
  }

  @override
  Future<Either<ValueFailure, Unit>> setToBeBudgeted(double toBeBudgeted) async {
    return _update(DatabaseConstants.TO_BE_BUDGETED, toBeBudgeted.toStringAsPrecision(2));
  }

  @override
  Future<Either<ValueFailure, Unit>> setMaxBudgetDate(DateTime newMaxBudgetDate) async {
    final failureOrUnit = await _update(
      DatabaseConstants.MAX_BUDGET_DATE,
      newMaxBudgetDate.millisecondsSinceEpoch.toString(),
    );

    return failureOrUnit.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<ValueFailure, Unit>> _update(String name, String value) async {
    late int updateCount;
    try {
      updateCount = await database!.update(
        DatabaseConstants.constantsTable,
        {
          DatabaseConstants.CONSTANT_VALUE: value,
        },
        where: '${DatabaseConstants.CONSTANT_NAME} = ?',
        whereArgs: [name],
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    if (updateCount != 1) {
      return left(
        ValueFailure.unexpected(message: "Could not update constant $name with value $value"),
      );
    }

    return right(unit);
  }

  @override
  Future<Either<ValueFailure, String>> _get(String name) async {
    late List<Map<String, Object?>> result;
    try {
      result = await database!.query(
        DatabaseConstants.constantsTable,
        columns: [DatabaseConstants.CONSTANT_VALUE],
        where: '${DatabaseConstants.CONSTANT_NAME} = ?',
        whereArgs: [name],
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
    if (result.isEmpty) {
      return left(ValueFailure.unexpected(message: "Constant $name not found"));
    }

    return right(result.first[DatabaseConstants.CONSTANT_VALUE].toString());
  }

  @override
  Future<Either<ValueFailure, Unit>> _create(String name, String value) async {
    const String CREATE_CONSTANT = '''
    INSERT INTO ${DatabaseConstants.constantsTable}
      (${DatabaseConstants.CONSTANT_NAME}, ${DatabaseConstants.CONSTANT_VALUE})
      VALUES(?, ?);''';

    late int result;
    try {
      result = await database!.rawInsert(CREATE_CONSTANT, [name, value]);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    if (result == 0) {
      return left(
        ValueFailure.unexpected(message: "Could not create constant $name with value $value"),
      );
    }

    return right(unit);
  }
}
