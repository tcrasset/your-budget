import 'dart:async';
import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rxdart/rxdart.dart';
import 'package:your_budget/dartz_x.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/budget/budget.dart';
import 'package:your_budget/domain/budget/budget_entry.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/category/category.dart' as c;
import 'package:your_budget/domain/category/i_category_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart' as s;
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';

class BudgetRepository {
  // Inspired from https://bloclibrary.dev/#/fluttertodostutorial

  final IBudgetValueProvider budgetvalueProvider;
  final ISubcategoryProvider subcategoryProvider;
  final ICategoryProvider categoryProvider;
  final IAccountProvider accountProvider;

  BudgetRepository({
    required this.subcategoryProvider,
    required this.categoryProvider,
    required this.budgetvalueProvider,
    required this.accountProvider,
  });

  Future<Either<ValueFailure<dynamic>, Unit>> updateBudgetValue(BudgetValue value) async {
    return budgetvalueProvider.getById(id: value.id).flatMap((stored) async {
      final difference = value.budgeted - stored.budgeted;
      return updateBudgetValueOfCurrentMonth(value, difference)
          .andThen(updateToBeBudgeted(difference))
          .andThen(updateBudgetValuesOfOtherMonths(value, difference));
    });
  }

  Future<Either<ValueFailure<dynamic>, Unit>> updateBudgetValuesOfOtherMonths(
    BudgetValue value,
    Amount difference,
  ) async =>
      budgetvalueProvider
          .getBudgetValuesBySubcategory(subcategoryId: value.subcategoryId)
          .flatMap((budgetvalues) {
        final DateTime nextBudgetDate = Jiffy(value.date).add(months: 1).dateTime;

        final toUpdate = budgetvalues
            .where(
              (element) =>
                  isMonthBetweenInclusive(
                    query: element.date,
                    lowerBound: nextBudgetDate,
                    upperBound: getMaxBudgetDate(),
                  ) &&
                  element.subcategoryId == value.subcategoryId,
            )
            .map((value) => value.copyWith(available: value.available + difference))
            .toList();

        if (toUpdate.isEmpty) {
          // If we update the last month of the budget, there is nothing to update.
          return Future.value(right(unit));
        }
        return budgetvalueProvider.updateAll(toUpdate);
      });

  Future<Either<ValueFailure, Unit>> updateToBeBudgeted(Amount difference) async {
    return Future.value(accountProvider.getToBeBudgeted()).flatMap<Unit>(
      (account) => accountProvider.update(
        account.copyWith(balance: account.balance - difference),
      ),
    );
  }

  Future<Either<ValueFailure<dynamic>, Unit>> updateBudgetValueOfCurrentMonth(
    BudgetValue value,
    Amount difference,
  ) async {
    final updated = value.copyWith(available: value.available + difference);
    return budgetvalueProvider.update(updated);
  }

  Stream<Either<ValueFailure<dynamic>, Budget>> getBudgetByDate(int year, int month) =>
      Rx.combineLatest3(
        subcategoryProvider.watchAllSubcategories(),
        categoryProvider.watchAllCategories(),
        budgetvalueProvider.watchAllBudgetValues(year: year, month: month),
        (
          Either<ValueFailure<dynamic>, List<s.Subcategory>> subcategories,
          Either<ValueFailure<dynamic>, List<c.Category>> categories,
          Either<ValueFailure<dynamic>, List<BudgetValue>> budgetvalues,
        ) =>
            Either.map3(
          budgetvalues,
          subcategories,
          categories,
          (
            List<BudgetValue> budgetvalues,
            List<s.Subcategory> subcategories,
            List<c.Category> categories,
          ) {
            final List<BudgetEntryGroups> groups = [];
            final selectableCategories =
                categories.where((element) => element.id.getOrCrash() != c.UNSELECTABLE_ID);

            final selectableSubcategories = subcategories.where(
              (element) =>
                  element.id.getOrCrash() != s.UNSELECTABLE_ID &&
                  element.id.getOrCrash() != DatabaseConstants.TO_BE_BUDGETED_ID,
            );

            for (final c.Category category in selectableCategories) {
              final List<BudgetEntry> entries = [];
              final correspondingSubcategories =
                  selectableSubcategories.where((subcat) => subcat.categoryID == category.id);

              for (final subcat in correspondingSubcategories) {
                final budgetvalue = budgetvalues.where((value) => subcat.id == value.subcategoryId);
                if (budgetvalue.isEmpty) {
                  // Because we use BehaviorSubjets to trigger an update of the budgets when adding
                  // a subcategory, there exists a moment when adding a new subcategory triggers
                  // getBudgetByDate(), but at that time, there are no BudgetValues that have been
                  // created yet. We thus have to skip the addition of this BudgetEntry to the Budget.
                  //
                  // The very next budget, the one that will get created when adding all the BudgetValues,
                  // will have the correct BudgetEntry with the BudgetValues.
                  continue;
                }
                // We want to have the behavior of singleWhere, but can't use it directly
                // because of reasoning above
                assert(budgetvalue.length == 1);
                entries.add(BudgetEntry(subcategory: subcat, budgetValue: budgetvalue.first));
              }

              groups.add(
                BudgetEntryGroups(
                  category: category,
                  entries: entries,
                ),
              );
            }

            return Budget(date: DateTime(year, month), toBeBudgeted: Amount("0"), groups: groups);
          },
        ),
      );
}
