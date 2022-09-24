part of 'transaction_selector_bloc.dart';

@freezed
class TransactionSelectorState with _$TransactionSelectorState {
  const factory TransactionSelectorState.initial() = _Initial;
  const factory TransactionSelectorState.loading() = _Loading;
  const factory TransactionSelectorState.deleted() = Deleted;
  const factory TransactionSelectorState.modifying() = Modifying;
  const factory TransactionSelectorState.notModifying() = NotModifying;
}
