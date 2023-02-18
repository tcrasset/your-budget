// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/components/delete_dialog.dart';
import 'package:your_budget/components/widget_view_classes.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/core/transactions/transaction_list.dart';
import 'package:your_budget/presentation/pages/modifyTransactions/modify_transaction_state.dart';

class ModifyTransactions extends StatefulWidget {
  final Account account;

  const ModifyTransactions(this.account, {super.key});

  @override
  _ModifyTransactionsController createState() => _ModifyTransactionsController();
}

class _ModifyTransactionsController extends State<ModifyTransactions> {
  @override
  Widget build(BuildContext context) => _ModifyTransactionsView(this);

  Future<void> handleDeleteTransactions(BuildContext context) async {
    final String? result = await showDeleteDialog(context, 'Delete selected transactions?');
    if (result == "Delete") {
      final ModifyTransactionsState showTransactionsState =
          Provider.of<ModifyTransactionsState>(context, listen: false);
      showTransactionsState.deleteTransactions(context);
      Navigator.pop(context);
    }
  }
}

class _ModifyTransactionsView
    extends WidgetView<ModifyTransactions, _ModifyTransactionsController> {
  const _ModifyTransactionsView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modify transactions"),
      ),
      body: Consumer2<AppState, ModifyTransactionsState>(
        builder: (_, appState, showTransactionsState, __) {
          return TransactionList(widget.account, appState, true);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => state.handleDeleteTransactions(context),
        backgroundColor: Constants.RED_COLOR,
        child: const Icon(Icons.delete_outline),
      ),
    );
  }
}
