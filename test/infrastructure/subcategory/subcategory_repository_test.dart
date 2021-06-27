// Package imports:
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/infrastructure/subcategory/subcategory_dto.dart';
import 'package:your_budget/infrastructure/subcategory/subcategory_repository.dart';
import 'package:your_budget/models/constants.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  late Database mockDatabase;
  late SQFliteSubcategoryRepository repository;
  int tId;
  int tParentID;
  double budgeted;
  double available;
  String tName;
  late Subcategory tSubcategory;
  late SubcategoryDTO subcategoryDTO;
  setUp(() async {
    mockDatabase = MockDatabase();
    repository = SQFliteSubcategoryRepository(database: mockDatabase);

    tId = 99;
    tParentID = 888;
    tName = "Test name";
    budgeted = 0.00;
    available = 0.00;
    tSubcategory = Subcategory(
      id: UniqueId.fromUniqueString(tId.toString()),
      categoryID: UniqueId.fromUniqueString(tParentID.toString()),
      budgeted: Amount(budgeted.toString()),
      available: Amount(available.toString()),
      name: Name(tName),
    );

    subcategoryDTO = SubcategoryDTO.fromDomain(tSubcategory);
  });

  test('verify that the database is assigned', () {
    //!Arrange
    expect(repository.database, mockDatabase);
    //!Act

    //!Assert
  });

  test('verify that db.insert is called when creating Subcategory', () async {
    //!Arrange
    //!Act
    await repository.create(tSubcategory);
    //!Assert
    verify(mockDatabase.insert(DatabaseConstants.subcategoryTable, subcategoryDTO.toJson()));
  });

  test('verify that getAllSubcategories creates the correct raw query', () async {
    //!Arrange
    const sql = """SELECT * FROM ${DatabaseConstants.subcategoryTable};""";

    //!Act
    try {
      await repository.getAllSubcategories();
    } catch (e) {
      /* We are catching the error because mockDatabase.rawQuery returns nothing */
    }

    //!Assert
    verify(mockDatabase.rawQuery(sql));
  });

  test('verify that getAllSubcategories returns the correct ones', () async {
    //!Arrange

    const tId1 = "1";
    const tId2 = "2";
    // Create new subcategorys with different IDs
    final Subcategory tSubcategory1 = tSubcategory.copyWith(id: UniqueId.fromUniqueString(tId1));
    final Subcategory tSubcategory2 = tSubcategory.copyWith(id: UniqueId.fromUniqueString(tId2));
    final List<Subcategory> tSubcategoryList = [tSubcategory1, tSubcategory2];

    // Change the result to include the ID as part of the JSON (because @JsonKey(ignore))
    final tRawSubcategory1 = SubcategoryDTO.fromDomain(tSubcategory1).toJson();
    final tRawSubcategory2 = SubcategoryDTO.fromDomain(tSubcategory2).toJson();
    tRawSubcategory1['id'] = tId1;
    tRawSubcategory2['id'] = tId2;
    final List<Map<String, dynamic>> tRawSubcategorys = [tRawSubcategory1, tRawSubcategory2];

    when(mockDatabase.rawQuery(any!)).thenAnswer((_) async => tRawSubcategorys);

    //!Act
    final subcategorys = await repository.getAllSubcategories();
    //!Assert

    subcategorys.fold(
      (failure) => throw TestFailure(failure.toString()),
      (subcategorys) => expect(subcategorys, tSubcategoryList),
    );
  });

  test('verify that count() uses the correct query and calls the database', () async {
    //!Arrange
    const sql = """
        SELECT COUNT(*) FROM ${DatabaseConstants.subcategoryTable};
        """;
    //!Act
    await repository.count();

    //!Assert
    verify(mockDatabase.rawQuery(sql));
  });
}
