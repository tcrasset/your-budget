import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/constants.dart';
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
    List<MoneyTransaction> transactionsOfAccount =
        _getMoneyTransactions(
            widget.appState.transactions, this.widget.account.id);

    return Container(
        child: Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: transactionsOfAccount.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, color: Colors.black12),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: TransactionRow(transactionsOfAccount[index],
                  widget.appState.allCategories, widget.isEditable));
        },
      ),
    ));
  }
}

List<MoneyTransaction> _getMoneyTransactions(
    UnmodifiableListView<MoneyTransaction> transactions, int currentAccountId) {
  /// Here, [currentAccountId] is the outgoingAccount.

  List<MoneyTransaction> transactionsOfAccount = [];
  for (var transaction in transactions) {
    bool isAccountPayee = transaction.payeeID < 0;

    bool currentAccountIsPayeeAccount =
        -transaction.payeeID == currentAccountId;
    bool currentAccountIsStandardAccount =
        transaction.accountID == currentAccountId;

    if ((currentAccountIsStandardAccount && !isAccountPayee) ||
        (currentAccountIsPayeeAccount && isAccountPayee)) {
      transactionsOfAccount.add(transaction);
    } else if ((currentAccountIsStandardAccount && isAccountPayee)) {
      // The transaction is reversed.i.e. removes money from outAccount(accountId)
      // into inAccount(payeeId)
      MoneyTransaction negativeAmountTransaction = transaction.copy();
      negativeAmountTransaction.amount *= -1;
      transactionsOfAccount.add(negativeAmountTransaction);
    }
  }

  return transactionsOfAccount;
}
