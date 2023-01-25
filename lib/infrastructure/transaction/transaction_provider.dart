// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/infrastructure/transaction/transaction_dto.dart';
import 'package:your_budget/models/constants.dart';

class SQFliteTransactionProvider implements ITransactionProvider {
  final Database? database;
  SQFliteTransactionProvider({required this.database}) {
    _init();
  }

  void _init() async {
    _transactionStreamController.add(await getAllTransactions());
  }

  final _transactionStreamController =
      BehaviorSubject<Either<ValueFailure, List<MoneyTransaction>>>.seeded(const Right([]));

  @override
  Future<Either<ValueFailure, Unit>> create(MoneyTransaction transaction) async {
    try {
      try {
        final transactions = [..._transactionStreamController.value!.getOrElse(() => [])];

        await database!.insert(
          DatabaseConstants.moneyTransactionTable,
          MoneyTransactionDTO.fromDomain(transaction).toJson(),
        );

        transactions.add(transaction);
        _transactionStreamController.add(Right(transactions));

        return right(unit);
      } on DatabaseException catch (e) {
        return left(ValueFailure.unexpected(message: e.toString()));
      }
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> delete(String id) async {
    try {
      //TODO: verify why delete does not work. Might have something to do with the id being
      // used not being an actual UUID but rather a monotonically increase int
      // and the passed `id` is just a randomly generated id for the transaction
      final result = await database!.delete(
        DatabaseConstants.moneyTransactionTable,
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [id],
      );

      if (result == 0) {
        return left(ValueFailure.unexpected(message: "Could not delete MoneyTransaction $id"));
      }

      final transactions = [..._transactionStreamController.value!.getOrElse(() => [])];

      final index = transactions.indexWhere((t) => t.id.toString() == id);
      if (index >= 0) {
        transactions.removeAt(index);
        _transactionStreamController.add(Right(transactions));
      }

      return right(unit);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> update(MoneyTransaction transaction) async {
    try {
      final transactions = [..._transactionStreamController.value!.getOrElse(() => [])];
      final index = transactions.indexWhere((t) => t.id == transaction.id);
      if (index >= 0) {
        transactions[index] = transaction;
        _transactionStreamController.add(Right(transactions));
      } else {
        return left(ValueFailure.unexpected(message: "Subcategory not in current stream."));
      }

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

  Future<Either<ValueFailure, List<MoneyTransaction>>> getAllTransactions() async {
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
        ORDER BY ${DatabaseConstants.MONEYTRANSACTION_DATE} DESC;
        """;

      final data = await database!.rawQuery(sql);

      return right(
        data
            .map((transaction) => MoneyTransactionDTO.fromJson(transaction))
            .map((transaction) => transaction.toDomain())
            .toList(),
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Either<ValueFailure, List<MoneyTransaction>> getAccountTransactions(String id) {
    final transactions = [..._transactionStreamController.value!.getOrElse(() => [])];

    return right(transactions.where((t) => t.account.id.toString() == id).toList());
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> watchAccountTransactions(
    String accountID,
  ) {
    return _transactionStreamController.asBroadcastStream().map(
          (event) => event.fold(
            (l) => left(l),
            (r) => right(r.where((element) => element.account.id.toString() == accountID).toList()),
          ),
        );
  }
}
