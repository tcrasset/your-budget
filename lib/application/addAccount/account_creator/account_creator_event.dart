part of 'account_creator_bloc.dart';

@freezed
abstract class AccountCreatorEvent with _$AccountCreatorEvent {
  const factory AccountCreatorEvent.initialized() = _Initialized;

  const factory AccountCreatorEvent.nameChanged(String name) = _NameChanged;
  const factory AccountCreatorEvent.balanceChanged(String balance) = _BalanceChanged;
  const factory AccountCreatorEvent.saved() = _Saved;
}
