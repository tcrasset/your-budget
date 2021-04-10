// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../models/account.dart';
import '../core/value_failure.dart';

// import 'package:your_budget/models/account.dart';

abstract class IAccountRepository {
  Future<Either<ValueFailure, Unit>> create(Account account);
  // Future<Either<ValueFailure, Unit>> update(Account account);
  // Future<Either<ValueFailure, Unit>> delete(Account account);
  //   Future<Either<ValueFailure, List<Account>>> getAllAccounts();
  // Stream<Either<ValueFailure<dynamic>, List<Account>>>
  //     watchAllAccounts();
  Future<Either<ValueFailure, int>> count();
}
