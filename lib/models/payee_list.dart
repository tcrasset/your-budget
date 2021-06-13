// Project imports:
import 'object_list.dart';
import 'payee.dart';
import 'queries.dart';

class PayeeList implements ObjectList<Payee> {
  final Queries? queryContext;

  final List<Payee?> _payees;

  List<Payee?> get payees => _payees;

  PayeeList(this.queryContext, this._payees);

  @override
  void add(Payee? payee) {
    _payees.add(payee);
  }
}
