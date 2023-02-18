// Project imports:
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/object_list.dart';
import 'package:your_budget/models/queries.dart';

class AccountList implements ObjectList<Account> {
  final Queries? queryContext;
  final List<Account?> _accounts;
  Account? _mostRecentAccount;
  int _mostRecentAccountIndex = 0;

  Future<Account?> getMostRecentAccount() async {
    if (_mostRecentAccount == null) {
      final int id = await queryContext!.getMostRecentAccountUsed();
      _mostRecentAccount = _getById(id);
      _mostRecentAccountIndex = accounts.indexOf(_mostRecentAccount);
    }
    return _mostRecentAccount ?? _accounts[0];
  }

  Future<void> setMostRecentAccount(int? id) async {
    queryContext!.updateMostRecentAccountUsed(id);
    _mostRecentAccount = _getById(id);
    _mostRecentAccountIndex = accounts.indexOf(_mostRecentAccount);
  }

  List<Account?> get accounts => _accounts;

  AccountList(
    this.queryContext,
    this._accounts,
  );

  @override
  void add(Account account) {
    _accounts.add(account);
  }

  Account? _getById(int? id) {
    return _accounts.singleWhere((account) => account!.id == id, orElse: () => null);
  }

  void creditAccount({required int? id, required double amount}) {
    final Account account = _getById(id)!;
    account.balance = account.balance! + amount;
    queryContext!.updateAccount(account);
    setMostRecentAccount(id);
  }

  void debitAccount({required int? id, required double amount}) {
    final Account account = _getById(id)!;
    account.balance = account.balance! - amount;
    queryContext!.updateAccount(account);
    setMostRecentAccount(id);
  }

  Future<Account?> cycleNextAccount() async {
    final int nextIndex = (_mostRecentAccountIndex + 1) % _accounts.length;
    final int? nextAccountId = _accounts[nextIndex]!.id;
    setMostRecentAccount(nextAccountId);
    return _getById(nextAccountId);
  }
}
