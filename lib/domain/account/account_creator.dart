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
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/models/constants.dart';

class AccountCreator {
  final IAccountRepository accountRepository;
  final ITransactionRepository transactionRepository;

  AccountCreator({
    @required this.accountRepository,
    @required this.transactionRepository,
  });

  Future<Either<ValueFailure, Unit>> create(Account account) async {
    final Either<ValueFailure, int> failureOrInt = await accountRepository.create(account);

    return failureOrInt.fold(
      (f) {
        return left(f); // Failure in account creation
      },
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
    final MoneyTransaction transaction = MoneyTransaction(
      id: UniqueId(),
      subcatID: UniqueId.fromUniqueInt(Constants.UNASSIGNED_SUBCAT_ID),
      payeeID: UniqueId.fromUniqueInt(Constants.UNASSIGNED_PAYEE_ID),
      accountID: UniqueId.fromUniqueInt(accountId),
      amount: balance,
      memo: Name("Starting balance"),
      date: DateTime.now(),
    );

    return transactionRepository.create(transaction);
  }
}
