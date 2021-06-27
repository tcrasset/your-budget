// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/models/utils.dart';

part 'payee_dto.freezed.dart';
part 'payee_dto.g.dart';

@freezed
abstract class PayeeDTO implements _$PayeeDTO {
  const PayeeDTO._();

  const factory PayeeDTO({
    @JsonKey(toJson: ignore, includeIfNull: false) required String id, //Do not use id in database
    required String name,
  }) = _PayeeDTO;

  factory PayeeDTO.fromDomain(Payee payee) {
    return PayeeDTO(
      id: payee.id.getOrCrash(), //Not used in database
      name: payee.name.getOrCrash(),
    );
  }

  Payee toDomain() {
    return Payee(
      id: UniqueId.fromUniqueString(id),
      name: Name(name),
    );
  }

  factory PayeeDTO.fromJson(Map<String, dynamic> json) => _$PayeeDTOFromJson(json);
  factory PayeeDTO.fromSQL(Map<String, dynamic> json) {
    return PayeeDTO.fromJson(json).copyWith(id: json["id"].toString());
  }
}
