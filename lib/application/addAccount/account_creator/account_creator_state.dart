part of 'account_creator_bloc.dart';

@freezed
abstract class AccountCreatorState with _$AccountCreatorState {
  const factory AccountCreatorState({
    @required NewAccount account,
    @required bool showErrorMessages,
    @required bool isSaving,
    @required bool isEditing,
    @required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption,
  }) = _AccountCreatorState;

  factory AccountCreatorState.initial() => AccountCreatorState(
        account: NewAccount.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        saveFailureOrSuccessOption: none(),
      );
}
