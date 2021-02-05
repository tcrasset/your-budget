import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/components/deleteDialog.dart';
import 'package:your_budget/components/widgetViewClasses.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/screens/showTransactions/components/transactionList.dart';
import 'package:your_budget/screens/showTransactions/modifyTransactionsState.dart';
import 'package:provider/provider.dart';

class ModifyTransactions extends StatefulWidget {
  final Account account;

  const ModifyTransactions(this.account, {Key key}) : super(key: key);

  @override
  _ModifyTransactionsController createState() =>
      _ModifyTransactionsController();
}

class _ModifyTransactionsController extends State<ModifyTransactions> {
  @override
  Widget build(BuildContext context) => _ModifyTransactionsView(this);

  void handleDeleteTransactions(BuildContext context) async {
    String result =
        await showDeleteDialog(context, 'Delete selected transactions?');
    if (result == "Delete") {
      ModifyTransactionsState showTransactionsState =
          Provider.of<ModifyTransactionsState>(context, listen: false);
      showTransactionsState.deleteTransactions(context);
      Navigator.pop(context);
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
        title: Text("Modify transactions"),
      ),
      body: Consumer2<AppState, ModifyTransactionsState>(
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
