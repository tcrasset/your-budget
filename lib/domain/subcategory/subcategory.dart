// Flutter imports:
import 'dart:math';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'subcategory.freezed.dart';

@freezed
abstract class Subcategory implements _$Subcategory {
  const factory Subcategory({
    required UniqueId id,
    required UniqueId categoryID,
    required Name name,
  }) = _Subcategory;

  const Subcategory._();

  factory Subcategory.empty() => Subcategory(
        id: UniqueId(),
        categoryID: UniqueId(),
        name: Name(""),
      );

  // Used for testing
  factory Subcategory.random() => Subcategory(
        id: UniqueId(),
        categoryID: UniqueId(),
        name: Name("Bobby_${Random().nextInt(25)}"),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
