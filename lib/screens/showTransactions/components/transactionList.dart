import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/screens/showTransactions/components/transactionRow.dart';

class TransactionList extends StatefulWidget {
  final Account account;
  final AppState appState;
  final bool isEditable;

  TransactionList(this.account, this.appState, this.isEditable);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
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
