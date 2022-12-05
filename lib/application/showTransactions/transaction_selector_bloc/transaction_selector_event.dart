part of 'transaction_selector_bloc.dart';

@freezed
class TransactionSelectorEvent with _$TransactionSelectorEvent {
  const factory TransactionSelectorEvent.toggleSelected(MoneyTransaction transaction) =
      _ToggleSelected;
  const factory TransactionSelectorEvent.deleteSelected() = _DeleteSelected;
  const factory TransactionSelectorEvent.toggleModifying() = _ToggleModifying;
}
