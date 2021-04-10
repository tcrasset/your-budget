// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/models/account.dart';

part 'account_watcher_event.dart';
part 'account_watcher_state.dart';
part 'account_watcher_bloc.freezed.dart';

class AccountWatcherBloc extends Bloc<AccountWatcherEvent, AccountWatcherState> {
  final IAccountRepository accountRepository;

  AccountWatcherBloc({@required this.accountRepository})
      : super(const AccountWatcherState.initial());

  StreamSubscription<List<Account>> _accountStreamSubscription;

  @override
  Stream<AccountWatcherState> mapEventToState(
    AccountWatcherEvent event,
  ) async* {
    yield* event.map(watchAccountsStarted: (e) async* {
      yield const AccountWatcherState.loading();
      await _accountStreamSubscription?.cancel();

      accountRepository.watchAllAccounts().listen(
            (failureOrAccounts) => add(AccountWatcherEvent.accountsReceived(failureOrAccounts)),
          );
    }, accountsReceived: (e) async* {
      yield e.failureOrAccounts.fold(
        (f) => AccountWatcherState.loadFailure(f),
        (accounts) => AccountWatcherState.loadSuccess(accounts),
      );
    });
  }
}
