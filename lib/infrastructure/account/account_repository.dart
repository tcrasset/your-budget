// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import '../../domain/account/i_account_repository.dart';
import '../../domain/core/value_failure.dart';
import '../../models/account.dart';
import '../../models/constants.dart';
import 'account_dto.dart';

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

  @override
  Future<Either<ValueFailure, Unit>> create(Account account) async {
    try {
      final AccountDTO accountDTO = AccountDTO.fromDomain(account);
      await database.insert(DatabaseConstants.accountTable, accountDTO.toJson());
      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }
}
