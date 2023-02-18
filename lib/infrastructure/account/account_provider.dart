// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/infrastructure/account/account_dto.dart';
import 'package:your_budget/models/constants.dart';

class SQFliteAccountProvider implements IAccountProvider {
  final Database? database;
  SQFliteAccountProvider({required this.database});

  Future<void> init() async {
    _accountStreamController.add(await getAllAccounts());
  }

  final _accountStreamController =
      BehaviorSubject<Either<ValueFailure, List<Account>>>.seeded(const Right([]));

  @override
  Future<Either<ValueFailure, int>> count() async {
    final accounts = [..._accountStreamController.value!.getOrElse(() => [])];
    return right(accounts.length);
  }

  @override
  Future<Either<ValueFailure, String>> create(Account account) async {
    late int id;
    try {
      id = await database!
          .insert(DatabaseConstants.accountTable, AccountDTO.fromDomain(account).toJson());
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return left(ValueFailure.uniqueName(failedValue: e.toString()));
      }
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    final accounts = [..._accountStreamController.value!.getOrElse(() => [])];
    if (id == 0) {
      return left(
        ValueFailure.unexpected(message: "Account with id ${account.id} could not be created."),
      );
    }

    accounts.add(account.copyWith(id: UniqueId.fromUniqueInt(id)));
    _accountStreamController.add(Right(accounts));

    return right(id.toString());
  }

  @override
  Future<Either<ValueFailure, Unit>> delete(UniqueId id) async {
    late int result;

    try {
      result = await database!.delete(
        DatabaseConstants.accountTable,
        where: '${DatabaseConstants.ACCOUNT_ID} = ?',
        whereArgs: [id.getOrCrash()],
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    if (result == 0) {
      return left(ValueFailure.unexpected(message: "Could not delete Account $id"));
    }

    final accounts = [..._accountStreamController.value!.getOrElse(() => [])];

    final index = accounts.indexWhere((t) => t.id == id);
    if (index >= 0) {
      accounts.removeAt(index);
      _accountStreamController.add(Right(accounts));
    }

    return right(unit);
  }

  @override
  Either<ValueFailure, Account> get(UniqueId id) {
    final accounts = [..._accountStreamController.value!.getOrElse(() => [])];
    final index = accounts.indexWhere((account) => account.id == id);
    if (index >= 0) {
      return right(accounts[index]);
    } else {
      return left(const ValueFailure.unexpected(message: "Account not in current stream."));
    }
  }

  @override
  Future<Either<ValueFailure, List<Account>>> getAllAccounts() async {
    try {
      final data = await database!.query(DatabaseConstants.accountTable);
      return right(
        data
            .map((account) => AccountDTO.fromJson(account))
            .map((account) => account.toDomain())
            .toList(),
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }
  }

  @override
  Stream<Either<ValueFailure<dynamic>, List<Account>>> watchAllAccounts() {
    return _accountStreamController.asBroadcastStream();
  }

  @override
  Either<ValueFailure, Account> getToBeBudgeted() {
    final accounts = [..._accountStreamController.value!.getOrElse(() => [])];
    final index = accounts
        .indexWhere((account) => account.name.getOrCrash() == DatabaseConstants.TO_BE_BUDGETED);
    if (index >= 0) {
      return right(accounts[index]);
    } else {
      return left(const ValueFailure.unexpected(message: "Account not in current stream."));
    }
  }

  @override
  Future<Either<ValueFailure, Unit>> update(Account account) async {
    {
      final AccountDTO accountDTO = AccountDTO.fromDomain(account);
      String id = accountDTO.id;
      final Map<String, dynamic> values = accountDTO.toJson();
      values.remove("id");

      late int result;
      try {
        result = await database!.update(
          DatabaseConstants.accountTable,
          values,
          where: '${DatabaseConstants.ACCOUNT_ID} = ?',
          whereArgs: [id],
        );
      } on DatabaseException catch (e) {
        return left(ValueFailure.unexpected(message: e.toString()));
      }

      if (result == 0) {
        return left(
          ValueFailure.unexpected(message: "Account with id $id not found. Could not update."),
        );
      }

      final accounts = [..._accountStreamController.value!.getOrElse(() => [])];
      final index = accounts.indexWhere((t) => t.id == account.id);
      if (index >= 0) {
        accounts[index] = account;
        _accountStreamController.add(Right(accounts));
        return right(unit);
      }

      return left(const ValueFailure.unexpected(message: "Account not in current stream."));
    }
  }
}
