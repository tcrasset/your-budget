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
  SQFliteAccountProvider({required this.database}) {
    _init();
  }

  Future<void> _init() async {
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
          ValueFailure.unexpected(message: "Account with id ${account.id} could not be created."));
    }

    accounts.add(account.copyWith(id: UniqueId.fromUniqueInt(id)));
    _accountStreamController.add(Right(accounts));

    return right(id.toString());
  }

  @override
  Future<Either<ValueFailure, Unit>> delete(String id) async {
    late int result;

    try {
      result = await database!.delete(
        DatabaseConstants.accountTable,
        where: '${DatabaseConstants.ACCOUNT_ID} = ?',
        whereArgs: [id],
      );
    } on DatabaseException catch (e) {
      return left(ValueFailure.unexpected(message: e.toString()));
    }

    if (result == 0) {
      return left(ValueFailure.unexpected(message: "Could not delete Account $id"));
    }

    final accounts = [..._accountStreamController.value!.getOrElse(() => [])];

    final index = accounts.indexWhere((t) => t.id.toString() == id);
    if (index >= 0) {
      accounts.removeAt(index);
      _accountStreamController.add(Right(accounts));
    }

    return right(unit);
  }

  @override
  Future<Either<ValueFailure, Account>> get(String id) async {
    final accounts = [..._accountStreamController.value!.getOrElse(() => [])];
    final index = accounts.indexWhere((account) => account.id.toString() == id);
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
}
