import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction.dart';

class TransactionRepository {
  final ITransactionProvider transactionProvider;

  TransactionRepository({required this.transactionProvider});

  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> _transactions(UniqueId accountId) =>
      transactionProvider.watchAccountTransactions(accountId.toString());

  Stream<Either<ValueFailure<dynamic>, List<MoneyTransaction>>> getTransactionsByAccount(
          UniqueId accountId) =>
      _transactions(accountId);
}
