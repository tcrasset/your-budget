// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/application/showTransactions/transaction_selector_bloc/transaction_selector_bloc.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
// Project imports:
import 'package:your_budget/domain/transaction/transaction.dart';

part 'transaction_watcher_bloc.freezed.dart';
part 'transaction_watcher_event.dart';
part 'transaction_watcher_state.dart';

class TransactionWatcherBloc extends Bloc<TransactionWatcherEvent, TransactionWatcherState> {
  final ITransactionRepository transactionRepository;
  final IAccountRepository accountRepository;
  final TransactionSelectorBloc transactionSelectorBloc;
  StreamSubscription<List<MoneyTransaction>>? _transactionStreamSubscription;
  int currentIndex = 0;

  Set<String> selectedTransactions = {};
  TransactionWatcherBloc({
    required this.transactionRepository,
    required this.accountRepository,
    required this.transactionSelectorBloc,
  }) : super(const TransactionWatcherState.initial()) {
    // Listening to TransactionSelectorBloc for deletion state to fetch
    // the new transactions from the database.
    transactionSelectorBloc.stream.listen(
      (state) {
        if (state.deletedTransactions.isNotEmpty) {
          add(const TransactionWatcherEvent.watchTransactionsStarted());
        }
      },
    );

    on<_TransactionWatchStarted>(_onTransactionWatchStarted);
    on<_TransactionsReceived>(_onTransactionsReceived);
    on<_CycleAccount>(_onCycleAccount);
  }

  Future<void> _onTransactionWatchStarted(
    _TransactionWatchStarted event,
    Emitter<TransactionWatcherState> emit,
  ) async {
    emit(const TransactionWatcherState.loading());
    await _transactionStreamSubscription?.cancel();
    final failureOrAccounts = await accountRepository.getAllAccounts();

    failureOrAccounts.fold(
      (f) => TransactionWatcherState.loadFailure(f),
      (accounts) {
        final String id = accounts[currentIndex].id.getOrCrash();
        transactionRepository.watchAccountTransactions(id).listen(
              (failureOrTransactions) =>
                  add(TransactionWatcherEvent.transactionsReceived(failureOrTransactions)),
            );
      },
    );
  }

  void _onTransactionsReceived(
    _TransactionsReceived event,
    Emitter<TransactionWatcherState> emit,
  ) {
    final newState = event.failureOrTransactions.fold(
      (f) => TransactionWatcherState.loadFailure(f),
      (transactions) => TransactionWatcherState.loadSuccess(
          transactions, transactions.isNotEmpty ? transactions[0].account : null),
    );
    emit(newState);
  }

  Future<void> _onCycleAccount(_CycleAccount event, Emitter<TransactionWatcherState> emit) async {
    final failureOrCount = await accountRepository.count();

    failureOrCount.fold((f) => null, (numberOfAccounts) {
      if (numberOfAccounts != null && numberOfAccounts != 0) {
        if (event.increment) {
          currentIndex = (currentIndex + 1) % numberOfAccounts;
        } else {
          currentIndex = (currentIndex - 1) % numberOfAccounts;
        }
        print("currentIndex : $currentIndex");
        add(const TransactionWatcherEvent.watchTransactionsStarted());
      }
    });
  }
}
