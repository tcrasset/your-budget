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
        final Account updatedReceiver = (transaction.receiver as Right).value as Account;
        final Account updatedGiver = (transaction.giver as Right).value as Account;
        final Amount amount = transaction.amount;

        /// If the transaction amount is negative, the transaction will remove money from
        /// [giverAccount] and input it into [receiverAccount].
        /// Otherwise, it is reversed.
        return _updateAccounts(
          updatedGiver,
          updatedReceiver,
          amount,
          (Amount a, Amount b) => a + b,
        );
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

  Future<Either<ValueFailure<String>, Unit>> _updateToBeBudgetedAccount(
    Account account,
    MoneyTransaction transaction,
  ) async {
    final newBalance = account.balance + transaction.amount;
    return accountProvider.update(account.copyWith(balance: newBalance));
  }

  Future<Either<ValueFailure, Unit>> deleteTransaction(MoneyTransaction transaction) async {
    if (transaction.type == MoneyTransactionType.initial) {
      throw Exception("Initial transactions are only deleted in AccountRepository.");
    }

    return transactionProvider.delete(transaction.id).flatMap((_) async {
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

        return _updateAccounts(
          updatedGiver,
          updatedReceiver,
          amount,
          (Amount a, Amount b) => a - b,
        );
      }

      return await _updateBudgetvalues(
        budgetValueProvider,
        transaction,
        (Amount a, Amount b) => a - b,
      );
    });
  }

  Future<Either<ValueFailure<String>, Unit>> _updateAccounts(
    Account giverAccount,
    Account receiverAccount,
    Amount amount,
    Amount Function(Amount a, Amount b) addOrSubtract,
  ) async {
    return accountProvider
        .update(receiverAccount.copyWith(balance: addOrSubtract(receiverAccount.balance, amount)))
        .andThen(accountProvider
            .update(giverAccount.copyWith(balance: addOrSubtract(giverAccount.balance, amount))));
  }

  Future<FutureOr<Either<ValueFailure<String>, Unit>>> _updateBudgetvalues(
    IBudgetValueProvider budgetValueProvider,
    MoneyTransaction transaction,
    Amount Function(Amount a, Amount b) addOrSubtract,
  ) async {
    final Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues =
        await budgetValueProvider.getBudgetValuesBySubcategory(
      subcategoryId: transaction.subcategory!.id,
    );

    if (failureOrBudgetvalues.isLeft()) {
      return left(failureOrBudgetvalues as ValueFailure<String>);
    }

    final List<BudgetValue> budgetvalues = failureOrBudgetvalues.getOrElse(() => []);

    // Remove the transaction amount to each budget value's available field
    // TODO: return error values if one fails using functional programming
    final List<BudgetValue> toUpdate = budgetvalues
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
          (budgetValue) =>
              _applyAndUpdateBudgetValue(budgetValue, transaction.amount, addOrSubtract),
        )
        .toList();

    return (await budgetValueProvider.updateAll(toUpdate)).andThen(right(unit));
  }

  BudgetValue _applyAndUpdateBudgetValue(
    BudgetValue budgetValue,
    Amount amountLeft,
    Amount Function(Amount a, Amount b) addOrSubtract,
  ) {
    return budgetValue.copyWith(available: addOrSubtract(budgetValue.available, amountLeft));
  }
}
