import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';

part 'transaction_selector_event.dart';
part 'transaction_selector_state.dart';
part 'transaction_selector_bloc.freezed.dart';

class TransactionSelectorBloc extends Bloc<TransactionSelectorEvent, TransactionSelectorState> {
  Set<String> selectedTransactions = {};
  final ITransactionRepository transactionRepository;

  TransactionSelectorBloc({required this.transactionRepository})
      : super(const TransactionSelectorState.notModifying()) {
    on<_Selected>(_onTransactionSelected);
    on<_Unselected>(_onTransactionUnselected);
    on<_DeleteSelected>(_onDeleteSelectedTransactions);
    on<_ToggleModifying>(_onToggleModifying);
  }

  void _onToggleModifying(
    _ToggleModifying event,
    Emitter<TransactionSelectorState> emit,
  ) {
    final newState = state.maybeMap(
        modifying: (_) => const NotModifying(),
        notModifying: (_) => const Modifying(),
        orElse: () => null);

    if (newState != null) emit(newState);
  }

  void _onDeleteSelectedTransactions(
    _DeleteSelected event,
    Emitter<TransactionSelectorState> emit,
  ) {
    emit(const TransactionSelectorState.loading());

    int previousLength = selectedTransactions.length;

    if (previousLength == 0) {
      emit(const TransactionSelectorState.notModifying());
      return;
    }
    selectedTransactions.forEach((id) => transactionRepository.delete(id));
    selectedTransactions.clear();
    emit(const TransactionSelectorState.deleted());
    emit(const TransactionSelectorState.notModifying());
  }

  void _onTransactionSelected(
    _Selected event,
    Emitter<TransactionSelectorState> emit,
  ) {
    selectedTransactions.add(event.id);
  }

  void _onTransactionUnselected(
    _Unselected event,
    Emitter<TransactionSelectorState> emit,
  ) {
    selectedTransactions.remove(event.id);
  }
}
