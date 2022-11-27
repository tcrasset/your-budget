part of 'payee_watcher_bloc.dart';

@freezed
class PayeeWatcherState with _$PayeeWatcherState {
  const factory PayeeWatcherState.initial() = _Initial;
  const factory PayeeWatcherState.loading() = _Loading;
  const factory PayeeWatcherState.loadSuccess(List<Payee> payees) =
      _PayeeLoadSuccess;
  const factory PayeeWatcherState.loadFailure(ValueFailure payeeFailure) =
      _PayeeLoadFailure;
}
