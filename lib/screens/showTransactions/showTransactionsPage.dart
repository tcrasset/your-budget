import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/constants.dart';

import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/money_transaction.dart';
import 'package:your_budget/components/widgetViewClasses.dart';
import 'package:your_budget/screens/showTransactions/components/selectAccount.dart';
import 'package:your_budget/screens/showTransactions/components/transactionList.dart';
import 'package:your_budget/screens/showTransactions/modifyTransactions.dart';
import 'package:provider/provider.dart';

class ShowTransactionPage extends StatefulWidget {
  final String title;

  const ShowTransactionPage({Key key, this.title}) : super(key: key);

  @override
  _ShowTransactionPageController createState() =>
      _ShowTransactionPageController();
}

class _ShowTransactionPageController extends State<ShowTransactionPage> {
  String filter;
  Account account;
  bool isEditable;
  List<MoneyTransaction> moneyTransactionList;

  @override
  void initState() {
    isEditable = false;
    super.initState();
  }

  void handleOnAccountChanged(Account newAccount) {
    setState(() {
      account = newAccount;
    });
  }

  @override
  Widget build(BuildContext context) => _ShowTransactionPageView(this);

  void handleModifyTransactions() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ModifyTransactions(account)));
  }
}

class _ShowTransactionPageView
    extends WidgetView<ShowTransactionPage, _ShowTransactionPageController> {
  _ShowTransactionPageView(_ShowTransactionPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: true);

    if (appState.accounts.isEmpty) return EmptyTransactionList();

    return FutureBuilder(
        future: appState.mostRecentAccount,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Account account = snapshot.data;
            return Scaffold(
              appBar: getAppbar(widget.title, state.handleModifyTransactions),
              body: AtLeastOneTransactionList(
                account: account,
                isEditable: state.isEditable,
              ),
            );
          } else {
            return EmptyTransactionList();
          }
        });
  }
}

class AtLeastOneTransactionList extends StatelessWidget {
  final bool isEditable;
  final Account account;

  const AtLeastOneTransactionList({
    Key key,
    @required this.account,
    @required this.isEditable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (_, appState, __) {
      return Column(children: [
        Text(
          account.name,
          style: TextStyle(fontSize: 20),
        ),
        Expanded(child: TransactionList(account, appState, isEditable)),
      ]);
    });
  }
}

class EmptyTransactionList extends StatelessWidget {
  const EmptyTransactionList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No transactions logged. Please choose an account.",
        style: TextStyle(
            color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
      ),
    );
  }
}

AppBar getAppbar(String title, Function() handleModifyTransactions) {
  return AppBar(
      title: Text(title),
      leading: Icon(Constants.ALLTRANSACTION_ICON),
      backgroundColor: Constants.PRIMARY_COLOR,
      actions: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.checkSquare),
          onPressed: handleModifyTransactions,
        ),
      ]);
}
