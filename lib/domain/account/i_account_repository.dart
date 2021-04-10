// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';

// import 'package:your_budget/models/account.dart';

abstract class IAccountRepository {
  // Future<Either<ValueFailure, Unit>> create(Account plant);
  // Future<Either<ValueFailure, Unit>> update(Account plant);
  // Future<Either<ValueFailure, Unit>> delete(Account plant);
  //   Future<Either<ValueFailure, List<Account>>> getAllAccounts();
  // Stream<Either<ValueFailure<dynamic>, List<Account>>>
  //     watchAllAccounts();
  Future<Either<ValueFailure, int>> count(int id);
}
