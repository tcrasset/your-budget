// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';

abstract class IAccountProvider {
  Future<Either<ValueFailure, String>> create(Account account);
  // Future<Either<ValueFailure, Unit>> update(NewAccount account);
  Future<Either<ValueFailure, Unit>> delete(UniqueId id);
  Future<Either<ValueFailure<String>, Unit>> update(Account account);
  Either<ValueFailure, Account> get(UniqueId id);
  Either<ValueFailure<String>, Account> getToBeBudgeted();
  Future<Either<ValueFailure, List<Account>>> getAllAccounts();
  Stream<Either<ValueFailure<dynamic>, List<Account>>> watchAllAccounts();
  Future<Either<ValueFailure, int?>> count();
}
