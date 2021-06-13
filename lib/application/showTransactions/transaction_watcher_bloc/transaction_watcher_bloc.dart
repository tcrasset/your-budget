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

  TransactionWatcherBloc({required this.transactionRepository, required this.accountRepository})
      : super(const TransactionWatcherState.initial());

  StreamSubscription<List<MoneyTransaction>>? _transactionStreamSubscription;
  int currentAccountID = 1; // First ID in database is at 1

  @override
  Stream<TransactionWatcherState> mapEventToState(
    TransactionWatcherEvent event,
  ) async* {
    yield* event.map(
      watchTransactionsStarted: (e) async* {
        yield const TransactionWatcherState.loading();
        await _transactionStreamSubscription?.cancel();

        transactionRepository.watchAccountTransactions(currentAccountID).listen(
              (failureOrTransactions) =>
                  add(TransactionWatcherEvent.transactionsReceived(failureOrTransactions)),
            );
      },
      transactionsReceived: (e) async* {
        yield e.failureOrTransactions.fold(
          (f) => TransactionWatcherState.loadFailure(f),
          (transactions) => TransactionWatcherState.loadSuccess(transactions),
        );
      },
      cycleAccount: (e) async* {
        yield const TransactionWatcherState.loading();
        final failureOrCount = await accountRepository.count();
        failureOrCount.fold(
          (f) async* {
            yield TransactionWatcherState.loadFailure(f);
          },
          (numberOfAccounts) {
            if (numberOfAccounts != 0) {
              currentAccountID =
                  (currentAccountID + (e.increment ? 1 : -1) - 1) % numberOfAccounts! +
                      1; // -1 then +1 so that is never goes to 0
              add(const TransactionWatcherEvent.watchTransactionsStarted());
            }
          },
        );
      },
    );
  }
}
