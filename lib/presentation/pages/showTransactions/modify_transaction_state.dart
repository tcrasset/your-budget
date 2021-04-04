// Dart imports:
import 'dart:collection';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../appstate.dart';

class ModifyTransactionsState extends ChangeNotifier {
  final Map<int, bool> _isSelectedMap = HashMap();
  int nbSelected = 0;

  bool isSelected(int transactionId) {
    return _isSelectedMap[transactionId];
  }

  Future<void> updateIsSelected(int transactionId) async {
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
    _isSelectedMap[transactionId] = false;
  }

  void deleteTransactions(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    final List<int> transactionIdsToDelete = [];
    _isSelectedMap.forEach((transactionId, value) {
      if (_isSelectedMap[transactionId]) {
        transactionIdsToDelete.add(transactionId);
      }
    });
    transactionIdsToDelete.forEach((transactionId) {
      appState.deleteTransaction(transactionId);
      _isSelectedMap.remove(transactionId);
    });

    print("Deleted transactions $transactionIdsToDelete");
  }
}
