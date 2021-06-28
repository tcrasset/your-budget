// Package imports:
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/models/constants.dart';

class AccountCreator {
  final IAccountRepository accountRepository;
  final ITransactionRepository transactionRepository;
  final ISubcategoryRepository subcategoryRepository;

  AccountCreator({
    required this.accountRepository,
    required this.transactionRepository,
    required this.subcategoryRepository,
  });

  Future<Either<ValueFailure, Unit>> create(Account account) async {
    final Either<ValueFailure, int> failureOrInt = await accountRepository.create(account);

    return failureOrInt.fold(
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
      int accountId, Amount balance) async {
//Create starting money transaction
//TODO: Use real names

    final Either<ValueFailure, Account> failureOrAccount = await accountRepository.get(accountId);
    final Either<ValueFailure, Subcategory> failureOrSubcategory =
        await subcategoryRepository.getToBeBudgetedSubcategory();

    return failureOrAccount.fold(
      (l) => left(l),
      (account) => failureOrSubcategory.fold(
        (l) => left(l),
        (subcategory) {
          final MoneyTransaction transaction = MoneyTransaction(
            id: UniqueId(),
            subcatID: subcategory.id,
            subcatName: subcategory.name,
            payee: Payee(
                id: UniqueId.fromUniqueInt(Constants.UNASSIGNED_PAYEE_ID),
                name: Name("ToBeBudgeted")),
            payeeID: UniqueId.fromUniqueInt(Constants.UNASSIGNED_PAYEE_ID),
            payeeName: Name("ToBeBudgeted"),
            accountID: account.id,
            accountName: account.name,
            amount: balance,
            memo: Name("Starting balance"),
            date: DateTime.now(),
          );

          return transactionRepository.create(transaction);
        },
      ),
    );
  }
}
