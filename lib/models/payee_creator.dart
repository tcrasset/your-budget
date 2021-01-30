import 'package:meta/meta.dart';
import 'package:your_budget/models/creator.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/entries_model.dart';
import 'package:your_budget/models/queries.dart';

class PayeeCreator implements Creator<Payee> {
  final String name;
  final Queries queryContext;

  PayeeCreator({@required this.name, @required this.queryContext});

  @override
  Future<Payee> create() async {
    PayeeModel payeeModel = PayeeModel(name: name);
    int id = await queryContext.addPayee(payeeModel);

    return Payee(id: id, name: name);
  }
}
