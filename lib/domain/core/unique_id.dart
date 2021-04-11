// Package imports:
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import 'value_failure.dart';
import 'value_object.dart';

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

  factory UniqueId.fromUniqueInt(int id) {
    assert(id != null);
    return UniqueId._(
      right(id.toString()),
    );
  }

  const UniqueId._(this.value);
}
