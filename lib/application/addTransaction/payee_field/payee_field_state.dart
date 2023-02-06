part of 'payee_field_bloc.dart';

@freezed
class PayeeFieldState with _$PayeeFieldState {
  const factory PayeeFieldState.initial() = _Initial;
  const factory PayeeFieldState.loading() = _Loading;
  const factory PayeeFieldState.loadSuccess(PayableEntries entries) = _LoadSuccess;
  const factory PayeeFieldState.loadFailure(ValueFailure error) = _LoadFailure;
}
