// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/infrastructure/account/account_dto.dart';
import 'package:your_budget/infrastructure/payee/payee_dto.dart';
import 'package:your_budget/infrastructure/subcategory/subcategory_dto.dart';

part 'transaction_dto.freezed.dart';
part 'transaction_dto.g.dart';

@freezed
abstract class MoneyTransactionDTO implements _$MoneyTransactionDTO {
  const MoneyTransactionDTO._();

  const factory MoneyTransactionDTO({
    @JsonKey(ignore: true) String id,
    @required String subcatID,
    @required String payeeID,
    @required String accountID,
    @JsonKey(toJson: null, includeIfNull: false) String subcatName,
    @JsonKey(toJson: null, includeIfNull: false) String payeeName,
    @JsonKey(toJson: null, includeIfNull: false) String accountName,
    @required double amount,
    @required String memo,
    @required int dateInMillisecondsSinceEpoch,
  }) = _TransactionDTO;

  factory MoneyTransactionDTO.fromDomain(MoneyTransaction transaction) {
    return MoneyTransactionDTO(
      id: transaction.id.getOrCrash(),
      subcatID: transaction.subcatID.getOrCrash(),
      subcatName: transaction.subcatName.getOrCrash(),
      payeeID: transaction.payee.id.getOrCrash(),
      payeeName: transaction.payee.name.getOrCrash(),
      accountID: transaction.accountID.getOrCrash(),
      accountName: transaction.accountName.getOrCrash(),
      amount: transaction.amount.getOrCrash(),
      memo: transaction.memo.getOrCrash(),
      dateInMillisecondsSinceEpoch: transaction.date.millisecondsSinceEpoch,
    );
  }

  MoneyTransaction toDomain() {
    return MoneyTransaction(
      id: UniqueId.fromUniqueString(id),
      subcatID: UniqueId.fromUniqueString(subcatID),
      subcatName: Name(subcatName),
      payeeID: UniqueId.fromUniqueString(payeeID),
      payeeName: Name(payeeName),
      payee: Payee(id: UniqueId.fromUniqueString(payeeID), name: Name(payeeName)),
      accountID: UniqueId.fromUniqueString(accountID),
      accountName: Name(accountName),
      amount: Amount(amount.toString()),
      memo: Name(memo),
      date: DateTime.fromMillisecondsSinceEpoch(dateInMillisecondsSinceEpoch),
    );
  }

  factory MoneyTransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$MoneyTransactionDTOFromJson(json);
  factory MoneyTransactionDTO.fromSQL(Map<String, dynamic> json) {
    return MoneyTransactionDTO.fromJson(json).copyWith(id: json["id"].toString());
  }
}
