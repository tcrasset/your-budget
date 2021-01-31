import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/account_list.dart';

class MockQueries extends Mock implements Queries {}

main() {
  Queries mockQueries;
  Account tAccount;
  AccountList accountList;
  int tId = 99;
  setUp(() async {
    mockQueries = MockQueries();
    tAccount = Account(id: tId, name: "Test account", balance: 100.00);
    accountList = AccountList(mockQueries, [tAccount]);
  });

  test('when creating an AccountList, ensure the accounts are passed in', () {
    //!Arrange
    //!Act
    //!Assert
    expect(accountList.accounts, [tAccount]);
  });

  test('when add() is called, add an Account', () {
    //!Arrange
    Account tAccount2 =
        Account(id: 100, name: "Test account 2", balance: 200.00);

    //!Act
    accountList.add(tAccount2);
    //!Assert
    expect(accountList.accounts, [tAccount, tAccount2]);
  });

  test(
      'verify that creditAccount() adds the specified amout to the given account',
      () {
    //!Arrange
    double tAmount = 50.00;
    double previousBalance = tAccount.balance;
    //!Act
    accountList.creditAccount(id:tId,amount: tAmount);
    //!Assert
    verify(mockQueries.updateAccount(argThat(isA<Account>())));

    final Account account =
        accountList.accounts.singleWhere((account) => account.id == tId);
    expect(account.balance, previousBalance + tAmount );

  });

  test(
      'verify that debitAccount() removes the a specified amout to the given account',
      () {
    //!Arrange
    double tAmount = 50.00;
    double previousBalance = tAccount.balance;
    //!Act
    accountList.debitAccount(id:tId,amount: tAmount);
    //!Assert
    verify(mockQueries.updateAccount(argThat(isA<Account>())));

    final Account account =
        accountList.accounts.singleWhere((account) => account.id == tId);
    expect(account.balance, previousBalance - tAmount);

  });
}
