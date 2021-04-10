// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../models/account.dart';

part 'account_dto.freezed.dart';
part 'account_dto.g.dart';

@freezed
abstract class AccountDTO implements _$AccountDTO {
  const AccountDTO._();

  const factory AccountDTO({
    @JsonKey(ignore: true) int id,
    @required String name,
    @required double balance,
  }) = _AccountDTO;

  factory AccountDTO.fromDomain(Account account) {
    return AccountDTO(
      id: account.id,
      name: account.name,
      balance: account.balance,
    );
  }

  Account toDomain() {
    return Account(
      id: id,
      name: name,
      balance: balance,
    );
  }

  factory AccountDTO.fromJson(Map<String, dynamic> json) => _$AccountDTOFromJson(json);
}
