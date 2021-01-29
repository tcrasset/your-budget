import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/queries.dart';

class AccountList {
  final Queries queryContext;
  List<Account> _accounts = [];

  List<Account> get accounts => _accounts;
  AccountList(
    this.queryContext,
    this._accounts,
  );

  void add(Account account){
    _accounts.add(account);
  }
}
