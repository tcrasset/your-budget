import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';

class ToBeBudgetedRepository {
  final ISubcategoryProvider subcategoryProvider;
  final ITransactionProvider transactionProvider;
  final IConstantsProvider constantsProvider;

  ToBeBudgetedRepository({
    required this.subcategoryProvider,
    required this.transactionProvider,
    required this.constantsProvider,
  });

  Future<Either<ValueFailure<dynamic>, Amount>> getToBeBudgeted() async {
    return (await constantsProvider.getToBeBudgeted()).flatMap((a) => right(Amount.fromDouble(a)));
  }

  Future<Either<ValueFailure, Unit>> setToBeBudgeted(Amount toBeBudgeted) async {
    return toBeBudgeted.value.fold(
      (l) => left(l),
      (r) async => (await constantsProvider.setToBeBudgeted(r)).flatMap((a) => right(unit)),
    );
  }
}
