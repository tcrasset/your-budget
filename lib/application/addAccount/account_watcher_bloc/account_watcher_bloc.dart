// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'account_watcher_event.dart';
part 'account_watcher_state.dart';
part 'account_watcher_bloc.freezed.dart';

class AccountWatcherBloc extends Bloc<AccountWatcherEvent, AccountWatcherState> {
  final IAccountRepository accountRepository;
  StreamSubscription<List<Account>>? _accountStreamSubscription;

  AccountWatcherBloc({required this.accountRepository})
      : super(const AccountWatcherState.initial()) {
    on<_AccountWatchStarted>(_onWatchAccountsStarted);
    on<_AccountsReceived>(_onAccountsReceived);
  }

  _onWatchAccountsStarted(_AccountWatchStarted event, Emitter<AccountWatcherState> emit) async {
    emit(const AccountWatcherState.loading());
    await _accountStreamSubscription?.cancel();

    accountRepository.watchAllAccounts().listen(
          (failureOrAccounts) => add(AccountWatcherEvent.accountsReceived(failureOrAccounts)),
        );
  }

  _onAccountsReceived(_AccountsReceived event, Emitter<AccountWatcherState> emit) async {
    event.failureOrAccounts.fold(
      (f) => emit(AccountWatcherState.loadFailure(f)),
      (accounts) => emit(AccountWatcherState.loadSuccess(accounts)),
    );
  }
}
