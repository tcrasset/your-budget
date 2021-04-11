part of 'account_creator_bloc.dart';

@freezed
abstract class AccountCreatorState with _$AccountCreatorState {
  const factory AccountCreatorState({
    @required Account account,
    @required bool showErrorMessages,
    @required bool isSaving,
    @required bool isEditing,
    @required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption,
  }) = _AccountCreatorState;

  factory AccountCreatorState.initial() => AccountCreatorState(
        account: Account.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        saveFailureOrSuccessOption: none(),
      );
}
