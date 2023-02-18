import 'dart:async';
import 'package:dartz/dartz.dart';
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
        return right(unit);
      }

      if (transaction.type == MoneyTransactionType.toBeBudgeted) {
        // Need to add the amount in toBeBudgeted too
        return accountProvider.getToBeBudgeted().fold(
              (l) => left(l),
              (account) async => await _updateToBeBudgetedAccount(account, transaction),
            );
      }

      return await _updateBudgetvalues(
        budgetValueProvider,
        transaction,
        (Amount a, Amount b) => a + b,
      );
    });
  }

  Future<FutureOr<Either<ValueFailure<dynamic>, Unit>>> _updateToBeBudgetedAccount(
    Account account,
    MoneyTransaction transaction,
  ) async {
    return (await accountProvider.update(
      account.copyWith(balance: account.balance + transaction.amount),
    ))
        .fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  Future<Either<ValueFailure, Unit>> deleteTransaction(MoneyTransaction transaction) async {
    if (transaction.type == MoneyTransactionType.initial) {
      throw Exception("Initial transactions are only deleted in AccountRepository.");
    }
    final Either<ValueFailure, Unit> failureOrSuccess =
        await transactionProvider.delete(transaction.id);

    return await failureOrSuccess.fold((l) => left(l), (_) async {
      // Most transactions do not update the budget values
      if (transaction.type == MoneyTransactionType.betweenAccount ||
          transaction.type == MoneyTransactionType.toBeBudgeted) {
        return right(unit);
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
