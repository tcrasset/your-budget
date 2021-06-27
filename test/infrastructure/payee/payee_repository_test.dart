// Package imports:
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/infrastructure/payee/payee_dto.dart';
import 'package:your_budget/infrastructure/payee/payee_repository.dart';
import 'package:your_budget/models/constants.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  late Database mockDatabase;
  late SQFlitePayeeRepository repository;
  int tId;
  String tName;
  late Payee tPayee;
  late PayeeDTO payeeDTO;
  setUp(() async {
    mockDatabase = MockDatabase();
    repository = SQFlitePayeeRepository(database: mockDatabase);

    tId = 99;
    tName = "Test name";
    tPayee = Payee(
      id: UniqueId.fromUniqueString(tId.toString()),
      name: Name(tName),
    );

    payeeDTO = PayeeDTO.fromDomain(tPayee);
  });

  test('verify that the database is assigned', () {
    //!Arrange
    expect(repository.database, mockDatabase);
    //!Act

    //!Assert
  });

  test('verify that db.insert is called when creating Payee', () async {
    //!Arrange
    //!Act
    await repository.create(tPayee);
    //!Assert
    verify(mockDatabase.insert(DatabaseConstants.payeeTable, payeeDTO.toJson()));
  });

  test('verify that getAllPayees creates the correct raw query', () async {
    //!Arrange
    const sql = """
        SELECT * FROM ${DatabaseConstants.payeeTable}
        ORDER BY ${DatabaseConstants.PAYEE_NAME} DESC;
        """;

    //!Act
    try {
      await repository.getAllPayees();
    } catch (e) {
      /* We are catching the error because mockDatabase.rawQuery returns nothing */
    }

    //!Assert
    verify(mockDatabase.rawQuery(sql));
  });

  test('verify that getAllPayees returns the correct ones', () async {
    //!Arrange

    const tId1 = "1";
    const tId2 = "2";
    // Create new payees with different IDs
    final Payee tPayee1 = tPayee.copyWith(id: UniqueId.fromUniqueString(tId1));
    final Payee tPayee2 = tPayee.copyWith(id: UniqueId.fromUniqueString(tId2));
    final List<Payee> tPayeeList = [tPayee1, tPayee2];

    // Change the result to include the ID as part of the JSON (because @JsonKey(ignore))
    final tRawPayee1 = PayeeDTO.fromDomain(tPayee1).toJson();
    final tRawPayee2 = PayeeDTO.fromDomain(tPayee2).toJson();
    tRawPayee1['id'] = tId1;
    tRawPayee2['id'] = tId2;
    final List<Map<String, dynamic>> tRawPayees = [tRawPayee1, tRawPayee2];

    when(mockDatabase.rawQuery(any!)).thenAnswer((_) async => tRawPayees);

    //!Act
    final payees = await repository.getAllPayees();
    //!Assert

    payees.fold(
      (failure) => throw TestFailure(failure.toString()),
      (payees) => expect(payees, tPayeeList),
    );
  });

  test('verify that count() uses the correct query and calls the database', () async {
    //!Arrange
    const sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.payeeTable};
        """;
    //!Act
    await repository.count();

    //!Assert
    verify(mockDatabase.rawQuery(sql));
  });
}
