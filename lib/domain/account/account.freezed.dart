// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AccountTearOff {
  const _$AccountTearOff();

// ignore: unused_element
  _NewAccount call(
      {@required UniqueId id, @required Name name, @required Amount balance}) {
    return _NewAccount(
      id: id,
      name: name,
      balance: balance,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Account = _$AccountTearOff();

/// @nodoc
mixin _$Account {
  UniqueId get id;
  Name get name;
  Amount get balance;

  $AccountCopyWith<Account> get copyWith;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res>;
  $Res call({UniqueId id, Name name, Amount balance});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  final Account _value;
  // ignore: unused_field
  final $Res Function(Account) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object balance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as Name,
      balance: balance == freezed ? _value.balance : balance as Amount,
    ));
  }
}

/// @nodoc
abstract class _$NewAccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$NewAccountCopyWith(
          _NewAccount value, $Res Function(_NewAccount) then) =
      __$NewAccountCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, Name name, Amount balance});
}

/// @nodoc
class __$NewAccountCopyWithImpl<$Res> extends _$AccountCopyWithImpl<$Res>
    implements _$NewAccountCopyWith<$Res> {
  __$NewAccountCopyWithImpl(
      _NewAccount _value, $Res Function(_NewAccount) _then)
      : super(_value, (v) => _then(v as _NewAccount));

  @override
  _NewAccount get _value => super._value as _NewAccount;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object balance = freezed,
  }) {
    return _then(_NewAccount(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as Name,
      balance: balance == freezed ? _value.balance : balance as Amount,
    ));
  }
}

/// @nodoc
class _$_NewAccount extends _NewAccount {
  const _$_NewAccount(
      {@required this.id, @required this.name, @required this.balance})
      : assert(id != null),
        assert(name != null),
        assert(balance != null),
        super._();

  @override
  final UniqueId id;
  @override
  final Name name;
  @override
  final Amount balance;

  @override
  String toString() {
    return 'Account(id: $id, name: $name, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewAccount &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
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
  _$NewAccountCopyWith<_NewAccount> get copyWith =>
      __$NewAccountCopyWithImpl<_NewAccount>(this, _$identity);
}

abstract class _NewAccount extends Account {
  const _NewAccount._() : super._();
  const factory _NewAccount(
      {@required UniqueId id,
      @required Name name,
      @required Amount balance}) = _$_NewAccount;

  @override
  UniqueId get id;
  @override
  Name get name;
  @override
  Amount get balance;
  @override
  _$NewAccountCopyWith<_NewAccount> get copyWith;
}
