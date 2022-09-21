part of 'transaction_watcher_bloc.dart';

@freezed
class TransactionWatcherEvent with _$TransactionWatcherEvent {
  const factory TransactionWatcherEvent.watchTransactionsStarted() = _TransactionWatchStarted;
  const factory TransactionWatcherEvent.transactionsReceived(
    Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions,
  ) = _TransactionsReceived;

  const factory TransactionWatcherEvent.cycleAccount({required bool increment}) = _CycleAccount;
  const factory TransactionWatcherEvent.selectTransaction({required String id}) =
      _TransactionSelected;
  const factory TransactionWatcherEvent.deleteSelectedTransactions() = _DeleteSelectedTransactions;
}
