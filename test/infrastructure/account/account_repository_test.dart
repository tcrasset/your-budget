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
  Account account;
  AccountDTO accountDTO;
  setUp(() async {
    mockDatabase = MockDatabase();
    repository = SQFliteAccountRepository(database: mockDatabase);

    tId = 99;
    tBalance = 666.66;
    tName = "Test name";

    account = Account(id: tId, balance: tBalance, name: tName);

    accountDTO = AccountDTO.fromDomain(account);
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
    await repository.create(account);
    //!Assert
    verify(mockDatabase.insert(DatabaseConstants.accountTable, accountDTO.toJson()));
  });
}
