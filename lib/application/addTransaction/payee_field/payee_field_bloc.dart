import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/account_repository.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/payee/payee_repository.dart';

part 'payee_field_event.dart';
part 'payee_field_state.dart';
part 'payee_field_bloc.freezed.dart';

@freezed
class PayableEntries with _$PayableEntries {
  factory PayableEntries({required List<Payee> payees, required List<Account> accounts}) =
      _PaybaleEntries;
}

class PayeeFieldBloc extends Bloc<PayeeFieldEvent, PayeeFieldState> {
  final AccountRepository accountRepository;
  final PayeeRepository payeeRepository;
  PayeeFieldBloc({
    required this.accountRepository,
    required this.payeeRepository,
  }) : super(const PayeeFieldState.initial()) {
    on<_Initialized>((event, emit) => emit(const PayeeFieldState.initial()));
    on<_WatchPayableRequested>(_onWatchPayableRequested);
  }

  Future<void> _onWatchPayableRequested(
    _WatchPayableRequested event,
    Emitter<PayeeFieldState> emit,
  ) async {
    emit(const PayeeFieldState.loading());

    await emit.forEach<Either<ValueFailure, PayableEntries>>(
      _getPayeesAndAccounts(accountRepository, payeeRepository),
      onData: (failureOrEntries) => failureOrEntries.fold(
        (l) => PayeeFieldState.loadFailure(l),
        (entries) => PayeeFieldState.loadSuccess(entries),
      ),
    );
  }

  Stream<Either<ValueFailure, PayableEntries>> _getPayeesAndAccounts(
    AccountRepository accountRepository,
    PayeeRepository payeeRepository,
  ) =>
      Rx.combineLatest2(
        accountRepository.getAccounts(),
        payeeRepository.getPayees(),
        (
          Either<ValueFailure<dynamic>, List<Account>> accounts,
          Either<ValueFailure<dynamic>, List<Payee>> payees,
        ) =>
            Either.map2(
          accounts,
          payees,
          (
            List<Account> accounts,
            List<Payee> payees,
          ) =>
              PayableEntries(payees: payees, accounts: accounts),
        ),
      );
}
