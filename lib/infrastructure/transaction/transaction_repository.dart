// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';
import '../../domain/core/value_failure.dart';
import '../../domain/transaction/i_transaction_repository.dart';
import '../../models/constants.dart';
import 'transaction_dto.dart';

class SQFliteTransactionRepository implements ITransactionRepository {
  final Database? database;
  SQFliteTransactionRepository({required this.database});

  @override
  Future<Either<ValueFailure, Unit>> create(MoneyTransaction transaction) async {
    // TODO: Create generic function for insert
    try {
      final MoneyTransactionDTO transactionDTO = MoneyTransactionDTO.fromDomain(transaction);
      debugPrint(transactionDTO.toString());
      debugPrint(transactionDTO.toJson().toString());
      await database!.insert(DatabaseConstants.moneyTransactionTable, transactionDTO.toJson());
      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> delete(MoneyTransaction transaction) async {
    try {
      final MoneyTransactionDTO transactionDTO = MoneyTransactionDTO.fromDomain(transaction);
      await database!.delete(
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
  Future<Either<ValueFailure, Unit>> update(MoneyTransaction transaction) async {
    try {
      final MoneyTransactionDTO transactionDTO = MoneyTransactionDTO.fromDomain(transaction);
      await database!.update(
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
  Future<Either<ValueFailure, List<MoneyTransaction>>> getAccountTransactions(int accountID) async {
    try {
      final sql = """
        SELECT
          ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.MONEYTRANSACTION_ID},
          ${DatabaseConstants.PAYEE_ID_OUTSIDE},
          ${DatabaseConstants.ACCOUNT_ID_OUTSIDE},
          ${DatabaseConstants.SUBCAT_ID_OUTSIDE},
          ${DatabaseConstants.MONEYTRANSACTION_AMOUNT},
          ${DatabaseConstants.MONEYTRANSACTION_MEMO},
          ${DatabaseConstants.MONEYTRANSACTION_DATE},
          ${DatabaseConstants.accountTable}.${DatabaseConstants.ACCOUNT_NAME} as accountName,
          ${DatabaseConstants.payeeTable}.${DatabaseConstants.PAYEE_NAME} as payeeName,
          ${DatabaseConstants.subcategoryTable}.${DatabaseConstants.SUBCAT_NAME} as subcatName

        FROM ${DatabaseConstants.moneyTransactionTable}
        JOIN ${DatabaseConstants.accountTable} ON ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.ACCOUNT_ID_OUTSIDE} = ${DatabaseConstants.accountTable}.${DatabaseConstants.ACCOUNT_ID}
        JOIN ${DatabaseConstants.payeeTable} ON ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.PAYEE_ID_OUTSIDE} = ${DatabaseConstants.payeeTable}.${DatabaseConstants.PAYEE_ID}
        JOIN ${DatabaseConstants.subcategoryTable} ON ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.SUBCAT_ID_OUTSIDE} = ${DatabaseConstants.subcategoryTable}.${DatabaseConstants.SUBCAT_ID}
        WHERE ${DatabaseConstants.ACCOUNT_ID_OUTSIDE} == ?
        ORDER BY ${DatabaseConstants.MONEYTRANSACTION_DATE} DESC;
        """;

      final args = [accountID];
      final data = await database!.rawQuery(sql, args);
      debugPrint(data.toString());
      final List<MoneyTransaction> transactions = [];
      for (final rawTransaction in data) {
        final MoneyTransactionDTO transactionDTO = MoneyTransactionDTO.fromSQL(rawTransaction);
        transactions.add(transactionDTO.toDomain());
      }

      return right(transactions);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> watchAccountTransactions(
      int accountID) {
    return getAccountTransactions(accountID).asStream();
  }
}
