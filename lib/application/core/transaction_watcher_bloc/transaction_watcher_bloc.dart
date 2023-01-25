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
  StreamSubscription<List<MoneyTransaction>>? _transactionStreamSubscription;
  int currentIndex = 0;

  Set<String> selectedTransactions = {};
  TransactionWatcherBloc({
    required this.transactionRepository,
    required this.accountRepository,
  }) : super(const TransactionWatcherState.initial()) {
    on<_TransactionWatchStarted>(_onTransactionWatchStarted);
    on<_CycleAccount>(_onCycleAccount);
  }

  Future<void> _onTransactionWatchStarted(
    _TransactionWatchStarted event,
    Emitter<TransactionWatcherState> emit,
  ) async {
    emit(const TransactionWatcherState.loading());

    //TODO: use a cubit so store the selected account
    final failureOrAccounts = await accountRepository.getAllAccounts();

    if (failureOrAccounts.isLeft()) {
      emit(TransactionWatcherState.loadFailure(failureOrAccounts as ValueFailure));
    }
    final Account account = ((failureOrAccounts as Right).value as List<Account>)[currentIndex];
    transactionRepository.getTransactionsByAccount(account.id);

    await emit.forEach<Either<ValueFailure<dynamic>, List<MoneyTransaction>>>(
      transactionRepository.getTransactionsByAccount(account.id),
      onData: (failureOrTransactions) => failureOrTransactions.fold(
        (l) => TransactionWatcherState.loadFailure(l),
        (r) => TransactionWatcherState.loadSuccess(r, account),
      ),
    );
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
