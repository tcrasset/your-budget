import 'package:dartz/dartz.dart';
import 'package:your_budget/application/core/account_watcher_bloc/account_watcher_bloc.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction.dart';

class PayeeRepository {
  final IPayeeProvider payeeProvider;

  PayeeRepository({
    required this.payeeProvider,
  });

  Stream<Either<ValueFailure<dynamic>, List<Payee>>> _payees() => payeeProvider.watchAllPayees();

  Stream<Either<ValueFailure<dynamic>, List<Payee>>> getPayees() => _payees();

  Future<Either<ValueFailure<dynamic>, Unit>> createPayee(Payee payee) async =>
      payeeProvider.create(payee);
}
