part of 'subcategory_creator_bloc.dart';

@freezed
class SubcategoryCreatorEvent with _$SubcategoryCreatorEvent {
  const factory SubcategoryCreatorEvent.initialized() = _Initialized;

  const factory SubcategoryCreatorEvent.nameChanged(String name) = _NameChanged;
  const factory SubcategoryCreatorEvent.budgetedChanged(String budgeted) = _BudgetedChanged;
  const factory SubcategoryCreatorEvent.availabledChanged(String available) = _AvailableChanged;
  const factory SubcategoryCreatorEvent.saved() = _Saved;
}
