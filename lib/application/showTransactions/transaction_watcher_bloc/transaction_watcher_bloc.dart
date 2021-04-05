// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/models/money_transaction.dart';

part 'transaction_watcher_event.dart';
part 'transaction_watcher_state.dart';
part 'transaction_watcher_bloc.freezed.dart';

class TransactionWatcherBloc
    extends Bloc<TransactionWatcherEvent, TransactionWatcherState> {
  final ITransactionRepository transactionRepository;
  TransactionWatcherBloc({@required this.transactionRepository})
      : super(const TransactionWatcherState.initial());

  StreamSubscription<List<MoneyTransaction>> _transactionStreamSubscription;

  @override
  Stream<TransactionWatcherState> mapEventToState(
    TransactionWatcherEvent event,
  ) async* {
    yield* event.map(
      watchTransactionsStarted: (e) async* {
        yield const TransactionWatcherState.loading();
        await _transactionStreamSubscription?.cancel();

        final failureOrTransactions =
            transactionRepository.watchAllTransactions().fold(
          (f) => f,
          (stream) {
            _transactionStreamSubscription = stream.listen((transactions) {
              add(TransactionWatcherEvent.transactionsReceived(transactions));
            });
          },
        );

        if (failureOrTransactions is ValueFailure) {
          yield TransactionWatcherState.loadFailure(failureOrTransactions);
        }
      },
      transactionsReceived: (e) async* {
        yield TransactionWatcherState.loadSuccess(e.transactions);
      },
    );
  }
}
