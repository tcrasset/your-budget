// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/domain/account/new_account.dart';
import '../../models/account.dart';
import '../core/value_failure.dart';

// import 'package:your_budget/models/account.dart';

abstract class IAccountRepository {
  Future<Either<ValueFailure, Unit>> create(NewAccount account);
  // Future<Either<ValueFailure, Unit>> update(NewAccount account);
  // Future<Either<ValueFailure, Unit>> delete(NewAccount account);
  Future<Either<ValueFailure, List<NewAccount>>> getAllAccounts();
  Stream<Either<ValueFailure<dynamic>, List<NewAccount>>> watchAllAccounts();
  Future<Either<ValueFailure, int>> count();
}
