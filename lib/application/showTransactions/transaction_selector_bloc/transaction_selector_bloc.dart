import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/application/budget/budgetvalue_watcher_bloc/budgetvalue_watcher_bloc.dart';
import 'package:your_budget/application/core/budget_date_cubit.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/budgetvalue/i_budgetvalue_provider.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/domain/transaction/transaction.dart';

part 'transaction_selector_event.dart';
part 'transaction_selector_state.dart';
part 'transaction_selector_bloc.freezed.dart';

class TransactionSelectorBloc extends Bloc<TransactionSelectorEvent, TransactionSelectorState> {
  final ITransactionRepository transactionRepository;
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
      emit(state.copyWith(isModifying: false, isDeleting: false));
      return;
    }

    emit(state.copyWith(isDeleting: true));

    await Future.forEach(selected, (MoneyTransaction transaction) async {
      final failureOrBudgetvalue = await budgetValueRepository.get(
          year: transaction.date.year,
          month: transaction.date.month,
          subcategoryId: transaction.subcategory.id);
      BudgetValue oldBudgetvalue =
          failureOrBudgetvalue.getOrElse(() => throw Exception("Error during get budget value"));

      BudgetValue updatedBudgetvalue =
          oldBudgetvalue.copyWith(available: oldBudgetvalue.available - transaction.amount);
      budgetValueRepository.update(updatedBudgetvalue);

      transactionRepository.delete(transaction.id.getOrCrash());
    });

    // We have to create a new Set to prevent the one in the state from being modified by reference.
    final newState = state.copyWith(
        selectedTransactions: UnmodifiableSetView({}),
        deletedTransactions: UnmodifiableSetView(Set.from(selected)));

    budgetValueWatcherBloc
        .add(BudgetValueWatcherEvent.watchBudgetValuesStarted(budgetDateCubit.state));
    // The TransactionWatcherBloc is listening to this state and checks deletedTransactions
    emit(newState);

    emit(TransactionSelectorState.initial());
    selected.clear();
  }
}
