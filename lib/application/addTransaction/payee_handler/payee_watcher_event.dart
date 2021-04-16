part of 'payee_watcher_bloc.dart';

@freezed
abstract class PayeeWatcherEvent with _$PayeeWatcherEvent {
  const factory PayeeWatcherEvent.watchPayeesStarted() = _PayeeWatchStarted;
  const factory PayeeWatcherEvent.payeesReceived(
      Either<ValueFailure, List<Payee>> failureOrPayees) = _PayeesReceived;
}
