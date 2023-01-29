part of 'account_watcher_bloc.dart';

@freezed
class AccountWatcherEvent with _$AccountWatcherEvent {
  const factory AccountWatcherEvent.watchAccountsStarted() = _AccountWatchStarted;
  const factory AccountWatcherEvent.deleteAccount(Account account) = _DeleteAccount;
}
