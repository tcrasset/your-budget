part of 'transaction_selector_bloc.dart';

@freezed
class TransactionSelectorEvent with _$TransactionSelectorEvent {
  const factory TransactionSelectorEvent.select(String id) = _Selected;
  const factory TransactionSelectorEvent.unselect(String id) = _Unselected;
  const factory TransactionSelectorEvent.deleteSelected() = _DeleteSelected;
  const factory TransactionSelectorEvent.toggleModifying() = _ToggleModifying;
}
