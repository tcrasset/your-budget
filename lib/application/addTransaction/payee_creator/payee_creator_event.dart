part of 'payee_creator_bloc.dart';

@freezed
class PayeeCreatorEvent with _$PayeeCreatorEvent {
  const factory PayeeCreatorEvent.initialized(Option<Name> initialNameOption) =
      _Initialized;

  const factory PayeeCreatorEvent.nameChanged(String name) = _NameChanged;
  const factory PayeeCreatorEvent.saved() = _Saved;
}
