import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/screens/addTransaction/components/CurrencyInputFormatter.dart';
import 'package:provider/provider.dart';

class BudgetPageState extends ChangeNotifier {
  bool showButtonDial = false;
  Map<int, bool> _isSelectedMap = HashMap();
  int selectedId = -1;
  MoneyMaskedTextController budgetedController;
  String budgetedText = "";

  bool isSelected(int subcategoryId) {
    return this._isSelectedMap[subcategoryId];
  }

  Map<int, bool> get isSelectedMap => _isSelectedMap;

  void updateIsSelected(int subcategoryId) async {
    //Set all selected to false
    _isSelectedMap.forEach((k, v) => _isSelectedMap[k] = false);

    if (subcategoryId == -1) {
      selectedId = -1;
    } else if (selectedId != subcategoryId) {
      // Select the subcategory if we tapped on a different one than the one
      // that is currently highlighted
      this._isSelectedMap[subcategoryId] = true;
      selectedId = subcategoryId;
      resetText();
    } else {
      // The same subcategory was tapped, we remove the highlight i.e. we don't
      // put it back to [true]
      selectedId = -1;
    }
    print("Selected : $selectedId");
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
    double amount = formatCurrencyToDouble(budgetedText, true);
    budgetedController.updateValue(amount);
    print(budgetedText);
  }

  void removeDigit() {
    try {
      budgetedText = budgetedText.substring(0, budgetedText.length - 1);
      double amount = formatCurrencyToDouble(budgetedText, true);
      budgetedController.updateValue(amount);
      print(budgetedText);
    } on RangeError {
      print('Cannot remove any more digits');
    }
  }

  void submitValue(BuildContext context) {
    /// When the budget value gets changed, change the shown budget value,
    /// but also the available value.
    print("Changed budgeted value in subcategory");
    AppState appState = Provider.of<AppState>(context, listen: false);

    SubCategory selectedSubcategory =
        appState.subcategories.singleWhere((subcat) => subcat.id == selectedId);

    if (budgetedController.numberValue != selectedSubcategory.budgeted) {
      double beforeAfterDifference =
          (budgetedController.numberValue - selectedSubcategory.budgeted);
      appState.updateSubcategory(SubCategory(
          selectedSubcategory.id,
          selectedSubcategory.parentId,
          selectedSubcategory.name,
          budgetedController.numberValue,
          selectedSubcategory.available + beforeAfterDifference));

      print("Previous subcat : \n $selectedSubcategory \n");
      print(
          "Next subcat : \n ${SubCategory(selectedSubcategory.id, selectedSubcategory.parentId, selectedSubcategory.name, budgetedController.numberValue, selectedSubcategory.available + beforeAfterDifference)} \n");

      resetText();
    }
  }

  void resetText() {
    budgetedText = "";
  }

  void setSubcategory(SubCategory subcat) {
    this._isSelectedMap[subcat.id] = false;
  }
}
