import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/payee_list.dart';

class MockQueries extends Mock implements Queries {}

main() {
  Queries mockQueries;
  Payee tPayee;
  Payee tPayee2;

  setUp(() async {
    mockQueries = MockQueries();
    tPayee = Payee(id: 99, name: "Test payee");
    tPayee2 = Payee(id: 100, name: "Test payee 2");
  });

  test('when creating a PayeeList, ensure the payees are passed in', () {
    //!Arrange
    //!Act
    PayeeList payeeList = PayeeList(mockQueries, [tPayee]);
    //!Assert
    expect(payeeList.payees, [tPayee]);
  });

  test('when add() is called, add a Payee', () {
    //!Arrange
    //!Act
    PayeeList payeeList = PayeeList(mockQueries, [tPayee]);
    payeeList.add(tPayee2);
    //!Assert
    expect(payeeList.payees, [tPayee, tPayee2]);
  });

  test('when addAll() is called, add a list of Payees', () {
    //!Arrange

    //!Act
    PayeeList payeeList = PayeeList(mockQueries, []);

    payeeList.addAll([tPayee, tPayee2]);
    //!Assert
    expect(payeeList.payees, [tPayee, tPayee2]);
  });
}
