import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
import 'package:provider/provider.dart';

class DeleteCategoriesState extends ChangeNotifier {
  Map<int, bool> _isSelectedMap = HashMap();
  int nbSelected = 0;

  bool isSelected(int categoryId) {
    return this._isSelectedMap[categoryId];
  }

  void updateIsSelected(int categoryId) async {
    if (_isSelectedMap[categoryId]) {
      _isSelectedMap[categoryId] = false;
      nbSelected--;
    } else {
      _isSelectedMap[categoryId] = true;
      nbSelected++;
    }

    print(nbSelected);
  }

  void setCategories(int categoryId) {
    this._isSelectedMap[categoryId] = false;
  }

  void deleteCategories(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);
    List<int> categoryIdsToDelete = [];
    _isSelectedMap.forEach((categoryId, value) {
      if (_isSelectedMap[categoryId]) {
        categoryIdsToDelete.add(categoryId);
      }
    });
    categoryIdsToDelete.forEach((categoryId) {
      appState.deleteCategory(categoryId);
      _isSelectedMap.remove(categoryId);
    });

    print("Deleted categories $categoryIdsToDelete");
  }
}
