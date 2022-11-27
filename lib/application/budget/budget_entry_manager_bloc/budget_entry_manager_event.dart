part of 'budget_entry_manager_bloc.dart';

@freezed
class BudgetEntryManagerEvent with _$BudgetEntryManagerEvent {
  const factory BudgetEntryManagerEvent.initialized() = _Initialized;

  const factory BudgetEntryManagerEvent.add(Subcategory subcat) = _SubcategoryAdded;
  const factory BudgetEntryManagerEvent.nameChanged(UniqueId id, String name) = _NameChanged;
  const factory BudgetEntryManagerEvent.budgetedChanged(UniqueId id, String budgeted) =
      _BudgetedChanged;
  const factory BudgetEntryManagerEvent.availableChanged(UniqueId id, String available) =
      _AvailableChanged;
}
