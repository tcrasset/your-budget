part of 'to_be_budgeted_bloc.dart';

enum ToBeBudgetedStatus { initial, loading, success, failure }

@freezed
class ToBeBudgetedState with _$ToBeBudgetedState {
  const factory ToBeBudgetedState({
    required Amount amount,
    @Default(ToBeBudgetedStatus.initial) ToBeBudgetedStatus status,
    ValueFailure? error,
  }) = _ToBeBudgetedState;
}
