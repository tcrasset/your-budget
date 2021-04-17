// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';

part 'subcategory_dto.freezed.dart';
part 'subcategory_dto.g.dart';

@freezed
abstract class SubcategoryDTO implements _$SubcategoryDTO {
  const SubcategoryDTO._();

  const factory SubcategoryDTO({
    @JsonKey(ignore: true) String id, //Do not use id in database
    @required String parentID,
    @required String name,
    @required double budgeted,
    @required double available,
  }) = _SubcategoryDTO;

  factory SubcategoryDTO.fromDomain(Subcategory subcategory) {
    return SubcategoryDTO(
      id: subcategory.id.getOrCrash(), //Not used in database
      parentID: subcategory.parentID.getOrCrash(),
      name: subcategory.name.getOrCrash(),
      budgeted: subcategory.budgeted.getOrCrash(),
      available: subcategory.available.getOrCrash(),
    );
  }

  Subcategory toDomain() {
    return Subcategory(
      id: UniqueId.fromUniqueString(id),
      parentID: UniqueId.fromUniqueString(parentID),
      name: Name(name),
      budgeted: Amount(budgeted.toString()),
      available: Amount(available.toString()),
    );
  }

  factory SubcategoryDTO.fromJson(Map<String, dynamic> json) => _$SubcategoryDTOFromJson(json);
  factory SubcategoryDTO.fromSQL(Map<String, dynamic> json) {
    return SubcategoryDTO.fromJson(json).copyWith(id: json["id"].toString());
  }
}
