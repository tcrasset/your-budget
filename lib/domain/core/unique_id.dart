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
      right(const Uuid().v4()),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(
      right(uniqueId),
    );
  }

  factory UniqueId.fromUniqueInt(int id) {
    return UniqueId.fromUniqueString(id.toString());
  }

  const UniqueId._(this.value);
}
