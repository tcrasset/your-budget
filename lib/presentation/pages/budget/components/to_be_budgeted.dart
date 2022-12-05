// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:your_budget/application/budget/budgetvalue_watcher_bloc/budgetvalue_watcher_bloc.dart';

// Project imports:
import '../../../../appstate.dart';
import '../../../../models/constants.dart';

class ToBeBudgeted extends StatelessWidget {
  final TextStyle _textStyle =
      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0);

  final TextStyle _positiveAmountTextStyle =
      const TextStyle(color: Constants.GREEN_COLOR, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle =
      const TextStyle(color: Constants.RED_COLOR, fontSize: 32.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Text(
              "To be budgeted",
              style: _textStyle,
            ),
          ),
          Expanded(
            child: BlocBuilder<BudgetValueWatcherBloc, BudgetValueWatcherState>(
              builder: (context, state) => state.map(
                initial: (_) => const CircularProgressIndicator(),
                loading: (_) => const CircularProgressIndicator(),
                loadFailure: (_) => const Text("Failed to load."),
                loadSuccess: (instance) => Text("1000€"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
