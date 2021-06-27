part of 'account_creator_bloc.dart';

@freezed
class AccountCreatorState with _$AccountCreatorState {
  const factory AccountCreatorState({
    /*required*/ required Account account,
    /*required*/ required bool showErrorMessages,
    /*required*/ required bool isSaving,
    /*required*/ required bool isEditing,
    /*required*/ required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption,
  }) = _AccountCreatorState;

  factory AccountCreatorState.initial() => AccountCreatorState(
        account: Account.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        saveFailureOrSuccessOption: none(),
      );
}
