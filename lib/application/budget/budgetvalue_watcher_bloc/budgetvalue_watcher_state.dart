part of 'budgetvalue_watcher_bloc.dart';

@freezed
class BudgetValueWatcherState with _$BudgetValueWatcherState {
  const factory BudgetValueWatcherState.initial() = _Initial;

  const factory BudgetValueWatcherState.loading() = _Loading;
  const factory BudgetValueWatcherState.loadSuccess(List<BudgetValue> budgetvalues) =
      _BudgetValueLoadSuccess;
  const factory BudgetValueWatcherState.loadFailure(ValueFailure budgetvalueFailure) =
      _BudgetValueLoadFailure;
}
