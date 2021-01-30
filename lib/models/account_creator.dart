import 'package:meta/meta.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/creator.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/money_transaction.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/money_transaction_creator.dart';

class AccountCreator implements Creator<Account> {
  final Queries queryContext;
  final String name;
  final double balance;

  int id;

  AccountCreator(
      {@required this.queryContext,
      @required this.name,
      @required this.balance});

  Future<Account> create() async {
    AccountModel accountModel =
        AccountModel(name: this.name, balance: this.balance);
    this.id = await queryContext.addAccount(accountModel);
    Account account = Account(id: id, balance: this.balance, name: this.name);
    return account;
  }

  Future<MoneyTransaction> getStartingMoneyTransaction() async {
    Creator<MoneyTransaction> moneyTransactionCreator = MoneyTransactionCreator(
      queryContext: queryContext,
      subcatId: Constants.UNASSIGNED_SUBCAT_ID,
      payeeId: Constants.UNASSIGNED_PAYEE_ID,
      accountId: this.id,
      amount: this.balance,
      memo: "Starting balance",
      date: DateTime.now(),
    );

    return
        await moneyTransactionCreator.create();
  }
}
