import 'dart:async';
import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rxdart/rxdart.dart';
import 'package:your_budget/domain/budget/budget.dart';
import 'package:your_budget/domain/budget/budget_entry.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/category/category.dart';
import 'package:your_budget/domain/category/i_category_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';

import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/models/utils.dart';

class BudgetRepository {
  // Inspired from https://bloclibrary.dev/#/fluttertodostutorial

  final IBudgetValueProvider budgetvalueProvider;
  final ISubcategoryProvider subcategoryProvider;
  final ICategoryProvider categoryProvider;

  BudgetRepository({
    required this.subcategoryProvider,
    required this.categoryProvider,
    required this.budgetvalueProvider,
  });

  Stream<Either<ValueFailure<dynamic>, List<Subcategory>>> get _subcategories =>
      subcategoryProvider.watchAllSubcategories();

  Stream<Either<ValueFailure<dynamic>, List<Category>>> get _categories =>
      categoryProvider.watchAllCategories();

  Stream<Either<ValueFailure<dynamic>, List<BudgetValue>>> _budgetvalues(int year, int month) =>
      budgetvalueProvider.watchAllBudgetValues(year: year, month: month);

  Future<Either<ValueFailure<dynamic>, Unit>> updateBudgetValue(BudgetValue value) async {
    Amount lastMonthAvailable = value.available;

    final failureOrPrevious =
        (await budgetvalueProvider.getById(id: value.id)).getOrElse(() => throw Exception());

    final updated =
        value.copyWith(available: value.available + (value.budgeted - failureOrPrevious.budgeted));
    budgetvalueProvider.update(updated);

    final DateTime maxBudgetDate = getMaxBudgetDate();
    DateTime date = Jiffy(value.date).add(months: 1).dateTime;
    final Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues =
        await budgetvalueProvider.getBudgetValuesBySubcategory(subcategoryId: value.subcategoryId);

    if (failureOrBudgetvalues.isLeft()) {
      return left(failureOrBudgetvalues as ValueFailure);
    }

    List<BudgetValue> budgetvalues = failureOrBudgetvalues.getOrElse(() => []);

    while (date.isBefore(maxBudgetDate)) {
      final stored = budgetvalues.singleWhere(
          (element) => element.date == date && element.subcategoryId == value.subcategoryId);

      // Combine the total available money from month to month
      lastMonthAvailable = stored.available;
      final to_update = stored.copyWith(available: lastMonthAvailable + value.budgeted);

      final result = await budgetvalueProvider.update(to_update);

      if (result.isLeft()) {
        return left(result as ValueFailure);
      }

      date = Jiffy(date).add(months: 1).dateTime;
    }

    return right(unit);
  }

  Stream<Either<ValueFailure<dynamic>, Budget>> getBudgetByDate(int year, int month) =>
      Rx.combineLatest3(
        subcategoryProvider.watchAllSubcategories(),
        categoryProvider.watchAllCategories(),
        budgetvalueProvider.watchAllBudgetValues(year: year, month: month),
        (
          Either<ValueFailure<dynamic>, List<Subcategory>> subcategories,
          Either<ValueFailure<dynamic>, List<Category>> categories,
          Either<ValueFailure<dynamic>, List<BudgetValue>> budgetvalues,
        ) =>
            Either.map3(
          budgetvalues,
          subcategories,
          categories,
          (List<BudgetValue> budgetvalues, List<Subcategory> subcategories,
              List<Category> categories) {
            List<BudgetEntryGroups> groups = [];

            for (final Category category in categories) {
              final List<BudgetEntry> entries = [];
              final matchingSubcats =
                  subcategories.where((subcat) => subcat.categoryID == category.id);

              for (final subcat in matchingSubcats) {
                final budgetvalue =
                    budgetvalues.singleWhere((value) => subcat.id == value.subcategoryId);
                entries.add(BudgetEntry(subcategory: subcat, budgetValue: budgetvalue));
              }

              groups.add(BudgetEntryGroups(
                category: category,
                entries: entries,
              ));
            }

            return Budget(date: DateTime(year, month), toBeBudgeted: Amount("0"), groups: groups);
          },
        ),
      );

  Either<ValueFailure<dynamic>, List<T>> _getValueFromStream<T>(
      Stream<Either<ValueFailure<dynamic>, List<T>>> stream) {
    Option<Either<ValueFailure<dynamic>, List<T>>> subscription = stream.listen(
      (data) => some(data),
      onError: (_) => none(),
    ) as Option<Either<ValueFailure<dynamic>, List<T>>>;

    return subscription.fold(
      () => left(ValueFailure.unexpected(message: "Could not listen to stream of $T.")),
      (a) => a,
    );
  }
}
