part of 'budget_bloc.dart';

@freezed
class BudgetEvent with _$BudgetEvent {
  const factory BudgetEvent.newBudgetRequested(DateTime date) = NewBudgetRequested;
  const factory BudgetEvent.budgetValueModified(BudgetValue budgetvalue) = BudgetValueModified;
}
