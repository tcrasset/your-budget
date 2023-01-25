part of 'transaction_watcher_bloc.dart';

@freezed
class TransactionWatcherEvent with _$TransactionWatcherEvent {
  const factory TransactionWatcherEvent.watchTransactionsStarted() = _TransactionWatchStarted;

  const factory TransactionWatcherEvent.cycleAccount({required bool increment}) = _CycleAccount;
}
