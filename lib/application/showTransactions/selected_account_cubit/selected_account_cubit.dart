import 'package:bloc/bloc.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/account_repository.dart';

class SelectedAccountCubit extends Cubit<Account?> {
  final AccountRepository accountRepository;

  SelectedAccountCubit({required this.accountRepository}) : super(null);

  Account? get account => state;

  Future<void> selectNext() async {
    final newState = await accountRepository.getNextAccount(state);
    emit(newState);
  }

  Future<void> selectPrevious() async {
    final newState = await accountRepository.getPreviousAccount(state);
    emit(newState);
  }
}
