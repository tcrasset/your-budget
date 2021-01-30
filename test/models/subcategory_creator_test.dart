import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/subcategory_creator.dart';
import 'package:your_budget/models/queries.dart';

class MockQueries extends Mock implements Queries {}

main() {
  Queries mockQueries;
  String tName;
  int tParentId;
  double tBudgeted;
  double tAvailable;
  SubCategoryCreator creator;
  setUp(() async {
    mockQueries = MockQueries();
    tName = "Test subcategory";
    tParentId = 20;
    tBudgeted = 99.99;
    tAvailable = 50.00;
    creator = SubCategoryCreator(
        queryContext: mockQueries,
        name: tName,
        parentId: tParentId,
        budgeted: tBudgeted,
        available: tAvailable);
  });

  test('verify that constructor sets the parameters', () {
    //!Arrange
    //!Act

    //!Assert
    expect(creator.name, tName);
    expect(creator.parentId, tParentId);
    expect(creator.budgeted, tBudgeted);
    expect(creator.available, tAvailable);
    expect(creator.queryContext, mockQueries);
  });

  test(
      'verify that create() creates a SubCategory and makes a call to the database',
      () async {
    //!Arrange
    int tId = 25;

    when(mockQueries.addSubcategory(argThat(isA<SubCategoryModel>())))
        .thenAnswer((_) async => tId);

    //!Act
    SubCategory subcategory = await creator.create();

    //!Assert
    verify(mockQueries.addSubcategory(argThat(isA<SubCategoryModel>())));
    expect(subcategory.name, tName);
    expect(subcategory.parentId, tParentId);
    expect(subcategory.budgeted, tBudgeted);
    expect(subcategory.available, tAvailable);
    expect(subcategory.id, tId);
  });
}
