import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/constants.dart';

import 'package:your_budget/models/entries.dart';
import 'package:your_budget/components/widgetViewClasses.dart';
import 'package:your_budget/screens/showTransactions/components/selectAccount.dart';
import 'package:your_budget/screens/showTransactions/components/transactionList.dart';
import 'package:your_budget/screens/showTransactions/modifyTransactions.dart';
import 'package:provider/provider.dart';

//TODO: Add TransactionPageState
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

  void handleModifyTransactions() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyTransactions(account)));
  }
}

class _ShowTransactionPageView
    extends WidgetView<ShowTransactionPage, _ShowTransactionPageController> {
  _ShowTransactionPageView(_ShowTransactionPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: Icon(Constants.ALLTRANSACTION_ICON),
          backgroundColor: Constants.PRIMARY_COLOR,
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.checkSquare),
              onPressed: state.handleModifyTransactions,
            ),
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
        //TODO: Staring balance does not appear before refreshing state after adding account
        if (state.account == null || appState.transactions.isEmpty) {
          return Center(
            child: Text(
              "No transactions logged. Please choose an account.",
              style: TextStyle(color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
            ),
          );
        } else {
          return TransactionList(state.account, appState, state.isEditable);
        }
      }),
    );
  }
}
