// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'category.freezed.dart';

const String UNSELECTABLE_ID = "00000000-deadbeef-00000000-deadbeef";
const String UNSELECTABLE_NAME = "Unselectable";

/// Class that defines an entity/person that either received money or gave money to the budget
/// holder.
/// It is defined using an unique [id] and a [name].
@freezed
abstract class Category implements _$Category {
  const factory Category({
    required UniqueId id,
    required Name name,
  }) = _Category;

  const Category._();

  factory Category.empty() => Category(
        id: UniqueId(),
        name: Name(""),
      );

  // Used for testing
  factory Category.random() => Category(
        id: UniqueId(),
        name: Name("Bobby"),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
