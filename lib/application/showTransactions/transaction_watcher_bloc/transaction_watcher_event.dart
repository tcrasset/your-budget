part of 'transaction_watcher_bloc.dart';

@freezed
abstract class TransactionWatcherEvent with _$TransactionWatcherEvent {
  const factory TransactionWatcherEvent.watchTransactionsStarted() =
      _TransactionWatchStarted;
  const factory TransactionWatcherEvent.transactionsReceived(
      List<MoneyTransaction> transactions) = _TransactionsReceived;
}
