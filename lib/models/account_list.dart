// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/models/object_list.dart';
import 'package:your_budget/models/queries.dart';
import 'account.dart';

class AccountList implements ObjectList<Account> {
  final Queries queryContext;
  final List<Account> _accounts;
  Account _mostRecentAccount;

  Future<Account> get mostRecentAccount async {
    if (_mostRecentAccount == null) {
      int id = await queryContext.getMostRecentAccountUsed();
      _mostRecentAccount = _getById(id);
    }
    return _mostRecentAccount ?? _accounts[0];
  }

  set mostRecentAccount(int id) {
    queryContext.updateMostRecentAccountUsed(id);
    _mostRecentAccount = _getById(id);
  }

  List<Account> get accounts => _accounts;

  AccountList(
    this.queryContext,
    this._accounts,
  );

  @override
  void add(Account account) {
    _accounts.add(account);
  }

  Account _getById(int id) {
    return _accounts.singleWhere((account) => account.id == id,
        orElse: () => null);
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
