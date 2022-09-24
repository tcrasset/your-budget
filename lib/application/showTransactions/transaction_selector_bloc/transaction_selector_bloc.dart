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

  FutureOr<void> _onToggleModifying(event, emit) {
    emit(
      state.copyWith(
        isModifying: !state.isModifying,
        selectedTransactions: UnmodifiableSetView({}),
      ),
    );
  }

  FutureOr<void> _onToggleSelected(
    _ToggleSelected event,
    Emitter<TransactionSelectorState> emit,
  ) {
    if (selected.contains(event.id)) {
      selected.remove(event.id);
    } else {
      selected.add(event.id);
    }
    final newState = state.copyWith(selectedTransactions: UnmodifiableSetView(selected));
    print(newState);
    emit(newState);
  }

  void _onDeleteSelectedTransactions(
    _DeleteSelected event,
    Emitter<TransactionSelectorState> emit,
  ) {
    if (selected.isEmpty) {
      emit(state.copyWith(isModifying: false, isDeleting: false));
      return;
    }

    emit(state.copyWith(isDeleting: true));
    selected.forEach((id) => transactionRepository.delete(id));

    emit(state.copyWith(
        selectedTransactions: UnmodifiableSetView({}),
        deletedTransactions: UnmodifiableSetView(selected)));
    emit(TransactionSelectorState.initial());
  }
}
