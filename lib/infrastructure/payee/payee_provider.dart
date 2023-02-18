// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
// Project imports:
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/infrastructure/payee/payee_dto.dart';
import 'package:your_budget/models/constants.dart';

class SQFlitePayeeProvider implements IPayeeProvider {
  final Database? database;
  SQFlitePayeeProvider({required this.database}) {
    init();
  }

  Future<void> init() async {
    _payeeStreamController.add(await getAllPayees());
  }

  final _payeeStreamController =
      BehaviorSubject<Either<ValueFailure, List<Payee>>>.seeded(const Right([]));

  @override
  Future<Either<ValueFailure, int>> count() async {
    final payees = [..._payeeStreamController.value!.getOrElse(() => [])];
    return right(payees.length);
  }

  @override
  Future<Either<ValueFailure, Unit>> create(Payee payee) async {
    late int id;
    try {
      id =
          await database!.insert(DatabaseConstants.payeeTable, PayeeDTO.fromDomain(payee).toJson());
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return left(ValueFailure.uniqueName(failedValue: e.toString()));
      }
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    final payees = [..._payeeStreamController.value!.getOrElse(() => [])];
    if (id == 0) {
      return left(
        ValueFailure.unexpected(message: "Payee with id ${payee.id} could not be created."),
      );
    }

    payees.add(payee.copyWith(id: UniqueId.fromUniqueInt(id)));
    _payeeStreamController.add(Right(payees));

    return right(unit);
  }

  @override
  Future<Either<ValueFailure, List<Payee>>> getAllPayees() async {
    try {
      final data = await database!.query(DatabaseConstants.payeeTable);
      return right(
        data.map((payee) => PayeeDTO.fromJson(payee)).map((payee) => payee.toDomain()).toList(),
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<Payee>>> watchAllPayees() {
    return _payeeStreamController.asBroadcastStream();
  }

  @override
  Future<Either<ValueFailure, Payee>> getStartingBalancePayee() async {
    final payees = [..._payeeStreamController.value!.getOrElse(() => [])];
    final index = payees.indexWhere(
      (payee) => payee.name.getOrCrash() == DatabaseConstants.STARTING_BALANCE_PAYEE_NAME,
    );
    if (index >= 0) {
      return right(payees[index]);
    } else {
      return left(const ValueFailure.unexpected(message: "Payee not in current stream."));
    }
  }
}
