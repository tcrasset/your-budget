// Flutter imports:

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_budget/application/budget/budget_bloc/budget_bloc.dart';
// Package imports:
// Project imports:
import 'package:your_budget/presentation/pages/budget/components/budget_entry_row.dart';
import 'package:your_budget/presentation/pages/budget/components/main_category_row.dart';

class BudgetEntries extends StatelessWidget {
  const BudgetEntries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetBloc, BudgetState>(
      builder: (context, state) {
        if (state.status == BudgetOverviewStatus.loading ||
            state.status == BudgetOverviewStatus.initial) {
          return const CircularProgressIndicator.adaptive();
        } else if (state.status == BudgetOverviewStatus.failure) {
          return const CircularProgressIndicator.adaptive();
        } else if (state.status == BudgetOverviewStatus.success) {
          final List<Widget> items = state.budget!.groups.fold(
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
}
