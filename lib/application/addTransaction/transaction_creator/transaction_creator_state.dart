part of 'transaction_creator_bloc.dart';

@freezed
class TransactionCreatorState with _$TransactionCreatorState {
  const factory TransactionCreatorState({
    required MoneyTransaction moneyTransaction,
    required bool showErrorMessages,
    required bool isSaving,
    required bool isEditing,
    required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption,
  }) = _TransactionCreatorState;

  factory TransactionCreatorState.initial() => TransactionCreatorState(
        moneyTransaction: MoneyTransaction.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        saveFailureOrSuccessOption: none(),
      );
}
