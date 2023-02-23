import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/models/constants.dart';

class ToBeBudgetedRepository {
  final IAccountProvider accountProvider;

  ToBeBudgetedRepository({required this.accountProvider});

  Stream<Either<ValueFailure<dynamic>, Amount>> getToBeBudgeted() =>
      accountProvider.watchAllAccounts().map(
            (event) => event.flatMap(
              (account) => right(
                account
                    .singleWhere(
                      (element) => element.name.getOrCrash() == DatabaseConstants.TO_BE_BUDGETED,
                    )
                    .balance,
              ),
            ),
          );
}
