import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/budget/budget.dart';
import 'package:your_budget/domain/budget/budget_repository.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'budget_bloc.freezed.dart';
part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final BudgetRepository budgetRepository;

  BudgetBloc({required this.budgetRepository}) : super(const BudgetState()) {
    on<NewBudgetRequested>(
      _onNewBudgetRequested,
      transformer: restartable(),
    );

    on<BudgetValueModified>(
      _onBudgetValueModified,
      // https://verygood.ventures/blog/how-to-use-bloc-with-streams-and-concurrency
      transformer: sequential(),
    );
  }

  FutureOr<void> _onBudgetValueModified(
      BudgetValueModified event, Emitter<BudgetState> emit) async {
    emit(state.copyWith(budget: null, status: BudgetOverviewStatus.loading));
    final failureOrUnit = await budgetRepository.updateBudgetValue(event.budgetvalue);

    failureOrUnit.fold(
        (l) => emit(state.copyWith(status: BudgetOverviewStatus.failure, error: l)), (_) => null);
  }

  Future<void> _onNewBudgetRequested(NewBudgetRequested event, Emitter<BudgetState> emit) async {
    emit(state.copyWith(budget: null, status: BudgetOverviewStatus.loading));
    await emit.forEach<Either<ValueFailure<dynamic>, Budget>>(
      budgetRepository.getBudgetByDate(event.date.year, event.date.month),
      onData: (failureOrBudget) => failureOrBudget.fold(
        (l) => state.copyWith(error: l, status: BudgetOverviewStatus.failure),
        (r) => state.copyWith(status: BudgetOverviewStatus.success, budget: r),
      ),
    );
  }
}
