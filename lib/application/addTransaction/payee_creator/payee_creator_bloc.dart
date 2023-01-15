// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/payee/payee.dart';

part 'payee_creator_event.dart';
part 'payee_creator_state.dart';
part 'payee_creator_bloc.freezed.dart';

class PayeeCreatorBloc extends Bloc<PayeeCreatorEvent, PayeeCreatorState> {
  final IPayeeProvider payeeProvider;
  PayeeCreatorBloc({required this.payeeProvider}) : super(PayeeCreatorState.initial()) {
    on<_Initialized>(_onInitialized);
    on<_NameChanged>(_onNameChanged);
    on<_Saved>(_onSaved);
  }

  void _onInitialized(_Initialized event, Emitter<PayeeCreatorState> emit) {
    final newState = event.initialNameOption.fold(
      () => /*No initial name*/ state,
      (initialName) => state.copyWith(payee: state.payee.copyWith(name: initialName)),
    );

    emit(newState);
  }

  void _onNameChanged(_NameChanged event, Emitter<PayeeCreatorState> emit) {
    final newState = state.copyWith(
      payee: state.payee.copyWith(name: Name(event.name)),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  Future<void> _onSaved(_Saved event, Emitter<PayeeCreatorState> emit) async {
    Either<ValueFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(isSaving: true));

    if (state.payee.failureOption.isNone()) {
      // failureOrSuccess = state.isEditing
      //     ? await payeeProvider.update(state.payee)
      //     : await payeeProvider.create(state.payee);
      failureOrSuccess = await payeeProvider.create(state.payee);
    }

    final newState = state.copyWith(
      isSaving: false,
      showErrorMessages: true,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    );

    emit(newState);
  }
}
