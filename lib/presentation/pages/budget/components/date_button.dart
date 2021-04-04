// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/presentation/pages/budget/budget_page_state.dart';

class DateButtons extends StatelessWidget {
  void handleButtonOnPressed(
      BuildContext context, AppState appState, bool increment) {
    increment ? appState.incrementMonth() : appState.decrementMonth();
    final BudgetPageState buttonDialState =
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
              icon: const Icon(Icons.arrow_back),
              onPressed: () => handleButtonOnPressed(context, appState, false)),
          Text(
              "${appState.currentBudget.monthAsString} ${appState.currentBudget.year}",
              style: const TextStyle(fontSize: 20)),
          IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => handleButtonOnPressed(context, appState, true))
        ],
      );
    });
  }
}
