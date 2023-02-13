// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountDTO _$AccountDTOFromJson(Map<String, dynamic> json) {
  return _AccountDTO.fromJson(json);
}

/// @nodoc
mixin _$AccountDTO {
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id =>
      throw _privateConstructorUsedError; //Do not use id in database
  @JsonKey(name: DatabaseConstants.ACCOUNT_NAME)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.ACCOUNT_BALANCE)
  double get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDTOCopyWith<AccountDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDTOCopyWith<$Res> {
  factory $AccountDTOCopyWith(
          AccountDTO value, $Res Function(AccountDTO) then) =
      _$AccountDTOCopyWithImpl<$Res, AccountDTO>;
  @useResult
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      @JsonKey(name: DatabaseConstants.ACCOUNT_NAME)
          String name,
      @JsonKey(name: DatabaseConstants.ACCOUNT_BALANCE)
          double balance});
}

/// @nodoc
class _$AccountDTOCopyWithImpl<$Res, $Val extends AccountDTO>
    implements $AccountDTOCopyWith<$Res> {
  _$AccountDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountDTOCopyWith<$Res>
    implements $AccountDTOCopyWith<$Res> {
  factory _$$_AccountDTOCopyWith(
          _$_AccountDTO value, $Res Function(_$_AccountDTO) then) =
      __$$_AccountDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      @JsonKey(name: DatabaseConstants.ACCOUNT_NAME)
          String name,
      @JsonKey(name: DatabaseConstants.ACCOUNT_BALANCE)
          double balance});
}

/// @nodoc
class __$$_AccountDTOCopyWithImpl<$Res>
    extends _$AccountDTOCopyWithImpl<$Res, _$_AccountDTO>
    implements _$$_AccountDTOCopyWith<$Res> {
  __$$_AccountDTOCopyWithImpl(
      _$_AccountDTO _value, $Res Function(_$_AccountDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
  }) {
    return _then(_$_AccountDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
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
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required this.id,
      @JsonKey(name: DatabaseConstants.ACCOUNT_NAME)
          required this.name,
      @JsonKey(name: DatabaseConstants.ACCOUNT_BALANCE)
          required this.balance})
      : super._();

  factory _$_AccountDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AccountDTOFromJson(json);

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  final String id;
//Do not use id in database
  @override
  @JsonKey(name: DatabaseConstants.ACCOUNT_NAME)
  final String name;
  @override
  @JsonKey(name: DatabaseConstants.ACCOUNT_BALANCE)
  final double balance;

  @override
  String toString() {
    return 'AccountDTO(id: $id, name: $name, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDTOCopyWith<_$_AccountDTO> get copyWith =>
      __$$_AccountDTOCopyWithImpl<_$_AccountDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountDTOToJson(
      this,
    );
  }
}

abstract class _AccountDTO extends AccountDTO {
  const factory _AccountDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required final String id,
      @JsonKey(name: DatabaseConstants.ACCOUNT_NAME)
          required final String name,
      @JsonKey(name: DatabaseConstants.ACCOUNT_BALANCE)
          required final double balance}) = _$_AccountDTO;
  const _AccountDTO._() : super._();

  factory _AccountDTO.fromJson(Map<String, dynamic> json) =
      _$_AccountDTO.fromJson;

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id;
  @override //Do not use id in database
  @JsonKey(name: DatabaseConstants.ACCOUNT_NAME)
  String get name;
  @override
  @JsonKey(name: DatabaseConstants.ACCOUNT_BALANCE)
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDTOCopyWith<_$_AccountDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
