part of 'subcategory_creator_bloc.dart';

@freezed
class SubcategoryCreatorState with _$SubcategoryCreatorState {
  const factory SubcategoryCreatorState({
    /*required*/ required Subcategory subcategory,
    /*required*/ required bool showErrorMessages,
    /*required*/ required bool isSaving,
    /*required*/ required bool isEditing,
    /*required*/ required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption,
  }) = _SubcategoryCreatorState;

  factory SubcategoryCreatorState._initial(bool isEditing) => SubcategoryCreatorState(
        subcategory: Subcategory.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: isEditing,
        saveFailureOrSuccessOption: none(),
      );

  factory SubcategoryCreatorState.initialEditing() => SubcategoryCreatorState._initial(true);
  factory SubcategoryCreatorState.initialCreating() => SubcategoryCreatorState._initial(false);
}
