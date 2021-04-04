// Dart imports:
import 'dart:collection';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../appstate.dart';
import '../../../models/categories.dart';
import '../addTransaction/components/currency_input_formatter.dart';

class BudgetPageState extends ChangeNotifier {
  bool showButtonDial = false;
  final Map<int, bool> _isSelectedMap = HashMap();
  int selectedId = -1;
  MoneyMaskedTextController budgetedController;
  String budgetedText = "";

  bool isSelected(int subcategoryId) {
    return _isSelectedMap[subcategoryId];
  }

  Map<int, bool> get isSelectedMap => _isSelectedMap;

  Future<void> updateIsSelected(int subcategoryId) async {
    //Set all selected to false
    _isSelectedMap.forEach((k, v) => _isSelectedMap[k] = false);

    if (subcategoryId == -1) {
      selectedId = -1;
    } else if (selectedId != subcategoryId) {
      // Select the subcategory if we tapped on a different one than the one
      // that is currently highlighted
      _isSelectedMap[subcategoryId] = true;
      selectedId = subcategoryId;
      resetText();
    } else {
      // The same subcategory was tapped, we remove the highlight i.e. we don't
      // put it back to [true]
      selectedId = -1;
    }
    notifyListeners();
  }

  void toggleButtonDial(int subcategoryId) {
    if (subcategoryId == -1) {
      // When pressing date button
      showButtonDial = false;
      updateIsSelected(-1);
    } else if (!showButtonDial) {
      showButtonDial = true;
    } else if (subcategoryId == selectedId) {
      showButtonDial = false;
    }
    notifyListeners();
  }

  void addDigit(String digit) {
    budgetedText += digit;
    final double amount = formatCurrencyToDouble(budgetedText, true);
    budgetedController.updateValue(amount);
    print(budgetedText);
  }

  void removeDigit() {
    try {
      budgetedText = budgetedText.substring(0, budgetedText.length - 1);
      final double amount = formatCurrencyToDouble(budgetedText, true);
      budgetedController.updateValue(amount);
      print(budgetedText);
    } on RangeError {
      print('Cannot remove any more digits');
    }
  }

  void submitValue(BuildContext context) {
    /// When the budget value gets changed, change the shown budget value,
    /// but also the available value.
    final AppState appState = Provider.of<AppState>(context, listen: false);

    final SubCategory selectedSubcategory =
        appState.subcategories.singleWhere((subcat) => subcat.id == selectedId);

    if (budgetedController.numberValue != selectedSubcategory.budgeted) {
      final double beforeAfterDifference =
          budgetedController.numberValue - selectedSubcategory.budgeted;
      appState.updateSubcategoryValues(
          SubCategory(
              id: selectedSubcategory.id,
              parentId: selectedSubcategory.parentId,
              name: selectedSubcategory.name,
              budgeted: budgetedController.numberValue,
              available: selectedSubcategory.available + beforeAfterDifference),
          appState.currentBudgetDate);

      resetText();
      closeButtonDialAndUpdate();
    }
  }

  void closeButtonDialAndUpdate() {
    showButtonDial = false;
    notifyListeners();
  }

  void resetText() {
    budgetedText = "";
  }

  void setSubcategory(SubCategory subcat) {
    _isSelectedMap[subcat.id] = false;
  }
}
