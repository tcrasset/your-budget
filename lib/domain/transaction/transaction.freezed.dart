// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MoneyTransactionTearOff {
  const _$MoneyTransactionTearOff();

  _MoneyTransaction call(
      {required UniqueId id,
      required UniqueId subcatID,
      required Name subcatName,
      required Payee payee,
      required UniqueId accountID,
      required Name accountName,
      required Amount amount,
      required Name memo,
      required DateTime date}) {
    return _MoneyTransaction(
      id: id,
      subcatID: subcatID,
      subcatName: subcatName,
      payee: payee,
      accountID: accountID,
      accountName: accountName,
      amount: amount,
      memo: memo,
      date: date,
    );
  }
}

/// @nodoc
const $MoneyTransaction = _$MoneyTransactionTearOff();

/// @nodoc
mixin _$MoneyTransaction {
  UniqueId get id => throw _privateConstructorUsedError;
  UniqueId get subcatID => throw _privateConstructorUsedError;
  Name get subcatName => throw _privateConstructorUsedError;
  Payee get payee => throw _privateConstructorUsedError;
  UniqueId get accountID => throw _privateConstructorUsedError;
  Name get accountName => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  Name get memo => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoneyTransactionCopyWith<MoneyTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyTransactionCopyWith<$Res> {
  factory $MoneyTransactionCopyWith(
          MoneyTransaction value, $Res Function(MoneyTransaction) then) =
      _$MoneyTransactionCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      UniqueId subcatID,
      Name subcatName,
      Payee payee,
      UniqueId accountID,
      Name accountName,
      Amount amount,
      Name memo,
      DateTime date});

  $PayeeCopyWith<$Res> get payee;
}

/// @nodoc
class _$MoneyTransactionCopyWithImpl<$Res>
    implements $MoneyTransactionCopyWith<$Res> {
  _$MoneyTransactionCopyWithImpl(this._value, this._then);

  final MoneyTransaction _value;
  // ignore: unused_field
  final $Res Function(MoneyTransaction) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? payee = freezed,
    Object? accountID = freezed,
    Object? accountName = freezed,
    Object? amount = freezed,
    Object? memo = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcatID: subcatID == freezed
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcatName: subcatName == freezed
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as Name,
      payee: payee == freezed
          ? _value.payee
          : payee // ignore: cast_nullable_to_non_nullable
              as Payee,
      accountID: accountID == freezed
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as Name,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Name,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $PayeeCopyWith<$Res> get payee {
    return $PayeeCopyWith<$Res>(_value.payee, (value) {
      return _then(_value.copyWith(payee: value));
    });
  }
}

/// @nodoc
abstract class _$MoneyTransactionCopyWith<$Res>
    implements $MoneyTransactionCopyWith<$Res> {
  factory _$MoneyTransactionCopyWith(
          _MoneyTransaction value, $Res Function(_MoneyTransaction) then) =
      __$MoneyTransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      UniqueId subcatID,
      Name subcatName,
      Payee payee,
      UniqueId accountID,
      Name accountName,
      Amount amount,
      Name memo,
      DateTime date});

  @override
  $PayeeCopyWith<$Res> get payee;
}

/// @nodoc
class __$MoneyTransactionCopyWithImpl<$Res>
    extends _$MoneyTransactionCopyWithImpl<$Res>
    implements _$MoneyTransactionCopyWith<$Res> {
  __$MoneyTransactionCopyWithImpl(
      _MoneyTransaction _value, $Res Function(_MoneyTransaction) _then)
      : super(_value, (v) => _then(v as _MoneyTransaction));

  @override
  _MoneyTransaction get _value => super._value as _MoneyTransaction;

  @override
  $Res call({
    Object? id = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? payee = freezed,
    Object? accountID = freezed,
    Object? accountName = freezed,
    Object? amount = freezed,
    Object? memo = freezed,
    Object? date = freezed,
  }) {
    return _then(_MoneyTransaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcatID: subcatID == freezed
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcatName: subcatName == freezed
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as Name,
      payee: payee == freezed
          ? _value.payee
          : payee // ignore: cast_nullable_to_non_nullable
              as Payee,
      accountID: accountID == freezed
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as Name,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Name,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_MoneyTransaction extends _MoneyTransaction {
  const _$_MoneyTransaction(
      {required this.id,
      required this.subcatID,
      required this.subcatName,
      required this.payee,
      required this.accountID,
      required this.accountName,
      required this.amount,
      required this.memo,
      required this.date})
      : super._();

  @override
  final UniqueId id;
  @override
  final UniqueId subcatID;
  @override
  final Name subcatName;
  @override
  final Payee payee;
  @override
  final UniqueId accountID;
  @override
  final Name accountName;
  @override
  final Amount amount;
  @override
  final Name memo;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'MoneyTransaction(id: $id, subcatID: $subcatID, subcatName: $subcatName, payee: $payee, accountID: $accountID, accountName: $accountName, amount: $amount, memo: $memo, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MoneyTransaction &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.subcatID, subcatID) ||
                const DeepCollectionEquality()
                    .equals(other.subcatID, subcatID)) &&
            (identical(other.subcatName, subcatName) ||
                const DeepCollectionEquality()
                    .equals(other.subcatName, subcatName)) &&
            (identical(other.payee, payee) ||
                const DeepCollectionEquality().equals(other.payee, payee)) &&
            (identical(other.accountID, accountID) ||
                const DeepCollectionEquality()
                    .equals(other.accountID, accountID)) &&
            (identical(other.accountName, accountName) ||
                const DeepCollectionEquality()
                    .equals(other.accountName, accountName)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(subcatID) ^
      const DeepCollectionEquality().hash(subcatName) ^
      const DeepCollectionEquality().hash(payee) ^
      const DeepCollectionEquality().hash(accountID) ^
      const DeepCollectionEquality().hash(accountName) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$MoneyTransactionCopyWith<_MoneyTransaction> get copyWith =>
      __$MoneyTransactionCopyWithImpl<_MoneyTransaction>(this, _$identity);
}

abstract class _MoneyTransaction extends MoneyTransaction {
  const factory _MoneyTransaction(
      {required UniqueId id,
      required UniqueId subcatID,
      required Name subcatName,
      required Payee payee,
      required UniqueId accountID,
      required Name accountName,
      required Amount amount,
      required Name memo,
      required DateTime date}) = _$_MoneyTransaction;
  const _MoneyTransaction._() : super._();

  @override
  UniqueId get id => throw _privateConstructorUsedError;
  @override
  UniqueId get subcatID => throw _privateConstructorUsedError;
  @override
  Name get subcatName => throw _privateConstructorUsedError;
  @override
  Payee get payee => throw _privateConstructorUsedError;
  @override
  UniqueId get accountID => throw _privateConstructorUsedError;
  @override
  Name get accountName => throw _privateConstructorUsedError;
  @override
  Amount get amount => throw _privateConstructorUsedError;
  @override
  Name get memo => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MoneyTransactionCopyWith<_MoneyTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
