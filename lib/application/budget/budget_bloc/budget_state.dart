part of 'budget_bloc.dart';

enum BudgetOverviewStatus { initial, loading, success, failure }

@freezed
class BudgetState with _$BudgetState {
  const factory BudgetState({
    Budget? budget,
    @Default(BudgetOverviewStatus.initial) BudgetOverviewStatus status,
    ValueFailure? error,
  }) = _BudgetState;
}
