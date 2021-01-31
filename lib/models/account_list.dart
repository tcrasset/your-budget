import 'package:meta/meta.dart';
import 'package:your_budget/models/object_list.dart';
import 'package:your_budget/models/queries.dart';

import 'account.dart';

class AccountList implements ObjectList<Account> {
  final Queries queryContext;
  List<Account> _accounts = [];

  List<Account> get accounts => _accounts;
  AccountList(
    this.queryContext,
    this._accounts,
  );

  void add(Account account) {
    _accounts.add(account);
  }

  Account _getById(int id) {
    return _accounts.singleWhere((account) => account.id == id);
  }

  void creditAccount({@required int id, @required double amount}) {
    final Account account = _getById(id);
    account.balance += amount;
    queryContext.updateAccount(account);
  }

  void debitAccount({@required int id, @required double amount}) {
    final Account account = _getById(id);
    account.balance -= amount;
    queryContext.updateAccount(account);
  }
}
