// Dart imports:
import 'dart:collection';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../appstate.dart';
import '../../../../models/account.dart';
import '../../../../models/money_transaction.dart';
import 'transaction_row.dart';

class TransactionList extends StatefulWidget {
  final Account account;
  final AppState appState;
  final bool isEditable;

  const TransactionList(this.account, this.appState, this.isEditable);

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
    final List<MoneyTransaction> transactionsOfAccount =
        _getMoneyTransactions(widget.appState.transactions, widget.account.id);

    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: transactionsOfAccount.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1, color: Colors.black12),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: TransactionRow(transactionsOfAccount[index],
                  widget.appState.allCategories, widget.isEditable));
        },
      ),
    );
  }
}

List<MoneyTransaction> _getMoneyTransactions(
    UnmodifiableListView<MoneyTransaction> transactions, int currentAccountId) {
  /// Here, [currentAccountId] is the outgoingAccount.

  final List<MoneyTransaction> transactionsOfAccount = [];
  for (final transaction in transactions) {
    final bool isAccountPayee = transaction.payeeID < 0;

    final bool currentAccountIsPayeeAccount =
        -transaction.payeeID == currentAccountId;
    final bool currentAccountIsStandardAccount =
        transaction.accountID == currentAccountId;

    if ((currentAccountIsStandardAccount && !isAccountPayee) ||
        (currentAccountIsPayeeAccount && isAccountPayee)) {
      transactionsOfAccount.add(transaction);
    } else if (currentAccountIsStandardAccount && isAccountPayee) {
      // The transaction is reversed.i.e. removes money from outAccount(accountId)
      // into inAccount(payeeId)
      final MoneyTransaction negativeAmountTransaction = transaction.copyWith();
      negativeAmountTransaction.amount *= -1;
      transactionsOfAccount.add(negativeAmountTransaction);
    }
  }
  transactionsOfAccount.sort((a, b) => a.date.compareTo(b.date));
  return transactionsOfAccount.reversed.toList();
}
