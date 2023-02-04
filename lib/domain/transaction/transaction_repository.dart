import 'package:dartz/dartz.dart';
import 'package:jiffy/jiffy.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/category/i_category_provider.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/utils.dart';

class TransactionRepository {
  final ITransactionProvider transactionProvider;
  final IBudgetValueProvider budgetValueProvider;
  final IConstantsProvider constantsProvider;
  final IAccountProvider accountProvider;
  TransactionRepository({
    required this.transactionProvider,
    required this.budgetValueProvider,
    required this.constantsProvider,
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
    Either<ValueFailure, Unit>? failureOrSuccess = await transactionProvider.create(transaction);

    return await failureOrSuccess.fold((l) => left(l), (_) async {
      // Most transactions do not update the budget values
      if (transaction.type == MoneyTransactionType.initial) {
        final tobeBudgeted = accountProvider.getToBeBudgeted();

        return await tobeBudgeted.fold(
          (l) => left(l),
          (account) async =>
              (await transactionProvider.create(transaction.copyWith(receiver: right(account))))
                  .fold(
            (l) => left(l),
            (r) => right(unit),
          ),
        );
      }

      if (transaction.type == MoneyTransactionType.betweenAccount ||
          transaction.type == MoneyTransactionType.toBeBudgeted) {
        return right(unit);
      }

      final Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues =
          await budgetValueProvider.getBudgetValuesBySubcategory(
        subcategoryId: transaction.subcategory!.id,
      );

      if (failureOrBudgetvalues.isLeft()) {
        return left(failureOrBudgetvalues as ValueFailure);
      }

      List<BudgetValue> budgetvalues = failureOrBudgetvalues.getOrElse(() => []);

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
          .map((value) => value.copyWith(available: value.available + transaction.amount))
          .toList();

      final failureOrUnit = await budgetValueProvider.updateAll(toUpdate);

      return failureOrUnit.fold(
        (l) => left(failureOrUnit as ValueFailure),
        (r) => right(unit),
      );
    });
  }

  Future<Either<ValueFailure, Unit>> deleteTransaction(MoneyTransaction transaction) async {
    Either<ValueFailure, Unit>? failureOrSuccess = await transactionProvider.delete(transaction.id);

    return await failureOrSuccess.fold((l) => left(l), (_) async {
      // Most transactions do not update the budget values
      if (transaction.subcategory == null) {
        return right(unit);
      }

      final Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues =
          await budgetValueProvider.getBudgetValuesBySubcategory(
        subcategoryId: transaction.subcategory!.id,
      );

      if (failureOrBudgetvalues.isLeft()) {
        return left(failureOrBudgetvalues as ValueFailure);
      }

      List<BudgetValue> budgetvalues = failureOrBudgetvalues.getOrElse(() => []);

      // Add transaction amount to each budget value's available field
      // TODO: return error values if one fails using functional programming
      final toUpdate = budgetvalues
          .where(
            (element) =>
                isMonthBetweenInclusive(
                    query: element.date,
                    lowerBound: transaction.date,
                    upperBound: getMaxBudgetDate()) &&
                element.subcategoryId == transaction.subcategory!.id,
          )
          .map((value) => value.copyWith(available: value.available - transaction.amount))
          .toList();

      final failureOrUnit = await budgetValueProvider.updateAll(toUpdate);

      return failureOrUnit.fold((l) => left(l), (_) => right(unit));
    });
  }

  Future<Either<ValueFailure<dynamic>, Amount>> _getToBeBudgeted() async {
    return (await constantsProvider.getToBeBudgeted()).flatMap((a) => right(Amount.fromDouble(a)));
  }

  Future<Either<ValueFailure, Unit>> _setToBeBudgeted(Amount toBeBudgeted) async {
    return toBeBudgeted.value.fold(
      (l) => left(l),
      (r) async => (await constantsProvider.setToBeBudgeted(r)).flatMap((a) => right(unit)),
    );
  }
}
