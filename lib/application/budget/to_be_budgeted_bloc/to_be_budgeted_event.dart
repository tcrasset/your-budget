part of 'to_be_budgeted_bloc.dart';

@freezed
class ToBeBudgetedEvent with _$ToBeBudgetedEvent {
  const factory ToBeBudgetedEvent.watchToBeBudgetedRequested() = WatchToBeBudgetedRequested;
}
