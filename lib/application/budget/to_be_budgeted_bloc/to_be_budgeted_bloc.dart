import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/budget/to_be_budgeted_repository.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'to_be_budgeted_event.dart';
part 'to_be_budgeted_state.dart';
part 'to_be_budgeted_bloc.freezed.dart';

class ToBeBudgetedBloc extends Bloc<ToBeBudgetedEvent, ToBeBudgetedState> {
  ToBeBudgetedRepository toBeBudgetedRepository;
  ToBeBudgetedBloc({required this.toBeBudgetedRepository})
      : super(ToBeBudgetedState(amount: Amount.fromDouble(0.00))) {
    on<WatchToBeBudgetedRequested>(_onWatchToBeBudgetedRequested);
  }

  Future<void> _onWatchToBeBudgetedRequested(
      WatchToBeBudgetedRequested event, Emitter<ToBeBudgetedState> emit) async {
    emit(state.copyWith(status: ToBeBudgetedStatus.loading));
    await emit.forEach<Either<ValueFailure, Amount>>(
      toBeBudgetedRepository.getToBeBudgeted(),
      onData: (failureOrAmount) => failureOrAmount.fold(
        (l) => state.copyWith(error: l, status: ToBeBudgetedStatus.failure),
        (amount) => state.copyWith(amount: amount, status: ToBeBudgetedStatus.success),
      ),
    );
  }
}
