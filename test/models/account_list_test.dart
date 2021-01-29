import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/account_list.dart';

class MockQueries extends Mock implements Queries {}

main() {
  Queries mockQueries;
  Account tAccount;
  Account tAccount2;

  setUp(() async {
    mockQueries = MockQueries();
    tAccount = Account(id: 99, name: "Test account", balance: 100.00);
    tAccount2 = Account(id: 100, name: "Test account 2", balance: 200.00);
  });

  test('when creating an AccountList, ensure the accounts are passed in', () {
    //!Arrange
    //!Act
    AccountList accountList = AccountList(mockQueries, [tAccount]);
    //!Assert
    expect(accountList.accounts, [tAccount]);
  });

  test('when add() is called, add an Account', () {
    //!Arrange
    //!Act
    AccountList accountList = AccountList(mockQueries, [tAccount]);
    accountList.add(tAccount2);
    //!Assert
    expect(accountList.accounts, [tAccount, tAccount2]);
  });

  // test('when addAll() is called, add a list of Payees', () {
  //   //!Arrange

  //   //!Act
  //   PayeeList payeeList = PayeeList(mockQueries, []);

  //   payeeList.addAll([tPayee, tPayee2]);
  //   //!Assert
  //   expect(payeeList.payees, [tPayee, tPayee2]);
  // });
}
