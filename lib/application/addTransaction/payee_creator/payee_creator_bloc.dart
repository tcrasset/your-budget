// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_repository.dart';
import 'package:your_budget/domain/payee/payee.dart';

part 'payee_creator_event.dart';
part 'payee_creator_state.dart';
part 'payee_creator_bloc.freezed.dart';

class PayeeCreatorBloc extends Bloc<PayeeCreatorEvent, PayeeCreatorState> {
  final IPayeeRepository payeeRepository;
  PayeeCreatorBloc({required this.payeeRepository}) : super(PayeeCreatorState.initial()) {
    on<_Initialized>((event, emit) => _onInitialized);
    on<_NameChanged>((event, emit) => _onNameChanged);
    on<_Saved>((event, emit) => _onSaved);
  }

  _onInitialized(_Initialized event, Emitter<PayeeCreatorState> emit) async {
    var newState = event.initialNameOption.fold(
      () => /*No initial name*/ state,
      (initialName) => state.copyWith(payee: state.payee.copyWith(name: initialName)),
    );

    emit(newState);
  }

  _onSaved(_Saved event, Emitter<PayeeCreatorState> emit) async {
    Either<ValueFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(isSaving: true));

    if (state.payee.failureOption.isNone()) {
      // failureOrSuccess = state.isEditing
      //     ? await payeeRepository.update(state.payee)
      //     : await payeeRepository.create(state.payee);
      failureOrSuccess = await payeeRepository.create(state.payee);
    }

    var newState = state.copyWith(
      isSaving: false,
      showErrorMessages: true,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    );

    emit(newState);
  }

  _onNameChanged(_NameChanged event, Emitter<PayeeCreatorState> emit) async {
    if (event != null) {
      var newState = state.copyWith(
        payee: state.payee.copyWith(name: Name(event.name)),
        saveFailureOrSuccessOption: none(),
      );
      emit(newState);
    }
  }
}
