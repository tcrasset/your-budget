import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:your_budget/dartz_x.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/models/utils.dart';

class TransactionRepository {
  final ITransactionProvider transactionProvider;
  final IBudgetValueProvider budgetValueProvider;
  final IAccountProvider accountProvider;
  TransactionRepository({
    required this.transactionProvider,
    required this.budgetValueProvider,
    required this.accountProvider,
  });

  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> _transactions(UniqueId accountId) =>
      transactionProvider.watchAccountTransactions(accountId);

  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> getTransactionsByAccount(
    UniqueId accountId,
  ) =>
      _transactions(accountId);

  Future<Either<ValueFailure, Unit>> createTransaction(MoneyTransaction transaction) async {
    // TODO: Implement SQL transactions and rollback on error

    if (transaction.type == MoneyTransactionType.initial) {
      throw Exception("Initial transactions are only created in AccountRepository.");
    }

    final Either<ValueFailure, Unit> failureOrSuccess =
        await transactionProvider.create(transaction);

    return await failureOrSuccess.fold((l) => left(l), (_) async {
      if (transaction.type == MoneyTransactionType.betweenAccount) {
        Account updatedReceiver = (transaction.receiver as Right).value as Account;
        Account updatedGiver = (transaction.giver as Right).value as Account;
        final Amount amount = transaction.amount;

        /// If the transaction amount is negative, the transaction will remove money from
        /// [giverAccount] and input it into [receiverAccount].
        /// Otherwise, it is reversed.
        updatedGiver = updatedGiver.copyWith(balance: updatedGiver.balance + amount);
        updatedReceiver = updatedReceiver.copyWith(balance: updatedReceiver.balance - amount);

        return accountProvider
            .update(updatedReceiver)
            .flatMap((a) => accountProvider.update(updatedGiver));
      }

      if (transaction.type == MoneyTransactionType.toBeBudgeted) {
        // Need to add the amount in toBeBudgeted too
        return accountProvider.getToBeBudgeted().fold(
              (l) => left(l),
              (account) => _updateToBeBudgetedAccount(account, transaction),
            );
      }

      if (transaction.type == MoneyTransactionType.subcategory) {
        return await _updateBudgetvalues(
          budgetValueProvider,
          transaction,
          (Amount a, Amount b) => a + b,
        );
      }

      throw Exception("No other money transaction types");
    });
  }

  Future<Either<ValueFailure<dynamic>, Unit>> _updateToBeBudgetedAccount(
    Account account,
    MoneyTransaction transaction,
  ) async {
    return accountProvider
        .update(
          account.copyWith(balance: account.balance + transaction.amount),
        )
        .flatMap((_) async => right(unit));
  }

  Future<Either<ValueFailure, Unit>> deleteTransaction(MoneyTransaction transaction) async {
    if (transaction.type == MoneyTransactionType.initial) {
      throw Exception("Initial transactions are only deleted in AccountRepository.");
    }
    final Either<ValueFailure, Unit> failureOrSuccess =
        await transactionProvider.delete(transaction.id);

    return await failureOrSuccess.fold((l) => left(l), (_) async {
      // Most transactions do not update the budget values

      if (transaction.type == MoneyTransactionType.toBeBudgeted) {
        throw Exception("Deleting to be budgeted not implemented yet.");
      }

      if (transaction.type == MoneyTransactionType.betweenAccount) {
        // We are doing the inverse operation that we did during creation.
        Account updatedReceiver = (transaction.receiver as Right).value as Account;
        Account updatedGiver = (transaction.giver as Right).value as Account;
        final Amount amount = transaction.amount;

        /// If the transaction amount was negative, the transaction will add back money to
        /// [giverAccount] and remove it from [receiverAccount].
        /// Otherwise, it is reversed.
        updatedGiver = updatedGiver.copyWith(balance: updatedGiver.balance - amount);
        updatedReceiver = updatedReceiver.copyWith(balance: updatedReceiver.balance + amount);

        return accountProvider
            .update(updatedReceiver)
            .flatMap((a) => accountProvider.update(updatedGiver));
      }

      return await _updateBudgetvalues(
        budgetValueProvider,
        transaction,
        (Amount a, Amount b) => a - b,
      );
    });
  }
}

Future<FutureOr<Either<ValueFailure<dynamic>, Unit>>> _updateBudgetvalues(
  IBudgetValueProvider budgetValueProvider,
  MoneyTransaction transaction,
  Amount Function(Amount a, Amount b) addOrSubtract,
) async {
  final Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues =
      await budgetValueProvider.getBudgetValuesBySubcategory(
    subcategoryId: transaction.subcategory!.id,
  );

  if (failureOrBudgetvalues.isLeft()) {
    return left(failureOrBudgetvalues as ValueFailure);
  }

  final List<BudgetValue> budgetvalues = failureOrBudgetvalues.getOrElse(() => []);

  // Remove the transaction amount to each budget value's available field
  // TODO: return error values if one fails using functional programming
  final toUpdate = budgetvalues
      .where(
        (element) =>
            isMonthBetweenInclusive(
              query: element.date,
              lowerBound: transaction.date,
              upperBound: getMaxBudgetDate(),
            ) &&
            element.subcategoryId == transaction.subcategory!.id,
      )
      .map(
        (value) => value.copyWith(
          available: addOrSubtract(value.available, transaction.amount),
        ),
      )
      .toList();

  final failureOrUnit = await budgetValueProvider.updateAll(toUpdate);

  return failureOrUnit.fold(
    (l) => left(failureOrUnit as ValueFailure),
    (r) => right(unit),
  );
}
