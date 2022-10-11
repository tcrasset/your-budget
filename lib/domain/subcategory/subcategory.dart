// Flutter imports:
import 'dart:math';

import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'subcategory.freezed.dart';

/// Class that defines an entity/person that either received money or gave money to the budget
/// holder.
/// It is defined using an unique [id] and a [name].
@freezed
abstract class Subcategory implements _$Subcategory {
  const factory Subcategory({
    required UniqueId id,
    required UniqueId categoryID,
    required Name name,
    required Amount budgeted,
    required Amount available,
  }) = _Subcategory;

  const Subcategory._();

  factory Subcategory.empty() => Subcategory(
        id: UniqueId(),
        categoryID: UniqueId(),
        name: Name(""),
        budgeted: Amount(""),
        available: Amount(""),
      );

  // Used for testing
  factory Subcategory.random() => Subcategory(
        id: UniqueId(),
        categoryID: UniqueId(),
        name: Name("Bobby_${Random().nextInt(25)}"),
        budgeted: Amount((Random().nextDouble() * 1000).toString()),
        available: Amount((Random().nextDouble() * 100).toString()),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.andThen(budgeted.failureOrUnit).andThen(available.failureOrUnit).fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
