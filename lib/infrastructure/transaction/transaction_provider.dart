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
    late int id;
    try {
      id = await database!.insert(
        DatabaseConstants.moneyTransactionTable,
        MoneyTransactionDTO.fromDomain(transaction).toJson(),
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    if (id == 0) {
      return left(ValueFailure.unexpected(
          message: "MoneyTransaction with id ${transaction.id} could not be created."));
    }

    final transactions = [..._transactionStreamController.value!.getOrElse(() => [])];
    transactions.add(transaction.copyWith(id: UniqueId.fromUniqueInt(id)));
    _transactionStreamController.add(Right(transactions));

    return right(unit);
  }

  @override
  Future<Either<ValueFailure, Unit>> delete(UniqueId id) async {
    late int result;
    try {
      //TODO: verify why delete does not work. Might have something to do with the id being
      // used not being an actual UUID but rather a monotonically increase int
      // and the passed `id` is just a randomly generated id for the transaction
      result = await database!.delete(
        DatabaseConstants.moneyTransactionTable,
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [id.getOrCrash()],
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    if (result == 0) {
      return left(ValueFailure.unexpected(message: "Could not delete MoneyTransaction $id"));
    }

    final transactions = [..._transactionStreamController.value!.getOrElse(() => [])];

    final index = transactions.indexWhere((t) => t.id == id);
    if (index >= 0) {
      transactions.removeAt(index);
      _transactionStreamController.add(Right(transactions));
    }

    return right(unit);
  }

  @override
  Future<Either<ValueFailure, Unit>> update(MoneyTransaction transaction) async {
    final MoneyTransactionDTO transactionDTO = MoneyTransactionDTO.fromDomain(transaction);
    try {
      await database!.update(
        DatabaseConstants.moneyTransactionTable,
        transactionDTO.toJson(),
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [transactionDTO.id],
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    final transactions = [..._transactionStreamController.value!.getOrElse(() => [])];
    final index = transactions.indexWhere((t) => t.id == transaction.id);
    if (index >= 0) {
      transactions[index] = transaction;
      _transactionStreamController.add(Right(transactions));
    } else {
      return left(
          const ValueFailure.unexpected(message: "MoneyTransaction not in current stream."));
    }
    return right(unit);
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
  Either<ValueFailure, List<MoneyTransaction>> getAccountTransactions(UniqueId id) {
    final transactions = [..._transactionStreamController.value!.getOrElse(() => [])];

    return right(transactions.where((t) => t.account.id == id).toList());
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> watchAccountTransactions(
    UniqueId accountID,
  ) {
    return _transactionStreamController.asBroadcastStream().map(
          (event) => event.fold(
            (l) => left(l),
            (r) => right(r.where((element) => element.account.id == accountID).toList()),
          ),
        );
  }
}
