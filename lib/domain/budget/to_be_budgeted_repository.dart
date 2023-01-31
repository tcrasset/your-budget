import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';

class ToBeBudgetedRepository {
  final ISubcategoryProvider subcategoryProvider;
  final ITransactionProvider transactionProvider;

  ToBeBudgetedRepository({
    required this.subcategoryProvider,
    required this.transactionProvider,
  });

  Future<Either<ValueFailure<dynamic>, Amount>> getToBeBudgeted() async {
    return right(Amount.fromDouble(0));
  }
}
