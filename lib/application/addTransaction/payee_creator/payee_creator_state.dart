part of 'payee_creator_bloc.dart';

@freezed
abstract class PayeeCreatorState with _$PayeeCreatorState {
  const factory PayeeCreatorState({
    @required Payee payee,
    @required bool showErrorMessages,
    @required bool isSaving,
    @required bool isEditing,
    @required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption,
  }) = _PayeeCreatorState;

  factory PayeeCreatorState.initial() => PayeeCreatorState(
        payee: Payee.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        saveFailureOrSuccessOption: none(),
      );
}
