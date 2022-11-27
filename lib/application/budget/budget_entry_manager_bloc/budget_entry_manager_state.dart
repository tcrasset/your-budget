part of 'budget_entry_manager_bloc.dart';

@freezed
class BudgetEntryManagerState with _$BudgetEntryManagerState {
  const factory BudgetEntryManagerState({/*required*/ required bool wasModified}) =
      _BudgetEntryManagerState;

  factory BudgetEntryManagerState._initial() => const BudgetEntryManagerState(
        wasModified: false,
      );
}
