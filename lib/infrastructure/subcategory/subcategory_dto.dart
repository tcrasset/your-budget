// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/models/constants.dart';

part 'subcategory_dto.freezed.dart';
part 'subcategory_dto.g.dart';

@freezed
abstract class SubcategoryDTO implements _$SubcategoryDTO {
  const SubcategoryDTO._();

  const factory SubcategoryDTO({
    @JsonKey(name: DatabaseConstants.SUBCAT_ID) required String id,
    @JsonKey(name: DatabaseConstants.CAT_ID_OUTSIDE) required String categoryID,
    @JsonKey(name: DatabaseConstants.SUBCAT_NAME) required String name,
  }) = _SubcategoryDTO;

  factory SubcategoryDTO.fromDomain(Subcategory subcategory) {
    return SubcategoryDTO(
      id: subcategory.id.getOrCrash(),
      categoryID: subcategory.categoryID.getOrCrash(),
      name: subcategory.name.getOrCrash(),
    );
  }

  Subcategory toDomain() {
    return Subcategory(
      id: UniqueId.fromUniqueString(id),
      categoryID: UniqueId.fromUniqueString(categoryID),
      name: Name(name),
    );
  }

  factory SubcategoryDTO.fromJson(Map<String, dynamic> json) => _$SubcategoryDTOFromJson(json);
}
