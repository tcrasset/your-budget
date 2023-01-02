import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/constants/i_constants_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/models/constants.dart';

class SQFliteConstantsRepository implements IConstantsRepository {
  final Database? database;
  SQFliteConstantsRepository({required this.database});

  @override
  Future<Either<ValueFailure, DateTime>> getStartingBudgetDate() async {
    try {
      const sql = '''
      SELECT ${DatabaseConstants.CONSTANT_VALUE} FROM ${DatabaseConstants.constantsTable}
      WHERE ${DatabaseConstants.CONSTANT_NAME} ==  '${DatabaseConstants.STARTING_BUDGET_DATE}';''';

      final data = await database!.rawQuery(sql);
      int startingBudgetDateMillisecondsSinceEpoch = int.parse(data.first['value'].toString());
      return right(DateTime.fromMillisecondsSinceEpoch(startingBudgetDateMillisecondsSinceEpoch));
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }
}
