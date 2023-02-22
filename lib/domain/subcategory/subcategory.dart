// Flutter imports:
import 'dart:math';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/category/category.dart' as category;
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
part 'subcategory.freezed.dart';

const String UNSELECTABLE_ID = "00000000-deadbeef-00000000-deadbeef";
const String UNSELECTABLE_NAME = "No subcategory needed.";

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

  factory Subcategory.unselectable() => Subcategory(
        id: UniqueId.fromUniqueString(UNSELECTABLE_ID),
        categoryID: UniqueId.fromUniqueString(category.UNSELECTABLE_ID), // Category is not needed.
        name: Name(UNSELECTABLE_NAME),
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

  bool isSelectable() => this.id != UniqueId.fromUniqueString(UNSELECTABLE_ID);
}
