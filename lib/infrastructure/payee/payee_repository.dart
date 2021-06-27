// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/domain/payee/payee.dart';
import '../../domain/core/value_failure.dart';
import '../../domain/payee/i_payee_repository.dart';
import '../../models/constants.dart';
import 'payee_dto.dart';

class SQFlitePayeeRepository implements IPayeeRepository {
  final Database? database;
  SQFlitePayeeRepository({required this.database});

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
        final PayeeDTO payeeDTO = PayeeDTO.fromSQL(rawPayee);
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
}
