import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/category/category.dart';
import 'package:your_budget/domain/category/i_category_provider.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'category_creator_event.dart';
part 'category_creator_state.dart';
part 'category_creator_bloc.freezed.dart';

class CategoryCreatorBloc extends Bloc<CategoryCreatorEvent, CategoryCreatorState> {
  final ICategoryProvider categoryProvider;

  CategoryCreatorBloc({required this.categoryProvider}) : super(CategoryCreatorState.initial()) {
    on<_Initialized>(_onInitialized);
    on<_NameChanged>(_onNameChanged);
    on<_Saved>(_onSaved);
  }

  void _onInitialized(_Initialized event, Emitter<CategoryCreatorState> emit) => emit(state);

  void _onNameChanged(_NameChanged event, Emitter<CategoryCreatorState> emit) {
    final newState = state.copyWith(
      category: state.category.copyWith(name: Name(event.name)),
      saveFailureOrSuccessOption: none(),
    );
    emit(newState);
  }

  Future<void> _onSaved(_Saved event, Emitter<CategoryCreatorState> emit) async {
    Either<ValueFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(isSaving: true));

    if (state.category.failureOption.isNone()) {
      failureOrSuccess = (await categoryProvider.create(state.category)).andThen(right(unit));
    }

    final newState = state.copyWith(
      isSaving: false,
      showErrorMessages: true,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    );

    emit(newState);
  }
}
