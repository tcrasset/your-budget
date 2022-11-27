// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bugetvalue_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BudgetValueDTO _$BudgetValueDTOFromJson(Map<String, dynamic> json) {
  return _BudgetValueDTO.fromJson(json);
}

/// @nodoc
mixin _$BudgetValueDTO {
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id =>
      throw _privateConstructorUsedError; //Do not use id in database
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  String get subcategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_BUDGETED)
  double get budgeted => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_AVAILABLE)
  double get available => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_MONTH)
  int get month => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_YEAR)
  int get year => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetValueDTOCopyWith<BudgetValueDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetValueDTOCopyWith<$Res> {
  factory $BudgetValueDTOCopyWith(
          BudgetValueDTO value, $Res Function(BudgetValueDTO) then) =
      _$BudgetValueDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          String subcategoryId,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_BUDGETED)
          double budgeted,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_AVAILABLE)
          double available,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_MONTH)
          int month,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_YEAR)
          int year});
}

/// @nodoc
class _$BudgetValueDTOCopyWithImpl<$Res>
    implements $BudgetValueDTOCopyWith<$Res> {
  _$BudgetValueDTOCopyWithImpl(this._value, this._then);

  final BudgetValueDTO _value;
  // ignore: unused_field
  final $Res Function(BudgetValueDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? subcategoryId = freezed,
    Object? budgeted = freezed,
    Object? available = freezed,
    Object? month = freezed,
    Object? year = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subcategoryId: subcategoryId == freezed
          ? _value.subcategoryId
          : subcategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      budgeted: budgeted == freezed
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as double,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as double,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_BudgetValueDTOCopyWith<$Res>
    implements $BudgetValueDTOCopyWith<$Res> {
  factory _$$_BudgetValueDTOCopyWith(
          _$_BudgetValueDTO value, $Res Function(_$_BudgetValueDTO) then) =
      __$$_BudgetValueDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          String subcategoryId,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_BUDGETED)
          double budgeted,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_AVAILABLE)
          double available,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_MONTH)
          int month,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_YEAR)
          int year});
}

/// @nodoc
class __$$_BudgetValueDTOCopyWithImpl<$Res>
    extends _$BudgetValueDTOCopyWithImpl<$Res>
    implements _$$_BudgetValueDTOCopyWith<$Res> {
  __$$_BudgetValueDTOCopyWithImpl(
      _$_BudgetValueDTO _value, $Res Function(_$_BudgetValueDTO) _then)
      : super(_value, (v) => _then(v as _$_BudgetValueDTO));

  @override
  _$_BudgetValueDTO get _value => super._value as _$_BudgetValueDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? subcategoryId = freezed,
    Object? budgeted = freezed,
    Object? available = freezed,
    Object? month = freezed,
    Object? year = freezed,
  }) {
    return _then(_$_BudgetValueDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subcategoryId: subcategoryId == freezed
          ? _value.subcategoryId
          : subcategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      budgeted: budgeted == freezed
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as double,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as double,
      month: month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BudgetValueDTO extends _BudgetValueDTO {
  const _$_BudgetValueDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required this.id,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          required this.subcategoryId,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_BUDGETED)
          required this.budgeted,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_AVAILABLE)
          required this.available,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_MONTH)
          required this.month,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_YEAR)
          required this.year})
      : super._();

  factory _$_BudgetValueDTO.fromJson(Map<String, dynamic> json) =>
      _$$_BudgetValueDTOFromJson(json);

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  final String id;
//Do not use id in database
  @override
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  final String subcategoryId;
  @override
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_BUDGETED)
  final double budgeted;
  @override
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_AVAILABLE)
  final double available;
  @override
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_MONTH)
  final int month;
  @override
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_YEAR)
  final int year;

  @override
  String toString() {
    return 'BudgetValueDTO(id: $id, subcategoryId: $subcategoryId, budgeted: $budgeted, available: $available, month: $month, year: $year)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetValueDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.subcategoryId, subcategoryId) &&
            const DeepCollectionEquality().equals(other.budgeted, budgeted) &&
            const DeepCollectionEquality().equals(other.available, available) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.year, year));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(subcategoryId),
      const DeepCollectionEquality().hash(budgeted),
      const DeepCollectionEquality().hash(available),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(year));

  @JsonKey(ignore: true)
  @override
  _$$_BudgetValueDTOCopyWith<_$_BudgetValueDTO> get copyWith =>
      __$$_BudgetValueDTOCopyWithImpl<_$_BudgetValueDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BudgetValueDTOToJson(
      this,
    );
  }
}

abstract class _BudgetValueDTO extends BudgetValueDTO {
  const factory _BudgetValueDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required final String id,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          required final String subcategoryId,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_BUDGETED)
          required final double budgeted,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_AVAILABLE)
          required final double available,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_MONTH)
          required final int month,
      @JsonKey(name: DatabaseConstants.BUDGET_VALUE_YEAR)
          required final int year}) = _$_BudgetValueDTO;
  const _BudgetValueDTO._() : super._();

  factory _BudgetValueDTO.fromJson(Map<String, dynamic> json) =
      _$_BudgetValueDTO.fromJson;

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id;
  @override //Do not use id in database
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  String get subcategoryId;
  @override
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_BUDGETED)
  double get budgeted;
  @override
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_AVAILABLE)
  double get available;
  @override
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_MONTH)
  int get month;
  @override
  @JsonKey(name: DatabaseConstants.BUDGET_VALUE_YEAR)
  int get year;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetValueDTOCopyWith<_$_BudgetValueDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
