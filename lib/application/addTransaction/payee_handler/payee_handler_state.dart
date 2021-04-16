part of 'payee_handler_bloc.dart';

@freezed
abstract class PayeeHandlerState with _$PayeeHandlerState {
  const factory PayeeHandlerState.initial() = _Initial;

  const factory PayeeHandlerState.loading() = _Loading;
  const factory PayeeHandlerState.loadSuccess(List<Payee> payees) = _PayeeLoadSuccess;
  const factory PayeeHandlerState.loadFailure(ValueFailure payeeFailure) = _PayeeLoadFailure;
}
