// Package imports:
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/models/payee.dart';
import 'package:your_budget/models/payee_creator.dart';
import 'package:your_budget/models/queries.dart';

class MockQueries extends Mock implements Queries {}

void main() {
  Queries mockQueries;
  String tName;
  PayeeCreator creator;
  setUp(() async {
    mockQueries = MockQueries();
    tName = "Test payee";
    creator = PayeeCreator(queryContext: mockQueries, name: tName);
  });

  test('verify that constructor sets the parameters', () {
    //!Arrange
    //!Act

    //!Assert
    expect(creator.name, tName);
    expect(creator.queryContext, mockQueries);
  });

  test('verify that create() creates a Payee and makes a call to the database', () async {
    //!Arrange
    const int tId = 25;

    when(mockQueries.addPayee(argThat(isA<PayeeModel>()))).thenAnswer((_) async => tId);

    //!Act
    final Payee payee = await creator.create();

    //!Assert
    verify(mockQueries.addPayee(argThat(isA<PayeeModel>())));
    expect(payee.name, tName);
    expect(payee.id, tId);
  });
}
