import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/constants.dart';

import 'package:mybudget/models/entries.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/screens/showTransactions/components/selectAccount.dart';
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
  bool isEditable;
  List<MoneyTransaction> moneyTransactionList;

  @override
  void initState() {
    AppState appState = Provider.of<AppState>(context, listen: false);
    if (appState.accounts.isNotEmpty) {
      account = appState.accounts[0];
    }
    isEditable = false;
    super.initState();
  }

  void handleOnAccountChanged(Account newAccount) {
    setState(() {
      account = newAccount;
    });
  }

  void handlePopUpMenuButtonSelected(String selectedItem) async {
    if (selectedItem == "Select account") {
      Account result = await Navigator.push(
          context, MaterialPageRoute(builder: (context) => SelectAccountPage()));

      if (result != null) handleOnAccountChanged(result);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _ShowTransactionPageView(this);

  void handleFloatingActionButtonPress() {
    setState(() {
      isEditable = !isEditable;
    });
  }
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
          actions: <Widget>[
            PopupMenuButton(
              onSelected: state.handlePopUpMenuButtonSelected,
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: "Select account",
                  child: Text("Select account"),
                ),
              ],
            ),
          ]),
      body: Consumer<AppState>(builder: (context, appState, child) {
        if (appState.transactions.isEmpty) {
          return Center(
            child: Text(
              "No transactions logged. Add an account first.",
              style: TextStyle(color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
            ),
          );
        } else {
          return _TransactionList(state.account, appState, state.isEditable);
        }
      }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: state.handleFloatingActionButtonPress),
    );
  }
}

class _TransactionList extends StatefulWidget {
  final Account account;
  final AppState appState;
  final bool isEditable;

  _TransactionList(this.account, this.appState, this.isEditable);

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
    List<MoneyTransaction> transactionsOfAccount = widget.appState.transactions
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
          return Card(
              child: TransactionRow(
                  transactionsOfAccount[index], widget.appState.allCategories, widget.isEditable));
        },
      ),
    ));
  }
}
