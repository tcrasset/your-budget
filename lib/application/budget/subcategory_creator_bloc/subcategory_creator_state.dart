part of 'subcategory_creator_bloc.dart';

@freezed
class SubcategoryCreatorState with _$SubcategoryCreatorState {
  const factory SubcategoryCreatorState({
    required Subcategory subcategory,
    required bool showErrorMessages,
    required bool isSaving,
    required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption,
  }) = _SubcategoryCreatorState;

  factory SubcategoryCreatorState.initial() => SubcategoryCreatorState(
        subcategory: Subcategory.empty(),
        showErrorMessages: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
