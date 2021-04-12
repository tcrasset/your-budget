// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:your_budget/domain/core/unique_id.dart';

void main() {
  test('verify that UniqueId() constructors works', () {
    //!Arrange
    const String tId = "123";

    //!Act
    //!Assert
    expect(UniqueId(), isA<UniqueId>());

    final UniqueId idString = UniqueId.fromUniqueString(tId);
    final UniqueId idInt = UniqueId.fromUniqueInt(int.parse(tId));
    expect(idString, idInt);
  });
}
