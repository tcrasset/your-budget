// Package imports:
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/infrastructure/account/account_dto.dart';
import 'package:your_budget/infrastructure/account/account_repository.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/constants.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  Database mockDatabase;
  SQFliteAccountRepository repository;
  int tId;
  String tName;
  double tBalance;
  Account tAccount;
  AccountDTO accountDTO;
  setUp(() async {
    mockDatabase = MockDatabase();
    repository = SQFliteAccountRepository(database: mockDatabase);

    tId = 99;
    tBalance = 666.66;
    tName = "Test name";

    tAccount = Account(id: tId, balance: tBalance, name: tName);

    accountDTO = AccountDTO.fromDomain(tAccount);
  });

  test('verify that the database is assigned', () {
    //!Arrange
    expect(repository.database, mockDatabase);
    //!Act

    //!Assert
  });

  test('verify that db.insert is called when creating Account', () async {
    //!Arrange
    //!Act
    await repository.create(tAccount);
    //!Assert
    verify(mockDatabase.insert(DatabaseConstants.accountTable, accountDTO.toJson()));
  });

  test('verify that getAllAccounts creates the correct raw query', () async {
    //!Arrange
    const sql = """
        SELECT * FROM ${DatabaseConstants.accountTable}
        ORDER BY ${DatabaseConstants.ACCOUNT_BALANCE} DESC;
        """;

    //!Act
    try {
      await repository.getAllAccounts();
    } catch (e) {
      /* We are catching the error because mockDatabase.rawQuery returns nothing */
    }

    //!Assert
    verify(mockDatabase.rawQuery(sql));
  });

  test('verify that getAllAccounts returns the correct ones', () async {
    //!Arrange
    final Account tAccount1 = tAccount.copyWith(balance: 55.0);
    final Account tAccount2 = tAccount.copyWith(balance: 44.0);
    final List<Account> tAccountList = [tAccount1, tAccount2];
    final List<Map<String, dynamic>> tRawAccounts = [
      AccountDTO.fromDomain(tAccount1).toJson(),
      AccountDTO.fromDomain(tAccount2).toJson(),
    ];

    when(mockDatabase.rawQuery(any)).thenAnswer((_) async => tRawAccounts);
    //!Act
    final accounts = await repository.getAllAccounts();
    //!Assert

    accounts.fold(
      (failure) => throw TestFailure(failure.toString()),
      (accounts) {
        expect(accounts[0].balance, tAccountList[0].balance);
        expect(accounts[1].balance, tAccountList[1].balance);
      },
    );
  });
}
