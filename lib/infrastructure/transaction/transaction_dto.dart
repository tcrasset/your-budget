// Flutter imports:
// ignore_for_file: invalid_annotation_target

import 'package:dartz/dartz.dart';
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
    @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_TYPE)
        required String type,
    @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
        required String? subcatID, // optional because most transactions do not have subcategory
    @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
        required String? subcatName, // optional because most transactions do not have subcategory
    @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
        required String? subcatCategoryId, // optional because most transactions do not have subcat
    @JsonKey(toJson: ignore, includeIfNull: false)
        required String receiverName,
    @JsonKey(toJson: ignore, includeIfNull: false)
        required double? receiverBalance, // optional because payee does not have balance
    @JsonKey(fromJson: convertToString)
        required String receiverId,
    @JsonKey(toJson: ignore, includeIfNull: false)
        required String giverName,
    @JsonKey(toJson: ignore, includeIfNull: false)
        required double? giverBalance, // optional because payee does not have balance
    @JsonKey(fromJson: convertToString)
        required String giverId,
  }) = _TransactionDTO;

  factory MoneyTransactionDTO.fromDomain(MoneyTransaction transaction) {
    switch (transaction.type) {
      case MoneyTransactionType.toBeBudgeted:
      // Fall through to MoneyTransactionType.initial

      // On a to be budgeted transaction, the money is deposited
      // into an account as well as To Be Budgeted.
      // The subcategory is null.

      case MoneyTransactionType.initial:
        // On an initial transaction, the money is deposited
        // into a receiver (Account) as well as To Be Budgeted.
        // The giver (Payee) is a special "Starting Balance" payee.
        // The subcategory is null.
        return MoneyTransactionDTO(
          id: transaction.id.getOrCrash(),
          amount: transaction.amount.getOrCrash(),
          memo: transaction.memo.getOrCrash(),
          type: transaction.type.value,
          dateInMillisecondsSinceEpoch: transaction.date.millisecondsSinceEpoch,
          subcatID: null,
          subcatName: null,
          subcatCategoryId: null,
          receiverId: transaction.receiverId.getOrCrash(),
          receiverName: transaction.receiverName.getOrCrash(),
          receiverBalance:
              transaction.receiverBalance.fold(() => throw Exception, (a) => a.getOrCrash()),
          giverId: transaction.giverId.getOrCrash(),
          giverName: transaction.giverName.getOrCrash(),
          giverBalance: null,
        );
      case MoneyTransactionType.subcategory:
        // On a subcategory transaction, the receiver is a Payee,
        // as these transactions are outflowing from a giver (account),
        // e.g. there is an expense from our account to a specific
        // service, a grocery store, or an individual.
        return MoneyTransactionDTO(
          id: transaction.id.getOrCrash(),
          amount: transaction.amount.getOrCrash(),
          memo: transaction.memo.getOrCrash(),
          type: transaction.type.value,
          dateInMillisecondsSinceEpoch: transaction.date.millisecondsSinceEpoch,
          subcatID: transaction.subcategory!.id.getOrCrash(),
          subcatName: transaction.subcategory!.name.getOrCrash(),
          subcatCategoryId: transaction.subcategory!.categoryID.getOrCrash(),
          receiverId: transaction.receiverId.getOrCrash(),
          receiverName: transaction.receiverName.getOrCrash(),
          receiverBalance: null,
          giverId: transaction.giverId.getOrCrash(),
          giverName: transaction.giverName.getOrCrash(),
          giverBalance: transaction.giverBalance.fold(() => throw Exception, (a) => a.getOrCrash()),
        );
      case MoneyTransactionType.betweenAccount:
        return MoneyTransactionDTO(
          id: transaction.id.getOrCrash(),
          amount: transaction.amount.getOrCrash(),
          memo: transaction.memo.getOrCrash(),
          type: transaction.type.value,
          dateInMillisecondsSinceEpoch: transaction.date.millisecondsSinceEpoch,
          subcatID: null,
          subcatName: null,
          subcatCategoryId: null,
          receiverId: transaction.receiverId.getOrCrash(),
          receiverName: transaction.receiverName.getOrCrash(),
          receiverBalance:
              transaction.receiverBalance.fold(() => throw Exception, (a) => a.getOrCrash()),
          giverId: transaction.giverId.getOrCrash(),
          giverName: transaction.giverName.getOrCrash(),
          giverBalance: transaction.giverBalance.fold(() => throw Exception, (a) => a.getOrCrash()),
        );
      default:
        throw Exception("Invalid MoneyTransactionType ${transaction.type}");
    }
  }

  MoneyTransaction toDomain() {
    final Subcategory? subcategory = subcatID == null
        ? null
        : Subcategory(
            id: UniqueId.fromUniqueString(subcatID!),
            categoryID: UniqueId.fromUniqueString(subcatCategoryId!),
            name: Name(subcatName!),
          );

    switch (MoneyTransactionType.fromValue(type)) {
      case MoneyTransactionType.toBeBudgeted:
      case MoneyTransactionType.initial:
        return MoneyTransaction(
          id: UniqueId.fromUniqueString(this.id),
          amount: Amount(amount.toString()),
          memo: Name(memo),
          date: DateTime.fromMillisecondsSinceEpoch(dateInMillisecondsSinceEpoch),
          type: MoneyTransactionType.fromValue(type),
          subcategory: subcategory,
          giver: Left(Payee(
            id: UniqueId.fromUniqueString(giverId),
            name: Name(giverName),
          )),
          receiver: Right(
            Account(
              id: UniqueId.fromUniqueString(receiverId),
              name: Name(receiverName),
              balance: Amount.fromDouble(receiverBalance!),
            ),
          ),
        );
      case MoneyTransactionType.subcategory:
        return MoneyTransaction(
          id: UniqueId.fromUniqueString(this.id),
          amount: Amount(amount.toString()),
          memo: Name(memo),
          date: DateTime.fromMillisecondsSinceEpoch(dateInMillisecondsSinceEpoch),
          type: MoneyTransactionType.fromValue(type),
          subcategory: subcategory,
          receiver: Left(
            Payee(
              id: UniqueId.fromUniqueString(receiverId),
              name: Name(receiverName),
            ),
          ),
          giver: Right(
            Account(
              id: UniqueId.fromUniqueString(giverId),
              name: Name(giverName),
              balance: Amount.fromDouble(giverBalance!),
            ),
          ),
        );
      case MoneyTransactionType.betweenAccount:
        return MoneyTransaction(
          id: UniqueId.fromUniqueString(this.id),
          amount: Amount(amount.toString()),
          memo: Name(memo),
          date: DateTime.fromMillisecondsSinceEpoch(dateInMillisecondsSinceEpoch),
          type: MoneyTransactionType.fromValue(type),
          subcategory: subcategory,
          receiver: Right(
            Account(
              id: UniqueId.fromUniqueString(receiverId),
              name: Name(receiverName),
              balance: Amount.fromDouble(receiverBalance!),
            ),
          ),
          giver: Right(
            Account(
              id: UniqueId.fromUniqueString(giverId),
              name: Name(giverName),
              balance: Amount.fromDouble(giverBalance!),
            ),
          ),
        );
      default:
        throw Exception("Invalid MoneyTransactionType ${type}");
    }
  }

  factory MoneyTransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$MoneyTransactionDTOFromJson(json);
}
