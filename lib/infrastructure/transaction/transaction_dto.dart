// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/models/utils.dart';

part 'transaction_dto.freezed.dart';
part 'transaction_dto.g.dart';

@freezed
abstract class MoneyTransactionDTO implements _$MoneyTransactionDTO {
  const MoneyTransactionDTO._();

  const factory MoneyTransactionDTO({
    @JsonKey(toJson: ignore, includeIfNull: false) required String id,
    required String subcatID,
    required String subcatName,
    required String payeeID,
    required String payeeName,
    required String accountID,
    required String accountName,
    required double amount,
    required String memo,
    required int dateInMillisecondsSinceEpoch,
  }) = _TransactionDTO;

  factory MoneyTransactionDTO.fromDomain(MoneyTransaction transaction) {
    return MoneyTransactionDTO(
      id: transaction.id.getOrCrash(),
      subcatID: transaction.subcatID.getOrCrash(),
      subcatName: transaction.subcatName.getOrCrash(),
      payeeID: transaction.payeeID.getOrCrash(),
      payeeName: transaction.payeeName.getOrCrash(),
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
