// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/application/showTransactions/transaction_selector_bloc/transaction_selector_bloc.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/domain/transaction/transaction_repository.dart';

part 'transaction_watcher_bloc.freezed.dart';
part 'transaction_watcher_event.dart';
part 'transaction_watcher_state.dart';

class TransactionWatcherBloc extends Bloc<TransactionWatcherEvent, TransactionWatcherState> {
  final TransactionRepository transactionRepository;
  final IAccountProvider accountRepository;
  int currentIndex = 0;

  Set<String> selectedTransactions = {};
  TransactionWatcherBloc({
    required this.transactionRepository,
    required this.accountRepository,
  }) : super(const TransactionWatcherState.initial()) {
    on<_TransactionWatchStarted>(_onTransactionWatchStarted);
  }

  Future<void> _onTransactionWatchStarted(
    _TransactionWatchStarted event,
    Emitter<TransactionWatcherState> emit,
  ) async {
    emit(const TransactionWatcherState.loading());

    print('event.account is ${event.account}');

    if (event.account == null) {
      emit(const TransactionWatcherState.loadSuccess([], null));
      return;
    }

    Account account = event.account!;
    transactionRepository.getTransactionsByAccount(account.id);

    await emit.forEach<Either<ValueFailure<dynamic>, List<MoneyTransaction>>>(
      transactionRepository.getTransactionsByAccount(account.id),
      onData: (failureOrTransactions) => failureOrTransactions.fold(
        (l) => TransactionWatcherState.loadFailure(l),
        (r) => TransactionWatcherState.loadSuccess(r, account),
      ),
    );
  }
}
