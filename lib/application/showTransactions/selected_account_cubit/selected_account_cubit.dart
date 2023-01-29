import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/account_repository.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/models/utils.dart';

class SelectedAccountCubit extends Cubit<Account?> {
  final AccountRepository accountRepository;

  SelectedAccountCubit({required this.accountRepository}) : super(null);

  Account? get account => state;

  Future<void> selectNext() async {
    final newState = await accountRepository.getNextAccount(state);
    emit(newState);
  }

  Future<void> selectPrevious() async {
    final newState = await accountRepository.getNextAccount(state);
    emit(newState);
  }
}
