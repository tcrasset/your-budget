import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rxdart/rxdart.dart';
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
    final failureOrPrevious =
        (await budgetvalueProvider.getById(id: value.id)).getOrElse(() => throw Exception());

    final difference = value.budgeted - failureOrPrevious.budgeted;
    final updated = value.copyWith(available: value.available + difference);
    budgetvalueProvider.update(updated);

    final toBeBudgetedAccount = accountProvider.getToBeBudgeted().getOrElse(() => throw Exception);

    accountProvider
        .update(toBeBudgetedAccount.copyWith(balance: toBeBudgetedAccount.balance - difference));

    final Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues =
        await budgetvalueProvider.getBudgetValuesBySubcategory(subcategoryId: value.subcategoryId);

    if (failureOrBudgetvalues.isLeft()) {
      return left(failureOrBudgetvalues as ValueFailure);
    }

    final DateTime nextBudgetDate = Jiffy(value.date).add(months: 1).dateTime;
    final List<BudgetValue> budgetvalues = failureOrBudgetvalues.getOrElse(() => []);
    // TODO: return error values if one fails using functional programming

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

    final failureOrUnit = await budgetvalueProvider.updateAll(toUpdate);

    return failureOrUnit.fold(
      (l) => left(l),
      (_) => right(unit),
    );
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

            final selectableSubcategories =
                subcategories.where((element) => element.id.getOrCrash() != s.UNSELECTABLE_ID);

            for (final c.Category category in selectableCategories) {
              final List<BudgetEntry> entries = [];
              final matchingSubcategories =
                  selectableSubcategories.where((subcat) => subcat.categoryID == category.id);

              for (final subcat in matchingSubcategories) {
                final budgetvalue =
                    budgetvalues.singleWhere((value) => subcat.id == value.subcategoryId);
                entries.add(BudgetEntry(subcategory: subcat, budgetValue: budgetvalue));
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
