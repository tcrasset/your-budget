// Flutter imports:
import 'dart:math';

import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'budgetvalue.freezed.dart';

/// Class representing the values tied to a SubCategory, represented by [subcategoryId], for a
/// particular month set by [month] and [year].
@freezed
abstract class BudgetValue implements _$BudgetValue {
  const factory BudgetValue({
    required UniqueId id,
    required UniqueId subcategoryId,
    required Amount budgeted,
    required Amount available,
    required DateTime date,
  }) = _BudgetValue;

  const BudgetValue._();

  factory BudgetValue.empty() => BudgetValue(
      id: UniqueId(),
      subcategoryId: UniqueId(),
      budgeted: Amount(""),
      available: Amount(""),
      date: DateTime.now());

  Option<ValueFailure<dynamic>> get failureOption {
    return budgeted.failureOrUnit.andThen(available.failureOrUnit).fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
