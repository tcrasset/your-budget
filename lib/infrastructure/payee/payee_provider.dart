// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/infrastructure/payee/payee_dto.dart';

class SQFlitePayeeProvider implements IPayeeProvider {
  final Database? database;
  SQFlitePayeeProvider({required this.database});

  @override
  Future<Either<ValueFailure, int?>> count() async {
    try {
      const sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.payeeTable};
        """;
      final data = await database!.rawQuery(sql);

      return right(Sqflite.firstIntValue(data));
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> create(Payee payee) async {
    try {
      final PayeeDTO payeeDTO = PayeeDTO.fromDomain(payee);
      await database!.insert(DatabaseConstants.payeeTable, payeeDTO.toJson());
      return right(unit);
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return left(ValueFailure.uniqueName(failedValue: e.toString()));
      }
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Future<Either<ValueFailure, List<Payee>>> getAllPayees() async {
    try {
      const sql = """
        SELECT * FROM ${DatabaseConstants.payeeTable}
        ORDER BY ${DatabaseConstants.PAYEE_NAME} DESC;
        """;

      final data = await database!.rawQuery(sql);
      final List<Payee> payees = [];
      for (final rawPayee in data) {
        final PayeeDTO payeeDTO = PayeeDTO.fromJson(rawPayee);
        payees.add(payeeDTO.toDomain());
      }

      return right(payees);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<Payee>>> watchAllPayees() {
    return getAllPayees().asStream();
  }

  @override
  Future<Either<ValueFailure, Payee>> getToBeBudgetedPayee() async {
    try {
      const sql = """
        SELECT * FROM ${DatabaseConstants.payeeTable}
        WHERE ${DatabaseConstants.PAYEE_NAME}  = '${DatabaseConstants.TO_BE_BUDGETED}';
        """;

      final data = await database!.rawQuery(sql);
      final PayeeDTO payeeDTO = PayeeDTO.fromJson(data.first);
      final Payee payee = payeeDTO.toDomain();

      return right(payee);
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }
}
