import 'package:dartz/dartz.dart';
import 'package:your_budget/application/core/account_watcher_bloc/account_watcher_bloc.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
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

class AccountRepository {
  final IAccountProvider accountProvider;
  final ITransactionProvider transactionProvider;
  final ISubcategoryProvider subcategoryProvider;
  final IPayeeProvider payeeProvider;

  AccountRepository({
    required this.accountProvider,
    required this.transactionProvider,
    required this.subcategoryProvider,
    required this.payeeProvider,
  });

  Stream<Either<ValueFailure<dynamic>, List<Account>>> _accounts() =>
      accountProvider.watchAllAccounts();

  Stream<Either<ValueFailure<dynamic>, List<Account>>> getAccounts() => _accounts();

  Future<Either<ValueFailure<dynamic>, Unit>> createAccount(Account account) async {
    final Either<ValueFailure<dynamic>, UniqueId> failureOrId =
        (await accountProvider.create(account))
            .fold((l) => left(l), (id) => right(UniqueId.fromUniqueString(id)));

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
    UniqueId accountId,
    Amount balance,
  ) async {
    //Create starting money transaction
    //TODO: Use real names

    final Either<ValueFailure, Account> failureOrAccount = accountProvider.get(accountId);
    final Either<ValueFailure, Payee> failureOrPayee =
        await payeeProvider.getStartingBalancePayee();
    return failureOrAccount.fold(
      (l) => left(l),
      (account) => failureOrPayee.fold(
        (l) => left(l),
        (payee) => failureOrPayee.fold(
          (l) => left(l),
          (payee) async {
            final MoneyTransaction transaction = MoneyTransaction(
              id: UniqueId(),
              subcategory: null,
              giver: left(payee),
              receiver: right(account),
              amount: balance,
              memo: Name("Starting balance"),
              date: DateTime.now(),
              type: MoneyTransactionType.initial,
            );

            final Either<ValueFailure, Unit> failureOrSuccess =
                await transactionProvider.create(transaction);

            return failureOrSuccess.fold((l) => left(l), (_) async {
              final tobeBudgeted = accountProvider.getToBeBudgeted();
              // Most transactions do not update the budget values

              return await tobeBudgeted.fold(
                (l) => left(l),
                (account) async => (await transactionProvider.create(
                  transaction.copyWith(
                    receiver: right(account),
                    type: MoneyTransactionType.toBeBudgeted,
                  ),
                ))
                    .fold(
                  (l) => left(l),
                  (r) => right(unit),
                ),
              );
            });
          },
        ),
      ),
    );
  }

  Future<Either<ValueFailure<dynamic>, Unit>> deleteAccount(Account account) async {
    return (await accountProvider.delete(account.id)).fold((l) => left(l), (_) async {
      final Either<ValueFailure, MoneyTransaction> failureOrTransaction = transactionProvider
          .getAccountTransactions(account.id)
          .flatMap((tbbAccount) => transactionProvider.getAccountTransactions(account.id))
          .fold((l) => left(l), (accountTransactions) {
        return right(accountTransactions.firstWhere((element) => element.receiverId == account.id));
      });

      if (failureOrTransaction.isLeft()) {
        return left(failureOrTransaction as ValueFailure);
      }

      return (await transactionProvider.delete((failureOrTransaction as MoneyTransaction).id))
          .fold((l) => left(l), (_) {
        return accountProvider
            .getToBeBudgeted()
            .flatMap((tbbAccount) => transactionProvider.getAccountTransactions(tbbAccount.id))
            .fold((l) => left(l), (tobeBudgetedTransactions) async {
          final tbbtransaction = tobeBudgetedTransactions
              .firstWhere((t) => t.date == (failureOrTransaction as MoneyTransaction).date);
          return (await transactionProvider.delete(tbbtransaction.id)).fold(
            (l) => left(l),
            (r) => right(unit),
          );
        });
      });
    });
  }

  Future<Account?> getNextAccount(Account? account) async {
    final failureOrAccounts = await _accounts().first;
    return failureOrAccounts.fold(
      (l) => null,
      (accounts) {
        final int? nextIndex = _getIndex(
          currentAccount: account,
          accounts: accounts,
          shouldIncrement: true,
        );

        if (nextIndex == null) {
          return null;
        } else {
          return accounts[nextIndex];
        }
      },
    );
  }

  Future<Account?> getPreviousAccount(Account? account) async {
    final failureOrAccounts = await _accounts().first;
    return failureOrAccounts.fold(
      (l) => null,
      (accounts) {
        final int? nextIndex = _getIndex(
          currentAccount: account,
          accounts: accounts,
          shouldIncrement: false,
        );

        if (nextIndex == null) {
          return null;
        } else {
          return accounts[nextIndex];
        }
      },
    );
  }

  int? _getIndex({
    required Account? currentAccount,
    required List<Account> accounts,
    required bool shouldIncrement,
  }) {
    if (accounts.isEmpty) {
      return null;
    }

    if (currentAccount == null) {
      return 0;
    }

    final int numberOfAccounts = accounts.length;
    final int currentIndex = accounts.indexWhere((element) => element.id == currentAccount.id);
    if (shouldIncrement) {
      return (currentIndex + 1) % numberOfAccounts;
    }
    return (currentIndex - 1) % numberOfAccounts;
  }

  fold(AccountWatcherState Function(dynamic l) param0,
      AccountWatcherState Function(dynamic accounts) param1) {}
}
