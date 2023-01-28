import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction.dart';

class AccountRepository {
  final IAccountProvider accountProvider;

  AccountRepository({required this.accountProvider});

  Stream<Either<ValueFailure<dynamic>, List<Account>>> _accounts() =>
      accountProvider.watchAllAccounts();

  Stream<Either<ValueFailure<dynamic>, List<Account>>> getAccounts() => _accounts();

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
}
