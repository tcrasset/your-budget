import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/models/constants.dart';

class ToBeBudgetedRepository {
  final ISubcategoryProvider subcategoryProvider;
  final ITransactionProvider transactionProvider;
  final IAccountProvider accountProvider;
  final IConstantsProvider constantsProvider;

  ToBeBudgetedRepository({
    required this.subcategoryProvider,
    required this.accountProvider,
    required this.transactionProvider,
    required this.constantsProvider,
  });

  Stream<Either<ValueFailure<dynamic>, Amount>> getToBeBudgeted() {
    return accountProvider.watchAllAccounts().map(
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

  Future<Either<ValueFailure, Unit>> setToBeBudgeted(Amount toBeBudgeted) async {
    return toBeBudgeted.value.fold(
      (l) => left(l),
      (r) async => (await constantsProvider.setToBeBudgeted(r)).flatMap((a) => right(unit)),
    );
  }
}
