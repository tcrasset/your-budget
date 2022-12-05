// Flutter imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:your_budget/application/budget/budget_entry.dart';
import 'package:your_budget/application/budget/budget_entry_manager_bloc/budget_entry_manager_bloc.dart';
import 'package:your_budget/application/budget/budgetvalue_watcher_bloc/budgetvalue_watcher_bloc.dart';
import 'package:your_budget/application/budget/category_watcher_bloc/category_watcher_bloc.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
// Package imports:
import 'package:your_budget/application/core/subcategory_watcher_bloc/subcategory_watcher_bloc.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
import 'package:your_budget/domain/category/category.dart';
// Project imports:
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/presentation/pages/budget/components/budget_entry_row.dart';
import 'package:your_budget/presentation/pages/budget/components/maincategory_row.dart';

class BudgetView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return const BudgetEntries();
  }
}

class BudgetEntries extends StatelessWidget {
  const BudgetEntries({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subcategoryBlocState = context.watch<SubcategoryWatcherBloc>().state;
    final budgetvalueWatcherState = context.watch<BudgetValueWatcherBloc>().state;
    final categoryBlocState = context.watch<CategoryWatcherBloc>().state;

    final Option<List<Subcategory>> subcategoriesOption = subcategoryBlocState.maybeMap(
      loadSuccess: (state) => some(state.subcategories),
      orElse: () => none(),
    );

    final Option<List<Category>> categoriesOption = categoryBlocState.maybeMap(
      loadSuccess: (state) => some(state.categories),
      orElse: () => none(),
    );

    final Option<List<BudgetValue>> budgetvaluesOption = budgetvalueWatcherState.maybeMap(
      loadSuccess: (state) => some(state.budgetvalues),
      orElse: () => none(),
    );

    if (categoriesOption.isNone()) {
      return categoryBlocState.maybeMap(
          loadFailure: (_) => const Center(child: Text("Failure.")),
          orElse: () => const CircularProgressIndicator());
    } else if (subcategoriesOption.isNone()) {
      return subcategoryBlocState.maybeMap(
          loadFailure: (_) => const Center(child: Text("Failure.")),
          orElse: () => const CircularProgressIndicator());
    } else if (budgetvaluesOption.isNone()) {
      return budgetvalueWatcherState.maybeMap(
          loadFailure: (_) => const Center(child: Text("Failure.")),
          orElse: () => const CircularProgressIndicator());
    } else {
      final subcategories = subcategoriesOption.getOrElse(() => throw Exception());
      final budgetvalues = budgetvaluesOption.getOrElse(() => throw Exception());
      final categories = categoriesOption.getOrElse(() => throw Exception());
      List<BudgetEntry> entries = [];

      for (final Subcategory subcat in subcategories) {
        final BudgetValue budgetValue =
            budgetvalues.firstWhere((element) => element.subcategoryId == subcat.id);
        entries.add(BudgetEntry(subcategory: subcat, budgetValue: budgetValue));
      }
      final List sortedList = [];
      for (final Category category in categories) {
        final correspondingEntries = entries.where((entry) => entry.categoryId == category.id);
        final budgeted = correspondingEntries.fold<double>(
            0, (total, entry) => total + entry.budgeted.getOrCrash());
        final available = correspondingEntries.fold<double>(
            0, (total, entry) => total + entry.available.getOrCrash());

        sortedList.add(MainCategoryRow(
          name: category.name.getOrCrash(),
          budgeted: budgeted,
          available: available,
        ));

        for (final BudgetEntry entry in correspondingEntries) {
          sortedList.add(BudgetEntryRow(entry: entry));
        }
      }
      return Center(
        child: Scrollbar(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final item = sortedList[index];

              if (item is MainCategoryRow) {
                return MainCategoryRow(
                    available: item.available, name: item.name, budgeted: item.budgeted);
              } else if (item is BudgetEntryRow) {
                return BudgetEntryRow(key: Key(item.entry.id.getOrCrash()), entry: item.entry);
              } else {
                return Container();
              }
            },
            itemCount: sortedList.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1, color: Colors.red),
          ),
        ),
      );
    }
  }
}
