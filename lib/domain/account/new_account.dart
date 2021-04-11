// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';

part 'new_account.freezed.dart';

@freezed
abstract class NewAccount implements _$NewAccount {
  const factory NewAccount({
    @required UniqueId id,
    @required Name name,
    @required Amount balance,
  }) = _NewAccount;

  const NewAccount._();

  factory NewAccount.empty() => NewAccount(
        id: UniqueId(),
        name: Name(""),
        balance: Amount(""),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.andThen(balance.failureOrUnit).fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
