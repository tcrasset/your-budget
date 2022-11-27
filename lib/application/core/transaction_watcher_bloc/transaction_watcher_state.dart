part of 'transaction_watcher_bloc.dart';

@freezed
class TransactionWatcherState with _$TransactionWatcherState {
  const factory TransactionWatcherState.initial() = _Initial;
  const factory TransactionWatcherState.loading() = _Loading;
  const factory TransactionWatcherState.loadSuccess(
          List<MoneyTransaction> transactions, Account? currentAccount) =
      _TransactionLoadSuccess;
  const factory TransactionWatcherState.loadFailure(
      ValueFailure transactionFailure) = _TransactionLoadFailure;
}
