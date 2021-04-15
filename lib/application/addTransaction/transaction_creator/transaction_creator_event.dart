part of 'transaction_creator_bloc.dart';

@freezed
abstract class TransactionCreatorEvent with _$TransactionCreatorEvent {
  const factory TransactionCreatorEvent.initialized() = _Initialized;

  const factory TransactionCreatorEvent.payeeChanged(Payee payee) = _PayeeChanged;
  const factory TransactionCreatorEvent.accountChanged(Account account) = _AccountChanged;
  const factory TransactionCreatorEvent.subcategoryChanged(SubCategory subcategory) =
      _SubcategoryChanged;
  const factory TransactionCreatorEvent.dateChanged(DateTime date) = _DateChanged;
  const factory TransactionCreatorEvent.memoChanged(String memo) = _MemoChanged;
  const factory TransactionCreatorEvent.saved() = _Saved;
}
