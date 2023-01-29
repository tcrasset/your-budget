part of 'transaction_watcher_bloc.dart';

@freezed
class TransactionWatcherEvent with _$TransactionWatcherEvent {
  const factory TransactionWatcherEvent.watchTransactionsStarted({required Account? account}) =
      _TransactionWatchStarted;
}
