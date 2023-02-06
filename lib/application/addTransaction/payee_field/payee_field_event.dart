part of 'payee_field_bloc.dart';

@freezed
class PayeeFieldEvent with _$PayeeFieldEvent {
  const factory PayeeFieldEvent.initialized() = _Initialized;
  const factory PayeeFieldEvent.watchPayableRequested() = _WatchPayableRequested;
}
