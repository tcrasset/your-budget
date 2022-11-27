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
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';

part 'transaction_dto.freezed.dart';
part 'transaction_dto.g.dart';

@freezed
abstract class MoneyTransactionDTO implements _$MoneyTransactionDTO {
  const MoneyTransactionDTO._();

  const factory MoneyTransactionDTO({
    @JsonKey(
      toJson: ignore,
      fromJson: convertToString,
      includeIfNull: false,
      name: DatabaseConstants.MONEYTRANSACTION_ID,
    )
        required String id,
    @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
        required double amount,
    @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
        required String memo,
    @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
        required int dateInMillisecondsSinceEpoch,
    @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
        required int isInitialTransaction,
    @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
        required String subcatID,
    @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
        required String subcatName,
    @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
        required String subcatCategoryId,
    @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
        required String payeeID,
    @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
        required String payeeName,
    @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
        required String accountID,
    @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_NAME)
        required String accountName,
    @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_BALANCE)
        required double accountBalance,
  }) = _TransactionDTO;

  factory MoneyTransactionDTO.fromDomain(MoneyTransaction transaction) {
    return MoneyTransactionDTO(
      id: transaction.id.getOrCrash(),
      amount: transaction.amount.getOrCrash(),
      memo: transaction.memo.getOrCrash(),
      isInitialTransaction: transaction.isInitialTransaction ? 0 : 1,
      dateInMillisecondsSinceEpoch: transaction.date.millisecondsSinceEpoch,
      subcatID: transaction.subcategory.id.getOrCrash(),
      subcatName: transaction.subcategory.name.getOrCrash(),
      subcatCategoryId: transaction.subcategory.categoryID.getOrCrash(),
      payeeID: transaction.payee.id.getOrCrash(),
      payeeName: transaction.payee.name.getOrCrash(),
      accountID: transaction.account.id.getOrCrash(),
      accountName: transaction.account.name.getOrCrash(),
      accountBalance: transaction.account.balance.getOrCrash(),
    );
  }

  MoneyTransaction toDomain() {
    return MoneyTransaction(
      id: UniqueId.fromUniqueString(id),
      amount: Amount(amount.toString()),
      memo: Name(memo),
      date: DateTime.fromMillisecondsSinceEpoch(dateInMillisecondsSinceEpoch),
      isInitialTransaction: isInitialTransaction == 0,
      subcategory: Subcategory(
        id: UniqueId.fromUniqueString(subcatID),
        categoryID: UniqueId.fromUniqueString(subcatCategoryId),
        name: Name(subcatName),
      ),
      payee: Payee(
        id: UniqueId.fromUniqueString(payeeID),
        name: Name(payeeName),
      ),
      account: Account(
        id: UniqueId.fromUniqueString(accountID),
        name: Name(accountName),
        balance: Amount(accountBalance.toString()),
      ),
    );
  }

  factory MoneyTransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$MoneyTransactionDTOFromJson(json);
}
