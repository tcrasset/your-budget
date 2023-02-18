// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/models/utils.dart';
import 'package:your_budget/presentation/pages/addTransaction/add_transaction.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/add_transaction_field.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
  });

  /// When tapping on the Date row, it opens the DataPicker
  /// which allows one to choose the date as a [DateTime].
  /// Defaults to the current day-year-month.
  Future<void> handleOnTapDate(BuildContext context) async {
    final TransactionCreatorBloc bloc = context.read<TransactionCreatorBloc>();
    final previousDate = context.read<TransactionCreatorBloc>().state.moneyTransaction.date;
    final DateTime? picked = await _pickDate(context, previousDate);
    if (picked != null && picked != previousDate) {
      bloc.add(TransactionCreatorEvent.dateChanged(picked));
    }
  }

  Future<DateTime?> _pickDate(BuildContext context, DateTime previousDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: getDateYMD(previousDate),
      firstDate: DateTime(2020),
      // firstDate: appState.startingBudgetDate,
      lastDate: getLastDayOfMonth(getMaxBudgetDate()),
    );
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCreatorBloc, TransactionCreatorState>(
      builder: (context, state) {
        return GestureDetector(
          // Date gesture detector
          onTap: () => handleOnTapDate(context),
          child: RowContainer(
            name: "Date",
            childWidget: Text(
              getDatePhrase(state.moneyTransaction.date),
              style: AddTransactionStyles.selected,
            ),
          ),
        );
      },
    );
  }
}
