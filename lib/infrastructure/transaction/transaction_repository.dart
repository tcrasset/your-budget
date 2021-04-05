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
    // try {
    //   final recordSnapshots = await _plantStore.find(
    //     database,
    //     finder: Finder(sortOrders: [SortOrder("lastWatered")]),
    //   );

    //   final List<Plant> plants = recordSnapshots.map(_snapshotToPlant).toList();

    //   return right(plants);
    // } on DatabaseException catch (e) {
    //   return left(ValueFailure.unexpected(message: e.message));
    // }
  }

  // Plant _snapshotToPlant(
  //   RecordSnapshot<String, Map<String, dynamic>> snapshot,
  // ) {
  //   final PlantDTO plantDto = PlantDTO.fromJson(snapshot.value);
  //   return plantDto.toDomain();
  // }

  /// Listen for changes on any plant
  @override
  Either<ValueFailure, Stream<List<MoneyTransaction>>> watchAllTransactions() {
    // try {
    //   // Get a stream of snapshots from the dataase
    //   final snapshotStream = _plantStore
    //       .query(finder: Finder(sortOrders: [SortOrder("lastWatered")]))
    //       .onSnapshots(database);

    //   // Transfrom stream from list of snapshots to plants
    //   final Stream<List<Plant>> plantListStream = snapshotStream.map(
    //     (snapshots) => snapshots.map(_snapshotToPlant).toList(),
    //   );

    //   return right(plantListStream);
    // } on DatabaseException catch (e) {
    //   return left(ValueFailure.unexpected(message: e.message));
    // }
  }
}
