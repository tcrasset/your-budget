// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/category/category.dart';

// Project imports:
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
abstract class CategoryDTO implements _$CategoryDTO {
  const CategoryDTO._();

  const factory CategoryDTO({
    @JsonKey(name: DatabaseConstants.CATEGORY_ID) required String id,
    @JsonKey(name: DatabaseConstants.CATEGORY_NAME) required String name,
  }) = _CategoryDTO;

  factory CategoryDTO.fromDomain(Category category) {
    return CategoryDTO(
      id: category.id.getOrCrash(),
      name: category.name.getOrCrash(),
    );
  }

  Category toDomain() {
    return Category(
      id: UniqueId.fromUniqueString(id),
      name: Name(name),
    );
  }

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);
}
