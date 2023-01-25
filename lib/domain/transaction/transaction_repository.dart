import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction.dart';

class TransactionRepository {
  final ITransactionProvider transactionProvider;
  final IBudgetValueProvider budgetValueProvider;

  TransactionRepository({required this.transactionProvider, required this.budgetValueProvider});

  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> _transactions(UniqueId accountId) =>
      transactionProvider.watchAccountTransactions(accountId.toString());

  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> getTransactionsByAccount(
          UniqueId accountId) =>
      _transactions(accountId);

  Future<Either<ValueFailure, Unit>> deleteTransaction(MoneyTransaction transaction) async {
    final failureOrBudgetvalue = await budgetValueProvider.get(
        year: transaction.date.year,
        month: transaction.date.month,
        subcategoryId: transaction.subcategory.id);

    // TODO: We have to update the available  value of the budget values in the future.
    // I don't know if that is the responsability of the BudgetRepository, or the TransactionRepository
    return failureOrBudgetvalue.fold((l) => left(l), (stored) async {
      BudgetValue toUpdate = stored.copyWith(available: stored.available - transaction.amount);
      await budgetValueProvider.update(toUpdate);
      await transactionProvider.delete(transaction.id.getOrCrash());
      return right(unit);
    });
  }
}
