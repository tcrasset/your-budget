// Package imports:
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/main_category_creator.dart';
import 'package:your_budget/models/queries.dart';

class MockQueries extends Mock implements Queries {}

void main() {
  late Queries mockQueries;
  late String tName;
  late MainCategoryCreator creator;
  setUp(() async {
    mockQueries = MockQueries();
    tName = "Test maincategory";
    creator = MainCategoryCreator(
      queryContext: mockQueries,
      name: tName,
    );
  });

  test('verify that constructor sets the parameters', () {
    //!Arrange
    //!Act

    //!Assert
    expect(creator.name, tName);
    expect(creator.queryContext, mockQueries);
  });

  test('verify that create() creates a MainCategory and makes a call to the database', () async {
    //!Arrange
    const int tId = 25;

    when(mockQueries.addCategory(argThat(isA<MainCategoryModel>())!)).thenAnswer((_) async => tId);

    //!Act
    final MainCategory maincategory = await creator.create();

    //!Assert
    verify(mockQueries.addCategory(argThat(isA<MainCategoryModel>())!));
    expect(maincategory.name, tName);
    expect(maincategory.id, tId);
  });
}
