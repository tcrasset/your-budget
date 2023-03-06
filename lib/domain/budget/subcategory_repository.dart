import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rxdart/rxdart.dart';
import 'package:your_budget/dartz_x.dart';
import 'package:your_budget/domain/budget/budget.dart';
import 'package:your_budget/domain/budget/budget_entry.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/category/category.dart' as c;
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart' as s;
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/models/utils.dart';

class SubcategoryRepository {
  // Inspired from https://bloclibrary.dev/#/fluttertodostutorial

  final IBudgetValueProvider budgetvalueProvider;
  final ISubcategoryProvider subcategoryProvider;
  final IConstantsProvider constantsProvider;
  SubcategoryRepository({
    required this.subcategoryProvider,
    required this.budgetvalueProvider,
    required this.constantsProvider,
  });

  Future<Either<ValueFailure<dynamic>, Unit>> _createBudgetValues(UniqueId subcategoryId) async {
    return constantsProvider
        .getStartingBudgetDate()
        .flatMap((d) => _createBudgetValuesThunk(d, subcategoryId));
  }

  Future<Either<ValueFailure, Unit>> _createBudgetValuesThunk(
    DateTime startingBudgetDate,
    UniqueId subcategoryId,
  ) async {
    final budgetvalues = getBudgetDatesUpToMaxBudgetDate(startingFrom: startingBudgetDate).map(
      (date) => BudgetValue(
        available: Amount.fromDouble(0),
        budgeted: Amount.fromDouble(0),
        date: date,
        id: UniqueId(),
        subcategoryId: subcategoryId,
      ),
    );

    return budgetvalueProvider.createAll(budgetvalues.toList());
  }

  Future<Either<ValueFailure, Unit>> create(Subcategory subcategory) async {
    return subcategoryProvider.create(subcategory).andThen(_createBudgetValues(subcategory.id));
  }
}
