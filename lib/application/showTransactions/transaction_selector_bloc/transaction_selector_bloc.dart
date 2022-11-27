import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';

part 'transaction_selector_event.dart';
part 'transaction_selector_state.dart';
part 'transaction_selector_bloc.freezed.dart';

class TransactionSelectorBloc extends Bloc<TransactionSelectorEvent, TransactionSelectorState> {
  final ITransactionRepository transactionRepository;
  Set<String> selected = {};
  TransactionSelectorBloc({required this.transactionRepository})
      : super(TransactionSelectorState.initial()) {
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

    if (selected.contains(event.id)) {
      previousSelected.remove(event.id);
    } else {
      previousSelected.add(event.id);
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

    await Future.forEach(selected, (String id) async => transactionRepository.delete(id));

    // We have to create a new Set to prevent the one in the state from being modified by reference.
    final newState = state.copyWith(
        selectedTransactions: UnmodifiableSetView({}),
        deletedTransactions: UnmodifiableSetView(Set.from(selected)));
    // The TransactionWatcherBloc is listening to this state and checks deletedTransactions
    emit(newState);

    emit(TransactionSelectorState.initial());
    selected.clear();
  }
}
