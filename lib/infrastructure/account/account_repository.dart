// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/infrastructure/account/account_dto.dart';

class SQFliteAccountRepository implements IAccountRepository {
  final Database? database;
  SQFliteAccountRepository({required this.database});

  @override
  Future<Either<ValueFailure, int?>> count() async {
    try {
      const sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.accountTable};
        """;
      final data = await database!.rawQuery(sql);

      return right(Sqflite.firstIntValue(data));
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, int>> create(Account account) async {
    try {
      final AccountDTO accountDTO = AccountDTO.fromDomain(account);
      final int id = await database!.insert(DatabaseConstants.accountTable, accountDTO.toJson());

      debugPrint(accountDTO.toString());
      return right(id);
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return left(ValueFailure.uniqueName(failedValue: e.toString()));
      }
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> delete(String id) async {
    try {
      final result = await database!.delete(
        DatabaseConstants.accountTable,
        where: '${DatabaseConstants.ACCOUNT_ID} = ?',
        whereArgs: [id],
      );

      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Account>> get(int accountId) async {
    try {
      final rawAccount = await database!.query(
        DatabaseConstants.accountTable,
        where: '${DatabaseConstants.ACCOUNT_ID} = ?',
        whereArgs: [accountId],
      );
      final AccountDTO accountDTO = AccountDTO.fromJson(rawAccount.first);
      final Account account = accountDTO.toDomain();
      return right(account);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    } catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, List<Account>>> getAllAccounts() async {
    try {
      const sql = """
        SELECT * FROM ${DatabaseConstants.accountTable}
        ORDER BY ${DatabaseConstants.ACCOUNT_BALANCE} DESC;
        """;

      final data = await database!.rawQuery(sql);
      final List<Account> accounts = [];
      for (final rawAccount in data) {
        final AccountDTO accountDTO = AccountDTO.fromJson(rawAccount);
        accounts.add(accountDTO.toDomain());
      }

      return right(accounts);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<Account>>> watchAllAccounts() {
    return getAllAccounts().asStream();
  }
}
