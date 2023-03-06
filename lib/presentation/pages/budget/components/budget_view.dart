// Flutter imports:

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_budget/application/budget/budget_bloc/budget_bloc.dart';
import 'package:your_budget/domain/budget/budget.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/models/constants.dart';
// Package imports:
// Project imports:
import 'package:your_budget/presentation/pages/budget/components/budget_entry_row.dart';
import 'package:your_budget/presentation/pages/budget/components/main_category_row.dart';

class BudgetEntries extends StatelessWidget {
  const BudgetEntries({
    super.key,
  });

  void showErrorSnackbar({required ValueFailure failure, required BuildContext context}) {
    final String? message = failure.maybeMap(
      unexpected: (_) => "Unexpected exception. Contact support.",
      orElse: () => null,
    );

    if (message == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Constants.RED_COLOR,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BudgetBloc, BudgetState>(
      listenWhen: (p, c) => p.error != c.error,
      listener: (context, state) => optionOf(state.error).fold(
        () /*None*/ {},
        (error) /* Some*/ => showErrorSnackbar(failure: error, context: context),
      ),
      builder: (context, state) {
        if (state.status == BudgetOverviewStatus.loading ||
            state.status == BudgetOverviewStatus.initial) {
          return const CircularProgressIndicator();
        } else if (state.status == BudgetOverviewStatus.failure) {
          return const CircularProgressIndicator();
        } else if (state.status == BudgetOverviewStatus.success) {
          final List<Widget> items = createListFromBudgetEntryGroups(state.budget!.groups);

          return Center(
            child: Scrollbar(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => items[index],
                itemCount: items.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(height: 1, color: Colors.purple),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  List<Widget> createListFromBudgetEntryGroups(List<BudgetEntryGroups> groups) {
    return groups.fold(
      [],
      (items, group) => [
        ...items,
        MainCategoryRow(
          name: group.category.name.getOrCrash(),
          budgeted: group.totalBudgeted.getOrCrash(),
          available: group.totalAvailable.getOrCrash(),
        ),
        ...group.entries.map((e) => BudgetEntryRow(key: UniqueKey(), entry: e)),
      ],
    );
  }
}
