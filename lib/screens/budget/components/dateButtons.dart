import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/screens/budget/budgetPageState.dart';

class DateButtons extends StatelessWidget {
  void handleButtonOnPressed(
      BuildContext context, AppState appState, bool increment) {
    increment ? appState.incrementMonth() : appState.decrementMonth();
    BudgetPageState buttonDialState =
        Provider.of<BudgetPageState>(context, listen: false);
    buttonDialState.toggleButtonDial(-1);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (_, appState, __) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => handleButtonOnPressed(context, appState, false)),
          Text(
              "${appState.currentBudget.monthAsString} ${appState.currentBudget.year}",
              style: TextStyle(fontSize: 20)),
          IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () => handleButtonOnPressed(context, appState, true))
        ],
      );
    });
  }
}
