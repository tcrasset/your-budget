
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/queries.dart';

class PayeeList {

  final Queries queryContext;

  List<Payee> _payees;

  List<Payee> get payees => _payees;

  PayeeList(this.queryContext, this._payees);

  void add(Payee payee) {
    _payees.add(payee);
  }
}
