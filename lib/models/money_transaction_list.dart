// Project imports:
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/money_transaction.dart';
import 'package:your_budget/models/object_list.dart';
import 'package:your_budget/models/queries.dart';

class MoneyTransactionList implements ObjectList<MoneyTransaction> {
  final Queries? queryContext;

  final List<MoneyTransaction?> _transactions;

  List<MoneyTransaction?> get transactions => _transactions;

  MoneyTransactionList(this.queryContext, this._transactions);

  @override
  void add(MoneyTransaction? moneytransaction) {
    _transactions.add(moneytransaction);
  }

  void remove(int? id) {
    _transactions.removeWhere((transaction) => transaction!.id == id);
  }

  MoneyTransaction? getById(int? id) {
    return _transactions.singleWhere((transaction) => transaction!.id == id, orElse: () => null);
  }

  List<MoneyTransaction?> getAllBySubcatId(int subcatId) {
    return _transactions.where((transaction) => transaction!.subcatID == subcatId).toList();
  }

  List<MoneyTransaction?> getToBeBudgetedTransactions() {
    return getAllBySubcatId(Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION);
  }
}
