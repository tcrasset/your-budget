part of 'account_watcher_bloc.dart';

@freezed
abstract class AccountWatcherEvent with _$AccountWatcherEvent {
  const factory AccountWatcherEvent.watchAccountsStarted() = _AccountWatchStarted;
  const factory AccountWatcherEvent.accountsReceived(
      Either<ValueFailure, List<Account>> failureOrAccounts) = _AccountsReceived;
}
