// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import '../core/value_failure.dart';

// import 'package:your_budget/models/account.dart';

abstract class IAccountRepository {
  Future<Either<ValueFailure, int>> create(Account account);
  // Future<Either<ValueFailure, Unit>> update(NewAccount account);
  // Future<Either<ValueFailure, Unit>> delete(NewAccount account);
  Future<Either<ValueFailure, List<Account>>> getAllAccounts();
  Stream<Either<ValueFailure<dynamic>, List<Account>>> watchAllAccounts();
  Future<Either<ValueFailure, int?>> count();
}
