// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

@freezed
abstract class AccountDTO implements _$AccountDTO {
  const AccountDTO._();

  const factory AccountDTO({
    @JsonKey(ignore: true) required String id, //Do not use id in database
    required String name,
    required double balance,
  }) = _AccountDTO;

  factory AccountDTO.fromDomain(Account account) {
    return AccountDTO(
      id: account.id.getOrCrash(), //Not used in database
      name: account.name.getOrCrash(),
      balance: account.balance.getOrCrash(),
    );
  }

  Account toDomain() {
    return Account(
      id: UniqueId.fromUniqueString(id!),
      name: Name(name),
      balance: Amount(balance.toString()),
    );
  }

  factory AccountDTO.fromJson(Map<String, dynamic> json) => _$AccountDTOFromJson(json);
  factory AccountDTO.fromSQL(Map<String, dynamic> json) {
    return AccountDTO.fromJson(json).copyWith(id: json["id"].toString());
  }
}
