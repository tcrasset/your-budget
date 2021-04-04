// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'account.dart';
import 'object_list.dart';
import 'queries.dart';

class AccountList implements ObjectList<Account> {
  final Queries queryContext;
  final List<Account> _accounts;
  Account _mostRecentAccount;

  Future<Account> getMostRecentAccount() async {
    if (_mostRecentAccount == null) {
      final int id = await queryContext.getMostRecentAccountUsed();
      _mostRecentAccount = _getById(id);
    }
    return _mostRecentAccount ?? _accounts[0];
  }

  void setMostRecentAccount(int id) {
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
