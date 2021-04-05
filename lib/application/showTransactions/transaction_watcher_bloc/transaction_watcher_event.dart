part of 'transaction_watcher_bloc.dart';

@freezed
abstract class TransactionWatcherEvent with _$TransactionWatcherEvent {
  const factory TransactionWatcherEvent.watchTransactionsStarted() =
      _TransactionWatchStarted;
  const factory TransactionWatcherEvent.transactionsReceived(
          Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions) =
      _TransactionsReceived;
}
