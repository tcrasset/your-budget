part of 'budget_bloc.dart';

@freezed
class BudgetEvent with _$BudgetEvent {
  const factory BudgetEvent.NewBudgetRequested(DateTime date) = NewBudgetRequested;
  const factory BudgetEvent.BudgetValueModified(BudgetValue budgetvalue) = BudgetValueModified;
}
