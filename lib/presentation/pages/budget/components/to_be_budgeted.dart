// Flutter imports:
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_budget/application/budget/to_be_budgeted_bloc/to_be_budgeted_bloc.dart';

// Package imports:

// Project imports:
import 'package:your_budget/models/constants.dart';

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
            child: BlocBuilder<ToBeBudgetedBloc, ToBeBudgetedState>(
              builder: (context, state) {
                switch (state.status) {
                  case ToBeBudgetedStatus.initial:
                  case ToBeBudgetedStatus.loading:
                    return const CircularProgressIndicator();
                  case ToBeBudgetedStatus.failure:
                    return const Text("Failure", style: TextStyle(color: Colors.red));
                  case ToBeBudgetedStatus.success:
                    return Text(state.amount.getOrCrash().toStringAsFixed(2));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
