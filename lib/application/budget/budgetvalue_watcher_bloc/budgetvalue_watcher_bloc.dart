import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/application/budget/budget_entry_manager_bloc/budget_entry_manager_bloc.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
import 'package:your_budget/application/core/transaction_watcher_bloc/transaction_watcher_bloc.dart';
import 'package:your_budget/application/showTransactions/transaction_selector_bloc/transaction_selector_bloc.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'budgetvalue_watcher_event.dart';
part 'budgetvalue_watcher_state.dart';
part 'budgetvalue_watcher_bloc.freezed.dart';

class BudgetValueWatcherBloc extends Bloc<BudgetValueWatcherEvent, BudgetValueWatcherState> {
  final IBudgetValueRepository budgetvalueRepository;
  final BudgetDateCubit budgetDateCubit;
  final BudgetEntryManagerBloc budgetManagerBloc;
  StreamSubscription<List<BudgetValue>>? _budgetvalueStreamSubscription;

  BudgetValueWatcherBloc(
      {required this.budgetvalueRepository,
      required this.budgetManagerBloc,
      required this.budgetDateCubit})
      : super(const BudgetValueWatcherState.initial()) {
    budgetDateCubit.stream.listen((budgetDate) {
      if (!isClosed) {
        add(BudgetValueWatcherEvent.watchBudgetValuesStarted(budgetDate));
      }
    });

    final DateTime budgetDate = budgetDateCubit.state;

    budgetManagerBloc.stream.listen((state) {
      if (state.wasModified) {
        add(BudgetValueWatcherEvent.watchBudgetValuesStarted(budgetDate));
      }
    });

    on<_BudgetValueWatchStarted>(_onBudgetValueWatchStarted);
    on<_BudgetValuesReceived>(_onBudgetValuesReceived);
  }

  Future<void> _onBudgetValueWatchStarted(
    _BudgetValueWatchStarted event,
    Emitter<BudgetValueWatcherState> emit,
  ) async {
    emit(const BudgetValueWatcherState.loading());
    await _budgetvalueStreamSubscription?.cancel();

    budgetvalueRepository
        .watchAllBudgetValues(year: event.date.year, month: event.date.month)
        .listen(
          (failureOrBudgetValues) =>
              add(BudgetValueWatcherEvent.budgetvaluesReceived(failureOrBudgetValues)),
        );
  }

  Future<void> _onBudgetValuesReceived(
    _BudgetValuesReceived event,
    Emitter<BudgetValueWatcherState> emit,
  ) async {
    var newState = event.failureOrBudgetvalues.fold(
      (f) => BudgetValueWatcherState.loadFailure(f),
      (budgetvalues) => BudgetValueWatcherState.loadSuccess(budgetvalues),
    );

    emit(newState);
  }
}
