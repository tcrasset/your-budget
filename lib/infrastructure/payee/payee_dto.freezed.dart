// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'payee_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PayeeDTO _$PayeeDTOFromJson(Map<String, dynamic> json) {
  return _PayeeDTO.fromJson(json);
}

/// @nodoc
class _$PayeeDTOTearOff {
  const _$PayeeDTOTearOff();

// ignore: unused_element
  _PayeeDTO call({@JsonKey(ignore: true) String id, @required String name}) {
    return _PayeeDTO(
      id: id,
      name: name,
    );
  }

// ignore: unused_element
  PayeeDTO fromJson(Map<String, Object> json) {
    return PayeeDTO.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PayeeDTO = _$PayeeDTOTearOff();

/// @nodoc
mixin _$PayeeDTO {
  @JsonKey(ignore: true)
  String get id; //Do not use id in database
  String get name;

  Map<String, dynamic> toJson();
  $PayeeDTOCopyWith<PayeeDTO> get copyWith;
}

/// @nodoc
abstract class $PayeeDTOCopyWith<$Res> {
  factory $PayeeDTOCopyWith(PayeeDTO value, $Res Function(PayeeDTO) then) =
      _$PayeeDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(ignore: true) String id, String name});
}

/// @nodoc
class _$PayeeDTOCopyWithImpl<$Res> implements $PayeeDTOCopyWith<$Res> {
  _$PayeeDTOCopyWithImpl(this._value, this._then);

  final PayeeDTO _value;
  // ignore: unused_field
  final $Res Function(PayeeDTO) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
abstract class _$PayeeDTOCopyWith<$Res> implements $PayeeDTOCopyWith<$Res> {
  factory _$PayeeDTOCopyWith(_PayeeDTO value, $Res Function(_PayeeDTO) then) =
      __$PayeeDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(ignore: true) String id, String name});
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
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_PayeeDTO(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PayeeDTO extends _PayeeDTO {
  const _$_PayeeDTO({@JsonKey(ignore: true) this.id, @required this.name})
      : assert(name != null),
        super._();

  factory _$_PayeeDTO.fromJson(Map<String, dynamic> json) => _$_$_PayeeDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override //Do not use id in database
  final String name;

  @override
  String toString() {
    return 'PayeeDTO(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PayeeDTO &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$PayeeDTOCopyWith<_PayeeDTO> get copyWith =>
      __$PayeeDTOCopyWithImpl<_PayeeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PayeeDTOToJson(this);
  }
}

abstract class _PayeeDTO extends PayeeDTO {
  const _PayeeDTO._() : super._();
  const factory _PayeeDTO({@JsonKey(ignore: true) String id, @required String name}) = _$_PayeeDTO;

  factory _PayeeDTO.fromJson(Map<String, dynamic> json) = _$_PayeeDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override //Do not use id in database
  String get name;
  @override
  _$PayeeDTOCopyWith<_PayeeDTO> get copyWith;
}
