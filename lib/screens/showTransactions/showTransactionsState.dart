import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/entries.dart';
import 'package:provider/provider.dart';

class ShowTransactionsState extends ChangeNotifier {
  Map<int, bool> _isSelectedMap = HashMap();

  bool isSelected(int transactionId) {
    return this._isSelectedMap[transactionId];
  }

  void updateIsSelected(int transactionId) async {
    _isSelectedMap[transactionId] = !_isSelectedMap[_isSelectedMap];
  }

  void setTransaction(MoneyTransaction moneyTransaction) {
    this._isSelectedMap[moneyTransaction.id] = false;
  }

  void deleteTransactions(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);
    _isSelectedMap.forEach((transactionId, value) {
      if (_isSelectedMap[transactionId]) {
        // appState.deleteTransaction(transactionId);

        _isSelectedMap.remove(transactionId);
      }
    });
  }
}
