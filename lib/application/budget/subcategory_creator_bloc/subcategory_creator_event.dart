part of 'subcategory_creator_bloc.dart';

@freezed
class SubcategoryCreatorEvent with _$SubcategoryCreatorEvent {
  const factory SubcategoryCreatorEvent.initialized({required UniqueId categoryId}) = _Initialized;
  const factory SubcategoryCreatorEvent.nameChanged(String name) = _NameChanged;
  const factory SubcategoryCreatorEvent.saved() = _Saved;
}
