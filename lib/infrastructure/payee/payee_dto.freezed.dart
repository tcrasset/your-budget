// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payee_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PayeeDTO _$PayeeDTOFromJson(Map<String, dynamic> json) {
  return _PayeeDTO.fromJson(json);
}

/// @nodoc
class _$PayeeDTOTearOff {
  const _$PayeeDTOTearOff();

  _PayeeDTO call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required String id,
      @JsonKey(name: DatabaseConstants.PAYEE_NAME)
          required String name}) {
    return _PayeeDTO(
      id: id,
      name: name,
    );
  }

  PayeeDTO fromJson(Map<String, Object> json) {
    return PayeeDTO.fromJson(json);
  }
}

/// @nodoc
const $PayeeDTO = _$PayeeDTOTearOff();

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
abstract class _$PayeeDTOCopyWith<$Res> implements $PayeeDTOCopyWith<$Res> {
  factory _$PayeeDTOCopyWith(_PayeeDTO value, $Res Function(_PayeeDTO) then) =
      __$PayeeDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      @JsonKey(name: DatabaseConstants.PAYEE_NAME)
          String name});
}

/// @nodoc
class __$PayeeDTOCopyWithImpl<$Res> extends _$PayeeDTOCopyWithImpl<$Res>
    implements _$PayeeDTOCopyWith<$Res> {
  __$PayeeDTOCopyWithImpl(_PayeeDTO _value, $Res Function(_PayeeDTO) _then)
      : super(_value, (v) => _then(v as _PayeeDTO));

  @override
  _PayeeDTO get _value => super._value as _PayeeDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_PayeeDTO(
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
      _$_$_PayeeDTOFromJson(json);

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  final String id;
  @override //Do not use id in database
  @JsonKey(name: DatabaseConstants.PAYEE_NAME)
  final String name;

  @override
  String toString() {
    return 'PayeeDTO(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PayeeDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$PayeeDTOCopyWith<_PayeeDTO> get copyWith =>
      __$PayeeDTOCopyWithImpl<_PayeeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PayeeDTOToJson(this);
  }
}

abstract class _PayeeDTO extends PayeeDTO {
  const factory _PayeeDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required String id,
      @JsonKey(name: DatabaseConstants.PAYEE_NAME)
          required String name}) = _$_PayeeDTO;
  const _PayeeDTO._() : super._();

  factory _PayeeDTO.fromJson(Map<String, dynamic> json) = _$_PayeeDTO.fromJson;

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id => throw _privateConstructorUsedError;
  @override //Do not use id in database
  @JsonKey(name: DatabaseConstants.PAYEE_NAME)
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PayeeDTOCopyWith<_PayeeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
