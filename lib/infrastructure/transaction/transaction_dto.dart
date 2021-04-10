// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../models/money_transaction.dart';

part 'transaction_dto.freezed.dart';
part 'transaction_dto.g.dart';

@freezed
abstract class MoneyTransactionDTO implements _$MoneyTransactionDTO {
  const MoneyTransactionDTO._();

  const factory MoneyTransactionDTO({
    @JsonKey(ignore: true) int id,
    @required int subcatID,
    @required int payeeID,
    @required int accountID,
    @required double amount,
    @required String memo,
    @required int dateInMillisecondsSinceEpoch,
  }) = _MoneyTransactionDTO;

  factory MoneyTransactionDTO.fromDomain(MoneyTransaction transaction) {
    return MoneyTransactionDTO(
      id: transaction.id,
      subcatID: transaction.subcatID,
      payeeID: transaction.payeeID,
      accountID: transaction.accountID,
      amount: transaction.amount,
      memo: transaction.memo,
      dateInMillisecondsSinceEpoch: transaction.date.millisecondsSinceEpoch,
    );
  }

  MoneyTransaction toDomain() {
    return MoneyTransaction(
      id: id,
      subcatID: subcatID,
      payeeID: payeeID,
      accountID: accountID,
      amount: amount,
      memo: memo,
      date: DateTime.fromMillisecondsSinceEpoch(dateInMillisecondsSinceEpoch),
    );
  }

  factory MoneyTransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$MoneyTransactionDTOFromJson(json);
}
