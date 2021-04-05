// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/infrastructure/transaction/transaction_dto.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/money_transaction.dart';

class SQFliteTransactionRepository implements ITransactionRepository {
  final Database database;
  SQFliteTransactionRepository({@required this.database});

  @override
  Future<Either<ValueFailure, Unit>> create(
      MoneyTransaction transaction) async {
    try {
      final MoneyTransactionDTO transactionDTO =
          MoneyTransactionDTO.fromDomain(transaction);
      await database.insert(
          DatabaseConstants.moneyTransactionTable, transactionDTO.toJson());
      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> delete(
      MoneyTransaction transaction) async {
    try {
      final MoneyTransactionDTO transactionDTO =
          MoneyTransactionDTO.fromDomain(transaction);
      await database.delete(
        DatabaseConstants.moneyTransactionTable,
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [transactionDTO.id],
      );
      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> update(
      MoneyTransaction transaction) async {
    try {
      final MoneyTransactionDTO transactionDTO =
          MoneyTransactionDTO.fromDomain(transaction);
      await database.update(
        DatabaseConstants.moneyTransactionTable,
        transactionDTO.toJson(),
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [transactionDTO.id],
      );
      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, List<MoneyTransaction>>>
      getAllTransactions() async {
    try {
      final sql = """
        SELECT * FROM ${DatabaseConstants.moneyTransactionTable}
        ORDER BY ${DatabaseConstants.MONEYTRANSACTION_DATE} DESC;
        """;
      final data = await database.rawQuery(sql);

      final List<MoneyTransaction> transactions = [];
      for (final rawTransaction in data) {
        print(rawTransaction);
        final MoneyTransactionDTO transactionDTO =
            MoneyTransactionDTO.fromJson(rawTransaction);
        print(transactionDTO);
        transactions.add(transactionDTO.toDomain());
      }

      return right(transactions);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  /// Listen for changes on any transaction
  @override
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>>
      watchAllTransactions() {
    return getAllTransactions().asStream();
  }
}
