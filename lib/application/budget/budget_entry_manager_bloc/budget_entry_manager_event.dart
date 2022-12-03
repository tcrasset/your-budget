part of 'budget_entry_manager_bloc.dart';

@freezed
class BudgetEntryManagerEvent with _$BudgetEntryManagerEvent {
  const factory BudgetEntryManagerEvent.initialized() = _Initialized;

  const factory BudgetEntryManagerEvent.budgetedChanged(
      BudgetEntry entry, String newBudgetedValue) = _BudgetedChanged;
}
