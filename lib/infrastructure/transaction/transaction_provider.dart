// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/infrastructure/transaction/transaction_dto.dart';
import 'package:your_budget/models/constants.dart';

class SQFliteTransactionProvider implements ITransactionProvider {
  final Database? database;
  SQFliteTransactionProvider({required this.database});

  @override
  Future<Either<ValueFailure, Unit>> create(MoneyTransaction transaction) async {
    // TODO: Create generic function for insert
    try {
      final MoneyTransactionDTO transactionDTO = MoneyTransactionDTO.fromDomain(transaction);
      await database!.insert(DatabaseConstants.moneyTransactionTable, transactionDTO.toJson());

      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> delete(String id) async {
    try {
      var result = database!.delete(
        DatabaseConstants.moneyTransactionTable,
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [id],
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
  Future<Either<ValueFailure, List<MoneyTransaction>>> getAccountTransactions(String id) async {
    try {
      const sql = """
        SELECT
          ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.MONEYTRANSACTION_ID},
          ${DatabaseConstants.PAYEE_ID_OUTSIDE},
          ${DatabaseConstants.ACCOUNT_ID_OUTSIDE},
          ${DatabaseConstants.SUBCAT_ID_OUTSIDE},
          ${DatabaseConstants.MONEYTRANSACTION_AMOUNT},
          ${DatabaseConstants.MONEYTRANSACTION_MEMO},
          ${DatabaseConstants.MONEYTRANSACTION_DATE},
          ${DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION},
          ${DatabaseConstants.accountTable}.${DatabaseConstants.ACCOUNT_NAME},
          ${DatabaseConstants.accountTable}.${DatabaseConstants.ACCOUNT_BALANCE},
          ${DatabaseConstants.payeeTable}.${DatabaseConstants.PAYEE_NAME},
          ${DatabaseConstants.subcategoryTable}.${DatabaseConstants.SUBCAT_NAME} ,
          ${DatabaseConstants.subcategoryTable}.${DatabaseConstants.CAT_ID_OUTSIDE}

        FROM ${DatabaseConstants.moneyTransactionTable}
        JOIN ${DatabaseConstants.accountTable} ON ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.ACCOUNT_ID_OUTSIDE} = ${DatabaseConstants.accountTable}.${DatabaseConstants.ACCOUNT_ID}
        JOIN ${DatabaseConstants.payeeTable} ON ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.PAYEE_ID_OUTSIDE} = ${DatabaseConstants.payeeTable}.${DatabaseConstants.PAYEE_ID}
        JOIN ${DatabaseConstants.subcategoryTable} ON ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.SUBCAT_ID_OUTSIDE} = ${DatabaseConstants.subcategoryTable}.${DatabaseConstants.SUBCAT_ID}
        WHERE ${DatabaseConstants.ACCOUNT_ID_OUTSIDE} == ?
        ORDER BY ${DatabaseConstants.MONEYTRANSACTION_DATE} DESC;
        """;

      final args = [id];
      final data = await database!.rawQuery(sql, args);

      final List<MoneyTransaction> transactions = [];
      for (final rawTransaction in data) {
        final MoneyTransactionDTO transactionDTO = MoneyTransactionDTO.fromJson(rawTransaction);
        transactions.add(transactionDTO.toDomain());
      }

      return right(transactions);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> watchAccountTransactions(
    String accountID,
  ) {
    return getAccountTransactions(accountID).asStream();
  }
}
