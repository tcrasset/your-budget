// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payee_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PayeeDTO _$PayeeDTOFromJson(Map<String, dynamic> json) {
  return _PayeeDTO.fromJson(json);
}

/// @nodoc
mixin _$PayeeDTO {
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id =>
      throw _privateConstructorUsedError; //Do not use id in database
  @JsonKey(name: DatabaseConstants.PAYEE_NAME)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayeeDTOCopyWith<PayeeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayeeDTOCopyWith<$Res> {
  factory $PayeeDTOCopyWith(PayeeDTO value, $Res Function(PayeeDTO) then) =
      _$PayeeDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      @JsonKey(name: DatabaseConstants.PAYEE_NAME)
          String name});
}

/// @nodoc
class _$PayeeDTOCopyWithImpl<$Res> implements $PayeeDTOCopyWith<$Res> {
  _$PayeeDTOCopyWithImpl(this._value, this._then);

  final PayeeDTO _value;
  // ignore: unused_field
  final $Res Function(PayeeDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PayeeDTOCopyWith<$Res> implements $PayeeDTOCopyWith<$Res> {
  factory _$$_PayeeDTOCopyWith(
          _$_PayeeDTO value, $Res Function(_$_PayeeDTO) then) =
      __$$_PayeeDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      @JsonKey(name: DatabaseConstants.PAYEE_NAME)
          String name});
}

/// @nodoc
class __$$_PayeeDTOCopyWithImpl<$Res> extends _$PayeeDTOCopyWithImpl<$Res>
    implements _$$_PayeeDTOCopyWith<$Res> {
  __$$_PayeeDTOCopyWithImpl(
      _$_PayeeDTO _value, $Res Function(_$_PayeeDTO) _then)
      : super(_value, (v) => _then(v as _$_PayeeDTO));

  @override
  _$_PayeeDTO get _value => super._value as _$_PayeeDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_PayeeDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PayeeDTO extends _PayeeDTO {
  const _$_PayeeDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required this.id,
      @JsonKey(name: DatabaseConstants.PAYEE_NAME)
          required this.name})
      : super._();

  factory _$_PayeeDTO.fromJson(Map<String, dynamic> json) =>
      _$$_PayeeDTOFromJson(json);

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  final String id;
//Do not use id in database
  @override
  @JsonKey(name: DatabaseConstants.PAYEE_NAME)
  final String name;

  @override
  String toString() {
    return 'PayeeDTO(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PayeeDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_PayeeDTOCopyWith<_$_PayeeDTO> get copyWith =>
      __$$_PayeeDTOCopyWithImpl<_$_PayeeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PayeeDTOToJson(
      this,
    );
  }
}

abstract class _PayeeDTO extends PayeeDTO {
  const factory _PayeeDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required final String id,
      @JsonKey(name: DatabaseConstants.PAYEE_NAME)
          required final String name}) = _$_PayeeDTO;
  const _PayeeDTO._() : super._();

  factory _PayeeDTO.fromJson(Map<String, dynamic> json) = _$_PayeeDTO.fromJson;

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id;
  @override //Do not use id in database
  @JsonKey(name: DatabaseConstants.PAYEE_NAME)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PayeeDTOCopyWith<_$_PayeeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
