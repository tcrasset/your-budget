import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mybudget/models/SQLQueries.dart';

class BudgetPageState extends ChangeNotifier {
  bool showButtonDial = false;
  Map<int, bool> _isSelectedMap = HashMap();
  int selectedId = 0;

  void addEntry(int subcategoryId) {
    this._isSelectedMap[subcategoryId] = false;
  }

  void updateIsSelected(int subcategoryId) async {
    int subcategoryCount = await SQLQueryClass.subcategoryCount();

    for (int i = 1; i < subcategoryCount; i++) {
      this._isSelectedMap[i] = false;
    }
    this._isSelectedMap[subcategoryId] = true;
    selectedId = subcategoryId;
    print("update : $selectedId");
  }

  bool isSelected(int subcategoryId) {
    return this._isSelectedMap[subcategoryId];
  }

  void toggleButtonDial(int subcategoryId) {
    if (!showButtonDial) {
      showButtonDial = true;
    } else if (subcategoryId == selectedId) {
      showButtonDial = false;
    }
    notifyListeners();
  }
}
