// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/account_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'account_watcher_event.dart';
part 'account_watcher_state.dart';
part 'account_watcher_bloc.freezed.dart';

class AccountWatcherBloc extends Bloc<AccountWatcherEvent, AccountWatcherState> {
  final AccountRepository accountRepository;
  AccountWatcherBloc({required this.accountRepository})
      : super(const AccountWatcherState.initial()) {
    on<_AccountWatchStarted>(_onWatchAccountsStarted);
    on<_DeleteAccount>(_onDeleteAccount);
  }

  Future<void> _onDeleteAccount(
    _DeleteAccount event,
    Emitter<AccountWatcherState> emit,
  ) async {
    emit(const AccountWatcherState.loading());
    await accountRepository.deleteAccount(event.account);
  }

  Future<void> _onWatchAccountsStarted(
    _AccountWatchStarted event,
    Emitter<AccountWatcherState> emit,
  ) async {
    emit(const AccountWatcherState.loading());

    await emit.forEach<Either<ValueFailure<dynamic>, List<Account>>>(
      accountRepository.getAccounts(),
      onData: (failureOrAccounts) => failureOrAccounts.fold(
        (l) => AccountWatcherState.loadFailure(l),
        (accounts) => AccountWatcherState.loadSuccess(accounts),
      ),
    );
  }
}
