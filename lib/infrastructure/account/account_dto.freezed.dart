// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountDTO _$AccountDTOFromJson(Map<String, dynamic> json) {
  return _AccountDTO.fromJson(json);
}

/// @nodoc
class _$AccountDTOTearOff {
  const _$AccountDTOTearOff();

  _AccountDTO call(
      {@JsonKey(ignore: true) required String id, required String name, required double balance}) {
    return _AccountDTO(
      id: id,
      name: name,
      balance: balance,
    );
  }

  AccountDTO fromJson(Map<String, Object> json) {
    return AccountDTO.fromJson(json);
  }
}

/// @nodoc
const $AccountDTO = _$AccountDTOTearOff();

/// @nodoc
mixin _$AccountDTO {
  @JsonKey(ignore: true)
  String get id => throw _privateConstructorUsedError; //Do not use id in database
  String get name => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDTOCopyWith<AccountDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDTOCopyWith<$Res> {
  factory $AccountDTOCopyWith(AccountDTO value, $Res Function(AccountDTO) then) =
      _$AccountDTOCopyWithImpl<$Res>;
  $Res call({@JsonKey(ignore: true) String id, String name, double balance});
}

/// @nodoc
class _$AccountDTOCopyWithImpl<$Res> implements $AccountDTOCopyWith<$Res> {
  _$AccountDTOCopyWithImpl(this._value, this._then);

  final AccountDTO _value;
  // ignore: unused_field
  final $Res Function(AccountDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? balance = freezed,
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
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$AccountDTOCopyWith<$Res> implements $AccountDTOCopyWith<$Res> {
  factory _$AccountDTOCopyWith(_AccountDTO value, $Res Function(_AccountDTO) then) =
      __$AccountDTOCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(ignore: true) String id, String name, double balance});
}

/// @nodoc
class __$AccountDTOCopyWithImpl<$Res> extends _$AccountDTOCopyWithImpl<$Res>
    implements _$AccountDTOCopyWith<$Res> {
  __$AccountDTOCopyWithImpl(_AccountDTO _value, $Res Function(_AccountDTO) _then)
      : super(_value, (v) => _then(v as _AccountDTO));

  @override
  _AccountDTO get _value => super._value as _AccountDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? balance = freezed,
  }) {
    return _then(_AccountDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountDTO extends _AccountDTO {
  const _$_AccountDTO(
      {@JsonKey(ignore: true) required this.id, required this.name, required this.balance})
      : super._();

  factory _$_AccountDTO.fromJson(Map<String, dynamic> json) => _$_$_AccountDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override //Do not use id in database
  final String name;
  @override
  final double balance;

  @override
  String toString() {
    return 'AccountDTO(id: $id, name: $name, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountDTO &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality().equals(other.balance, balance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(balance);

  @JsonKey(ignore: true)
  @override
  _$AccountDTOCopyWith<_AccountDTO> get copyWith =>
      __$AccountDTOCopyWithImpl<_AccountDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AccountDTOToJson(this);
  }
}

abstract class _AccountDTO extends AccountDTO {
  const factory _AccountDTO(
      {@JsonKey(ignore: true) required String id,
      required String name,
      required double balance}) = _$_AccountDTO;
  const _AccountDTO._() : super._();

  factory _AccountDTO.fromJson(Map<String, dynamic> json) = _$_AccountDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id => throw _privateConstructorUsedError;
  @override //Do not use id in database
  String get name => throw _privateConstructorUsedError;
  @override
  double get balance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AccountDTOCopyWith<_AccountDTO> get copyWith => throw _privateConstructorUsedError;
}
