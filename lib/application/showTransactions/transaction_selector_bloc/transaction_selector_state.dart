part of 'transaction_selector_bloc.dart';

@freezed
class TransactionSelectorState with _$TransactionSelectorState {
  const factory TransactionSelectorState({
    required UnmodifiableSetView selectedTransactions,
    required UnmodifiableSetView deletedTransactions,
    required bool isModifying,
    required bool isDeleting,
  }) = _TransactionSelectorState;

  factory TransactionSelectorState.initial() => TransactionSelectorState(
        selectedTransactions: UnmodifiableSetView({}),
        deletedTransactions: UnmodifiableSetView({}),
        isModifying: false,
        isDeleting: false,
      );
}
