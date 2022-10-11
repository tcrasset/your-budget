part of 'account_watcher_bloc.dart';

@freezed
class AccountWatcherState with _$AccountWatcherState {
  const factory AccountWatcherState.initial() = _Initial;

  const factory AccountWatcherState.loading() = _Loading;
  const factory AccountWatcherState.loadSuccess(List<Account> accounts) = _AccountLoadSuccess;
  const factory AccountWatcherState.loadFailure(ValueFailure accountFailure) = _AccountLoadFailure;
}
