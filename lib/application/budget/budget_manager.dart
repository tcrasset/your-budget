// // Package imports:
// import 'package:meta/meta.dart';
// import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
// import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
// import 'package:your_budget/domain/core/unique_id.dart';
// import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';

// // Project imports:
// import 'package:your_budget/models/categories.dart';
// import 'package:your_budget/models/object_list.dart';
// import 'package:your_budget/models/queries.dart';

// class BudgetManager {
//   final ISubcategoryRepository subcategoryRepository;
//   final IBudgetValueRepository budgetvalueRepository;

//   BudgetManager({required this.subcategoryRepository,
//       required this.budgetvalueRepository,
//       })

//   void updateBudgetEntry({
//     required int? subcatId,
//     required DateTime? date,
//     required double? newBudgeted,
//   }) {
//     final BudgetValue budgetValue = BudgetValue(id: id, subcategoryId: subcategoryId, budgeted: budgeted, available: available, date: date)!;

//     budgetvalueRepository.update(budgetvalue)

//   }

// }