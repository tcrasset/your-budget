import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/application/budget/budgetvalue_watcher_bloc/budgetvalue_watcher_bloc.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/domain/transaction/transaction_repository.dart';

part 'transaction_selector_event.dart';
part 'transaction_selector_state.dart';
part 'transaction_selector_bloc.freezed.dart';

class TransactionSelectorBloc extends Bloc<TransactionSelectorEvent, TransactionSelectorState> {
  final TransactionRepository transactionRepository;
  final IBudgetValueProvider budgetValueRepository;
  final BudgetValueWatcherBloc budgetValueWatcherBloc;
  final BudgetDateCubit budgetDateCubit;
  Set<MoneyTransaction> selected = {};
  TransactionSelectorBloc({
    required this.transactionRepository,
    required this.budgetValueRepository,
    required this.budgetValueWatcherBloc,
    required this.budgetDateCubit,
  }) : super(TransactionSelectorState.initial()) {
    on<_ToggleSelected>(_onToggleSelected);
    on<_ToggleModifying>(_onToggleModifying);
    on<_DeleteSelected>(_onDeleteSelectedTransactions);
  }

  void _onToggleModifying(
    _ToggleModifying event,
    Emitter<TransactionSelectorState> emit,
  ) {
    emit(
      state.copyWith(
        isModifying: !state.isModifying,
        selectedTransactions: UnmodifiableSetView({}),
      ),
    );
  }

  void _onToggleSelected(
    _ToggleSelected event,
    Emitter<TransactionSelectorState> emit,
  ) {
    // We have to create a new Set to prevent the one in the state from being modified by reference.
    final previousSelected = Set.from(selected);

    if (selected.contains(event.transaction)) {
      previousSelected.remove(event.transaction);
    } else {
      previousSelected.add(event.transaction);
    }

    final newState = state.copyWith(selectedTransactions: UnmodifiableSetView(previousSelected));

    // After the newState is created, we can make the switch back
    selected = Set.from(previousSelected);
    emit(newState);
  }

  Future<void> _onDeleteSelectedTransactions(
    _DeleteSelected event,
    Emitter<TransactionSelectorState> emit,
  ) async {
    if (selected.isEmpty) {
      emit(state.copyWith(isModifying: false, status: TransactionDeletionStatus.success));
      return;
    }

    emit(state.copyWith(status: TransactionDeletionStatus.deleting));
    Option<ValueFailure> failureDuringLoop = none();
    for (final transaction in selected) {
      final failureOrUnit = await transactionRepository.deleteTransaction(transaction);

      if (failureOrUnit.isLeft()) {
        failureDuringLoop = some((failureOrUnit as Left).value as ValueFailure);
        break;
      }
    }

    if (failureDuringLoop.isSome()) {
      final newState = state.copyWith(
        selectedTransactions: UnmodifiableSetView({}),
        status: TransactionDeletionStatus.failure,
        error: failureDuringLoop.toNullable(),
        isModifying: false, // remove selectionability as something went wrong
      );
      emit(newState);
    } else {
      // We have to create a new Set to prevent the one in the state from being modified by reference.
      final newState = state.copyWith(
        selectedTransactions: UnmodifiableSetView({}),
        isModifying: true, // keep the Transactions selectable so that we can delete more
        deletedTransactions: UnmodifiableSetView(Set.from(selected)),
        status: TransactionDeletionStatus.success,
      );

      emit(newState);
    }
    // Reset the state and clear the selection either way
    selected.clear();
  }
}
