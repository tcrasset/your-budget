// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/account_list.dart';
import 'package:your_budget/models/queries.dart';

class MockQueries extends Mock implements Queries {}

void main() {
  Queries mockQueries;
  Account tAccount;
  AccountList accountList;
  const int tId = 99;
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
    final Account tAccount2 =
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
    const double tAmount = 50.00;
    final double previousBalance = tAccount.balance;
    //!Act
    accountList.creditAccount(id: tId, amount: tAmount);
    //!Assert
    verify(mockQueries.updateAccount(argThat(isA<Account>())));
    verify(mockQueries.updateMostRecentAccountUsed(tAccount.id));

    final Account account =
        accountList.accounts.singleWhere((account) => account.id == tId);
    expect(account.balance, previousBalance + tAmount);
  });

  test(
      'verify that debitAccount() removes the a specified amout to the given account',
      () {
    //!Arrange
    const double tAmount = 50.00;
    final double previousBalance = tAccount.balance;
    //!Act
    accountList.debitAccount(id: tId, amount: tAmount);
    //!Assert
    verify(mockQueries.updateAccount(argThat(isA<Account>())));
    verify(mockQueries.updateMostRecentAccountUsed(tAccount.id));

    final Account account =
        accountList.accounts.singleWhere((account) => account.id == tId);
    expect(account.balance, previousBalance - tAmount);
  });

  test(
      'when the mostRecentAccount setter is called, verify that the the most recent' +
          ' account is updated in the database', () {
    //!Arrange

    //!Act
    accountList.setMostRecentAccount(tAccount.id);
    //!Assert
    verify(mockQueries.updateMostRecentAccountUsed(tAccount.id));
  });

  test(
      'when mostRecentAccount getter is called, return the most recently' +
          ' used account.', () async {
    //!Arrange
    when(mockQueries.getMostRecentAccountUsed())
        .thenAnswer((_) async => tAccount.id);
    //!Act
    Account mostRecent = await accountList.getMostRecentAccount();
    //!Assert

    // On first call, check that it gets it from the database
    verify(mockQueries.getMostRecentAccountUsed());

    expect(mostRecent, tAccount);

    clearInteractions(mockQueries);
    // On second call, check that it was cached
    mostRecent = await accountList.getMostRecentAccount();
    verifyNever(mockQueries.getMostRecentAccountUsed());
  });

  test(
      'verify that cycleNextAccount() cycles through all accounts and sets' +
          'mostRecentAccount appropriately', () async {
    //!Arrange
    final Account tAccount2 =
        Account(id: 100, name: "Test account 2", balance: 200.00);
    final Account tAccount3 =
        Account(id: 300, name: "Test account 3", balance: 300.00);
    accountList.add(tAccount2);
    accountList.add(tAccount3);

    accountList.setMostRecentAccount(tAccount.id);
    //!Act
    accountList.cycleNextAccount();
    expect(await accountList.getMostRecentAccount(), tAccount2);
    accountList.cycleNextAccount();
    expect(await accountList.getMostRecentAccount(), tAccount3);
    accountList.cycleNextAccount();
    expect(await accountList.getMostRecentAccount(), tAccount);

    //!Assert
  });
}
