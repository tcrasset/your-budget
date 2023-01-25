part of 'transaction_selector_bloc.dart';

enum TransactionDeletionStatus { initial, deleting, success, failure }

@freezed
class TransactionSelectorState with _$TransactionSelectorState {
  const factory TransactionSelectorState({
    required UnmodifiableSetView selectedTransactions,
    required UnmodifiableSetView deletedTransactions,
    required bool isModifying,
    required TransactionDeletionStatus status,
    ValueFailure? error,
  }) = _TransactionSelectorState;

  factory TransactionSelectorState.initial() => TransactionSelectorState(
        selectedTransactions: UnmodifiableSetView({}),
        deletedTransactions: UnmodifiableSetView({}),
        isModifying: false,
        status: TransactionDeletionStatus.initial,
      );
}
