import 'package:get_it/get_it.dart';
import 'package:jiffy/jiffy.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';

Future<void> addBudgetsUntilMaxDate() async {
  final IConstantsProvider constantProvider = GetIt.instance<IConstantsProvider>();
  final IBudgetValueProvider budgetValueRepository = GetIt.instance<IBudgetValueProvider>();
  final ISubcategoryProvider subcategoryRepository = GetIt.instance<ISubcategoryProvider>();
  final storedMaxBudgetDate = (await constantProvider.getMaxBudgetDate())
      .getOrElse(() => throw Exception("Could not get stored max budget date;"));

  final List<Subcategory> subcategories = (await subcategoryRepository.getAllSubcategories())
      .getOrElse(() => throw Exception("Could not get subcategories from database."));
  var currentMaxBudgetDate = getMaxBudgetDate();

  currentMaxBudgetDate = Jiffy(getDateFromMonthStart(DateTime.now()))
      .add(months: Constants.MAX_NB_MONTHS_AHEAD)
      .dateTime;
  late DateTime newDate = currentMaxBudgetDate;

  if (currentMaxBudgetDate.isAtSameMomentAs(storedMaxBudgetDate)) {
    return;
  }

  do {
    newDate = Jiffy(newDate).add(months: 1).dateTime;

    // Add all BudgetValue for the new month to the database
    for (final Subcategory subcat in subcategories) {
      final BudgetValue budgetvalue = BudgetValue(
        available:
            Amount.fromDouble(0), // TODO: Add budget value available value from previous month
        budgeted: Amount.fromDouble(0),

        date: getDateFromMonthStart(DateTime.now()),
        id: UniqueId(),
        subcategoryId: subcat.id,
      );

      budgetValueRepository.create(budgetvalue);

      await budgetValueRepository.create(budgetvalue);
    }
  } while (newDate.isBefore(currentMaxBudgetDate));

  await constantProvider.setMaxBudgetDate(currentMaxBudgetDate);
}
