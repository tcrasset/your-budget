// Package imports:
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/core/value_object.dart';

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }

  const UniqueId._(this.value);
}
