import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/constants.dart';

import 'package:mybudget/models/entries.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/screens/showTransactions/components/transaction.dart';
import 'package:provider/provider.dart';

class ShowTransactionPage extends StatefulWidget {
  final String title;

  const ShowTransactionPage({Key key, this.title}) : super(key: key);

  @override
  _ShowTransactionPageController createState() => _ShowTransactionPageController();
}

class _ShowTransactionPageController extends State<ShowTransactionPage> {
  TextEditingController controller = new TextEditingController();
  String filter;
  Account account;
  List<MoneyTransaction> moneyTransactionList;

  @override
  void initState() {
    AppState appState = Provider.of<AppState>(context, listen: false);
    if (appState.accounts.isNotEmpty) {
      account = appState.accounts[0];
    }
    super.initState();
  }

  void handleOnAccountChanged(Account newAccount) {
    setState(() {
      account = newAccount;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _ShowTransactionPageView(this);
}

class _ShowTransactionPageView
    extends WidgetView<ShowTransactionPage, _ShowTransactionPageController> {
  _ShowTransactionPageView(_ShowTransactionPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: Icon(Constants.ALLTRANSACTION_ICON),
          backgroundColor: Constants.PRIMARY_COLOR,
          actions: appState.accounts.isEmpty
              ? null
              : <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, top: 18),
                    child: Consumer<AppState>(
                        builder: (_, appState, __) => DropdownButton<Account>(
                              value: state.account,
                              selectedItemBuilder: (BuildContext context) {
                                return appState.accounts.map((Account account) {
                                  return Text(
                                    "Account: ${account.name}",
                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                  );
                                }).toList();
                              },
                              onChanged: state.handleOnAccountChanged,
                              items: appState.accounts
                                  .map<DropdownMenuItem<Account>>((Account account) {
                                return DropdownMenuItem<Account>(
                                  value: account,
                                  child: Text(
                                    account.name,
                                    style: TextStyle(color: Colors.black, fontSize: 18),
                                  ),
                                );
                              }).toList(),
                            )),
                  )
                ],
        ),
        body: Consumer<AppState>(builder: (context, appState, child) {
          if (appState.transactions.isEmpty) {
            return Center(
              child: Text(
                "No transactions logged. Add an account first.",
                style: TextStyle(color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
              ),
            );
          } else {
            return _TransactionList(state.account);
          }
        }));
  }
}

class _TransactionList extends StatefulWidget {
  final Account account;
  _TransactionList(this.account);

  @override
  __TransactionListState createState() => __TransactionListState();
}

class __TransactionListState extends State<_TransactionList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    List<MoneyTransaction> transactionsOfAccount = appState.transactions
        .where((transaction) => transaction.accountID == this.widget.account.id)
        .toList();

    return new Container(
        child: Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: new ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: transactionsOfAccount.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, color: Colors.black12),
        itemBuilder: (BuildContext context, int index) {
          return Card(child: TransactionRow(transactionsOfAccount[index], appState.allCategories));
        },
      ),
    ));
  }
}
