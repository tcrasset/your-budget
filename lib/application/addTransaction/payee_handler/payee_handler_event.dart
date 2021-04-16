part of 'payee_handler_bloc.dart';

@freezed
abstract class PayeeHandlerEvent with _$PayeeHandlerEvent {
  const factory PayeeHandlerEvent.watchPayeesStarted() = _PayeeWatchStarted;
  const factory PayeeHandlerEvent.payeesReceived(
      Either<ValueFailure, List<Payee>> failureOrPayees) = _PayeesReceived;
}
