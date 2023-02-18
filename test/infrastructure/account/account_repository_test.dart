// Package imports:
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/infrastructure/account/account_dto.dart';
import 'package:your_budget/infrastructure/account/account_provider.dart';
import 'package:your_budget/models/constants.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  late Database mockDatabase;
  late SQFliteAccountProvider repository;
  int tId;
  String tName;
  double tBalance;
  late Account tAccount;
  late AccountDTO accountDTO;
  setUp(() async {
    mockDatabase = MockDatabase();
    repository = SQFliteAccountProvider(database: mockDatabase);

    tId = 99;
    tBalance = 666.66;
    tName = "Test name";

    tAccount = Account(
      id: UniqueId.fromUniqueString(tId.toString()),
      balance: Amount(tBalance.toString()),
      name: Name(tName),
    );

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

    const tId1 = "1";
    const tId2 = "2";
    // Create new accounts with different IDs
    final Account tAccount1 = tAccount.copyWith(id: UniqueId.fromUniqueString(tId1));
    final Account tAccount2 = tAccount.copyWith(id: UniqueId.fromUniqueString(tId2));
    final List<Account> tAccountList = [tAccount1, tAccount2];

    // Change the result to include the ID as part of the JSON (because @JsonKey(ignore))
    final tRawAccount1 = AccountDTO.fromDomain(tAccount1).toJson();
    final tRawAccount2 = AccountDTO.fromDomain(tAccount2).toJson();
    tRawAccount1['id'] = tId1;
    tRawAccount2['id'] = tId2;
    final List<Map<String, dynamic>> tRawAccounts = [tRawAccount1, tRawAccount2];

    when(mockDatabase.rawQuery(any!)).thenAnswer((_) async => tRawAccounts);

    //!Act
    final accounts = await repository.getAllAccounts();
    //!Assert

    accounts.fold(
      (failure) => throw TestFailure(failure.toString()),
      (accounts) => expect(accounts, tAccountList),
    );
  });

  test('verify that count() uses the correct query and calls the database', () async {
    //!Arrange
    const sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.accountTable};
        """;
    //!Act
    await repository.count();

    //!Assert
    verify(mockDatabase.rawQuery(sql));
  });
}
