import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/constants.dart';

import 'package:mybudget/models/entries.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/screens/showTransactions/components/selectAccount.dart';
import 'package:mybudget/screens/showTransactions/components/transactionRow.dart';
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

  void toggleEditable() {
    setState(() {
      isEditable = !isEditable;
    });
  }

  Future<String> _showDeleteDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete selected transactions?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop("Cancel");
              },
            ),
            FlatButton(
              child: Text('Delete'),
              textColor: Constants.RED_COLOR,
              onPressed: () {
                Navigator.of(context).pop("Delete");
              },
            ),
          ],
        );
      },
    );
  }

//TODO: Finish deleted transactions
  void handleDeleteTransactions(BuildContext context) async {
    String result = await _showDeleteDialog(context);
    if (result == "Delete") {
      AppState appState = Provider.of<AppState>(context, listen: false);
      // appState.removeSubcategory(subcat.id);
      print("Deleted transactions");
    }
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
              onPressed: state.toggleEditable,
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
        if (state.account == null || appState.transactions.isEmpty) {
          return Center(
            child: Text(
              "No transactions logged. Please choose an account.",
              style: TextStyle(color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic),
            ),
          );
        } else {
          return _TransactionList(state.account, appState, state.isEditable);
        }
      }),
      floatingActionButton: state.isEditable
          ? FloatingActionButton(
              onPressed: () => state.handleDeleteTransactions(context),
              backgroundColor: Constants.RED_COLOR,
              child: Icon(Icons.delete_outline),
            )
          : null,
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
