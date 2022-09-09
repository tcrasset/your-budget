// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/models/creator.dart';
import 'package:your_budget/models/payee.dart';
import 'package:your_budget/models/queries.dart';

class PayeeCreator implements Creator<Payee> {
  final String name;
  final Queries? queryContext;

  PayeeCreator({required this.name, required this.queryContext});

  @override
  Future<Payee> create() async {
    final PayeeModel payeeModel = PayeeModel(name: name);
    final int id = await queryContext!.addPayee(payeeModel);

    return Payee(id: id, name: name);
  }
}
