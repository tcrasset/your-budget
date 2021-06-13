// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AccountDTO _$AccountDTOFromJson(Map<String, dynamic> json) {
  return _AccountDTO.fromJson(json);
}

/// @nodoc
class _$AccountDTOTearOff {
  const _$AccountDTOTearOff();

// ignore: unused_element
  _AccountDTO call(
      {@JsonKey(ignore: true) String id, @required String name, @required double balance}) {
    return _AccountDTO(
      id: id,
      name: name,
      balance: balance,
    );
  }

// ignore: unused_element
  AccountDTO fromJson(Map<String, Object> json) {
    return AccountDTO.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AccountDTO = _$AccountDTOTearOff();

/// @nodoc
mixin _$AccountDTO {
  @JsonKey(ignore: true)
  String get id; //Do not use id in database
  String get name;
  double get balance;

  Map<String, dynamic> toJson();
  $AccountDTOCopyWith<AccountDTO> get copyWith;
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
    Object id = freezed,
    Object name = freezed,
    Object balance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      balance: balance == freezed ? _value.balance : balance as double,
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
    Object id = freezed,
    Object name = freezed,
    Object balance = freezed,
  }) {
    return _then(_AccountDTO(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      balance: balance == freezed ? _value.balance : balance as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AccountDTO extends _AccountDTO {
  const _$_AccountDTO({@JsonKey(ignore: true) this.id, @required this.name, @required this.balance})
      : assert(name != null),
        assert(balance != null),
        super._();

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

  @override
  _$AccountDTOCopyWith<_AccountDTO> get copyWith =>
      __$AccountDTOCopyWithImpl<_AccountDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AccountDTOToJson(this);
  }
}

abstract class _AccountDTO extends AccountDTO {
  const _AccountDTO._() : super._();
  const factory _AccountDTO(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required double balance}) = _$_AccountDTO;

  factory _AccountDTO.fromJson(Map<String, dynamic> json) = _$_AccountDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override //Do not use id in database
  String get name;
  @override
  double get balance;
  @override
  _$AccountDTOCopyWith<_AccountDTO> get copyWith;
}
