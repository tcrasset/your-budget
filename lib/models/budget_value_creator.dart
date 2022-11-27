// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/creator.dart';
import 'package:your_budget/models/queries.dart';

class BudgetValueCreator implements Creator<BudgetValueLegacy> {
  final Queries? queryContext;
  final int? subcategoryId;
  final double budgeted;
  final double available;
  final int? month;
  final int? year;

  BudgetValueCreator({
    required this.queryContext,
    required this.subcategoryId,
    required this.budgeted,
    required this.available,
    required this.month,
    required this.year,
  });

  @override
  Future<BudgetValueLegacy> create() async {
    final BudgetValueModel budgetValueModel = BudgetValueModel(
      subcategoryId: subcategoryId,
      budgeted: budgeted,
      available: available,
      month: month,
      year: year,
    );

    final int id = await queryContext!.addBudgetValue(budgetValueModel);
    return BudgetValueLegacy(
      id: id,
      subcategoryId: subcategoryId,
      budgeted: budgeted,
      available: available,
      month: month,
      year: year,
    );
  }
}
