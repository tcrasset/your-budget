import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/models/constants.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/screens/showTransactions/components/transactionList.dart';
import 'package:mybudget/screens/showTransactions/showTransactionsState.dart';
import 'package:provider/provider.dart';

class ModifyTransactions extends StatefulWidget {
  final Account account;

  const ModifyTransactions(this.account, {Key key}) : super(key: key);

  @override
  _ModifyTransactionsController createState() => _ModifyTransactionsController();
}

class _ModifyTransactionsController extends State<ModifyTransactions> {
  @override
  Widget build(BuildContext context) => _ModifyTransactionsView(this);

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
      ShowTransactionsState showTransactionsState =
          Provider.of<ShowTransactionsState>(context, listen: false);
      showTransactionsState.deleteTransactions(context);
    }
  }
}

class _ModifyTransactionsView
    extends WidgetView<ModifyTransactions, _ModifyTransactionsController> {
  _ModifyTransactionsView(_ModifyTransactionsController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modify categories"),
      ),
      body: Consumer2<AppState, ShowTransactionsState>(
          builder: (_, appState, showTransactionsState, __) {
        return TransactionList(widget.account, appState, true);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => state.handleDeleteTransactions(context),
        backgroundColor: Constants.RED_COLOR,
        child: Icon(Icons.delete_outline),
      ),
    );
  }
}
