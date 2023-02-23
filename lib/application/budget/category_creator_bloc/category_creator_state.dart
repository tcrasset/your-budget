part of 'category_creator_bloc.dart';

@freezed
class CategoryCreatorState with _$CategoryCreatorState {
  const factory CategoryCreatorState({
    required Category category,
    required bool showErrorMessages,
    required bool isSaving,
    required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption,
  }) = _CategoryCreatorState;

  factory CategoryCreatorState.initial() => CategoryCreatorState(
        category: Category.empty(),
        showErrorMessages: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
