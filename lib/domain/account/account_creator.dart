// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/models/constants.dart';

class AccountCreator {
  final IAccountProvider accountRepository;
  final ITransactionProvider transactionRepository;
  final ISubcategoryProvider subcategoryRepository;
  final IPayeeProvider payeeProvider;

  AccountCreator({
    required this.accountRepository,
    required this.transactionRepository,
    required this.subcategoryRepository,
    required this.payeeProvider,
  });

  Future<Either<ValueFailure, Unit>> create(Account account) async {
    debugPrint(account.toString());

    final Either<ValueFailure, String> failureOrId = await accountRepository.create(account);

    return failureOrId.fold(
      (f) => left(f),
      (accountId) async {
        final Either<ValueFailure, Unit> failureOrUnit =
            await _createStartingMoneyTransaction(accountId, account.balance);

        return failureOrUnit.fold(
          (f) => left(f),
          (_) => right(unit),
        );
      },
    );
  }

  Future<Either<ValueFailure, Unit>> _createStartingMoneyTransaction(
    String accountId,
    Amount balance,
  ) async {
    //Create starting money transaction
    //TODO: Use real names

    final Either<ValueFailure, Account> failureOrAccount = await accountRepository.get(accountId);
    final Either<ValueFailure, Subcategory> failureOrSubcategory =
        await subcategoryRepository.getToBeBudgetedSubcategory();
    final Either<ValueFailure, Payee> failureOrPayee = await payeeProvider.getToBeBudgetedPayee();
    return failureOrAccount.fold(
      (l) => left(l),
      (account) => failureOrSubcategory.fold(
        (l) => left(l),
        (subcategory) => failureOrPayee.fold(
          (l) => left(l),
          (payee) {
            final MoneyTransaction transaction = MoneyTransaction(
              id: UniqueId(),
              subcategory: subcategory,
              payee: payee,
              account: account,
              amount: balance,
              memo: Name("Starting balance"),
              date: DateTime.now(),
              isInitialTransaction: true,
            );

            return transactionRepository.create(transaction);
          },
        ),
      ),
    );
  }
}
