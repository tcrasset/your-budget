// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_budget/application/budget/budget_bloc/budget_bloc.dart';
// Package imports:
import 'package:your_budget/domain/budget/budget_repository.dart';
// Project imports:
import 'package:your_budget/presentation/pages/budget/components/budget_entry_row.dart';
import 'package:your_budget/presentation/pages/budget/components/maincategory_row.dart';

class BudgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetBloc(budgetRepository: context.read<BudgetRepository>())
        ..add(BudgetEvent.NewBudgetRequested(DateTime.now())),
      child: const BudgetEntries(),
    );
  }
}

class BudgetEntries extends StatelessWidget {
  const BudgetEntries({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BudgetBloc, BudgetState>(
      buildWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) => print("budget date is ${state.budget?.date}"),
      builder: (context, state) {
        print("new state");
        if (state.status == BudgetOverviewStatus.loading ||
            state.status == BudgetOverviewStatus.initial) {
          return const CircularProgressIndicator.adaptive();
        } else if (state.status == BudgetOverviewStatus.failure) {
          print(state.error);
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
              ...group.entries.map((e) => BudgetEntryRow(key: UniqueKey(), entry: e)).toList(),
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
