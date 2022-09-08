// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';
import '../../../domain/account/i_account_repository.dart';
import '../../../domain/core/value_failure.dart';
import '../../../domain/transaction/i_transaction_repository.dart';

part 'transaction_watcher_event.dart';
part 'transaction_watcher_state.dart';
part 'transaction_watcher_bloc.freezed.dart';

class TransactionWatcherBloc extends Bloc<TransactionWatcherEvent, TransactionWatcherState> {
  final ITransactionRepository transactionRepository;
  final IAccountRepository accountRepository;
  StreamSubscription<List<MoneyTransaction>>? _transactionStreamSubscription;
  int currentAccountID = 1; // First ID in database is at 1

  TransactionWatcherBloc({required this.transactionRepository, required this.accountRepository})
      : super(const TransactionWatcherState.initial()) {
    on<_TransactionWatchStarted>(_onTransactionWatchStarted);
    on<_TransactionsReceived>(_onTransactionsReceived);
    on<_CycleAccount>(_onCycleAccount);
  }

  _onTransactionWatchStarted(
      _TransactionWatchStarted event, Emitter<TransactionWatcherState> emit) async {
    emit(const TransactionWatcherState.loading());
    await _transactionStreamSubscription?.cancel();

    transactionRepository.watchAccountTransactions(currentAccountID).listen(
          (failureOrTransactions) =>
              add(TransactionWatcherEvent.transactionsReceived(failureOrTransactions)),
        );
  }

  _onTransactionsReceived(
      _TransactionsReceived event, Emitter<TransactionWatcherState> emit) async {
    if (event != null) {
      var newState = event.failureOrTransactions.fold(
        (f) => TransactionWatcherState.loadFailure(f),
        (transactions) => TransactionWatcherState.loadSuccess(transactions),
      );
      emit(newState);
    }
  }

  _onCycleAccount(_CycleAccount event, Emitter<TransactionWatcherState> emit) async {
    emit(const TransactionWatcherState.loading());
    final failureOrCount = await accountRepository.count();
    failureOrCount.fold(
      (f) => TransactionWatcherState.loadFailure(f),
      (numberOfAccounts) {
        if (numberOfAccounts != 0) {
          currentAccountID =
              (currentAccountID + (event.increment ? 1 : -1) - 1) % numberOfAccounts! +
                  1; // -1 then +1 so that it never goes to 0
          add(const TransactionWatcherEvent.watchTransactionsStarted());
        }
      },
    );
  }
}
