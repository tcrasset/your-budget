// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'payee.freezed.dart';

/// Class that defines an entity/person that either received money or gave money to the budget
/// holder.
/// It is defined using an unique [id] and a [name].
@freezed
abstract class Payee implements _$Payee {
  const factory Payee({
    @required UniqueId id,
    @required Name name,
  }) = _Payee;

  const Payee._();

  factory Payee.empty() => Payee(
        id: UniqueId(),
        name: Name(""),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.fold(
      (f) => some(f),
      (_) => none(),
    );
  }
}
