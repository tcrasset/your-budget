part of 'budgetvalue_watcher_bloc.dart';

@freezed
class BudgetValueWatcherEvent with _$BudgetValueWatcherEvent {
  const factory BudgetValueWatcherEvent.watchBudgetValuesStarted(DateTime date) =
      _BudgetValueWatchStarted;
  const factory BudgetValueWatcherEvent.budgetvaluesReceived(
    Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues,
  ) = _BudgetValuesReceived;
}
