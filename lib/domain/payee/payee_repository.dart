import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/payee/payee.dart';

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
