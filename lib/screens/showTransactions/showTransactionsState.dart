import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/entries.dart';
import 'package:provider/provider.dart';

class ShowTransactionsState extends ChangeNotifier {
  Map<int, bool> _isSelectedMap = HashMap();
  int nbSelected = 0;

  bool isSelected(int transactionId) {
    return this._isSelectedMap[transactionId];
  }

  void updateIsSelected(int transactionId) async {
    if (_isSelectedMap[transactionId]) {
      _isSelectedMap[transactionId] = false;
      nbSelected--;
    } else {
      _isSelectedMap[transactionId] = true;
      nbSelected++;
    }

    print(nbSelected);
  }

  void setTransaction(int transactionId) {
    this._isSelectedMap[transactionId] = false;
  }

  void deleteTransactions(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);
    List<int> transactionIdsToDelete = [];
    _isSelectedMap.forEach((transactionId, value) {
      if (_isSelectedMap[transactionId]) {
        transactionIdsToDelete.add(transactionId);
      }
    });
    transactionIdsToDelete.forEach((transactionId) {
      // appState.deleteTransaction(transactionId);
      _isSelectedMap.remove(transactionId);
    });

    print("Deleted transactions $transactionIdsToDelete");
  }
}
