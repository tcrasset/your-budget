// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/models/constants.dart';

class SQFliteAccountRepository implements IAccountRepository {
  final Database database;
  SQFliteAccountRepository({@required this.database});

  @override
  Future<Either<ValueFailure, int>> count() async {
    try {
      final sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.accountTable};
        """;
      final data = await database.rawQuery(sql);

      return right(Sqflite.firstIntValue(data));
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }
}
