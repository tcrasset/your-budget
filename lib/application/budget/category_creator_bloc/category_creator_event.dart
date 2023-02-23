part of 'category_creator_bloc.dart';

@freezed
class CategoryCreatorEvent with _$CategoryCreatorEvent {
  const factory CategoryCreatorEvent.initialized() = _Initialized;
  const factory CategoryCreatorEvent.nameChanged(String name) = _NameChanged;
  const factory CategoryCreatorEvent.saved() = _Saved;
}
