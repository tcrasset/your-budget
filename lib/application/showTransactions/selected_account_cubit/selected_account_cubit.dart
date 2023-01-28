import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/account_repository.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/constants/i_constants_provider.dart';
import 'package:your_budget/models/utils.dart';

class SelectedAccountCubit extends Cubit<Account?> {
  final AccountRepository accountRepository;
  Account? selected;
  int selectedIndex = -1;

  SelectedAccountCubit({required this.accountRepository, required this.selected}) : super(selected);

  Account? get account => selected;

  Future<void> selectNext() async {
    selected = await accountRepository.getNextAccount(selected);
  }

  Future<void> selectPrevious() async {
    selected = await accountRepository.getPreviousAccount(selected);
  }
}
