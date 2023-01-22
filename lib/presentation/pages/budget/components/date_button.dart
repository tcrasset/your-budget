// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:your_budget/application/budget/budget_bloc/budget_bloc.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';

// Project imports:

class DateButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<BudgetDateCubit>().decrement();
          },
        ),
        BlocConsumer<BudgetDateCubit, DateTime>(
          listener: (context, state) => context.read<BudgetBloc>().add(NewBudgetRequested(state)),
          builder: (context, state) => Text(
            DateFormat.yMMMM().format(state),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () => context.read<BudgetDateCubit>().increment(),
        )
      ],
    );
  }
}
