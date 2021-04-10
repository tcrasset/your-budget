part of 'transaction_watcher_bloc.dart';

@freezed
abstract class TransactionWatcherState with _$TransactionWatcherState {
  const factory TransactionWatcherState.initial() = _Initial;
  const factory TransactionWatcherState.loading() = _Loading;
  const factory TransactionWatcherState.loadSuccess(
      List<MoneyTransaction> transactions) = _TransactionLoadSuccess;
  const factory TransactionWatcherState.loadFailure(ValueFailure plantFailure) =
      _TransactionLoadFailure;
}
