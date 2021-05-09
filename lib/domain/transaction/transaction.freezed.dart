// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MoneyTransactionTearOff {
  const _$MoneyTransactionTearOff();

// ignore: unused_element
  _MoneyTransaction call(
      {@required UniqueId id,
      @required UniqueId subcatID,
      @required Name subcatName,
      @required UniqueId payeeID,
      @required Name payeeName,
      @required UniqueId accountID,
      @required Name accountName,
      @required Amount amount,
      @required Name memo,
      @required DateTime date}) {
    return _MoneyTransaction(
      id: id,
      subcatID: subcatID,
      subcatName: subcatName,
      payeeID: payeeID,
      payeeName: payeeName,
      accountID: accountID,
      accountName: accountName,
      amount: amount,
      memo: memo,
      date: date,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MoneyTransaction = _$MoneyTransactionTearOff();

/// @nodoc
mixin _$MoneyTransaction {
  UniqueId get id;
  UniqueId get subcatID;
  Name get subcatName;
  UniqueId get payeeID;
  Name get payeeName;
  UniqueId get accountID;
  Name get accountName;
  Amount get amount;
  Name get memo;
  DateTime get date;

  $MoneyTransactionCopyWith<MoneyTransaction> get copyWith;
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
      UniqueId payeeID,
      Name payeeName,
      UniqueId accountID,
      Name accountName,
      Amount amount,
      Name memo,
      DateTime date});
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
    Object id = freezed,
    Object subcatID = freezed,
    Object subcatName = freezed,
    Object payeeID = freezed,
    Object payeeName = freezed,
    Object accountID = freezed,
    Object accountName = freezed,
    Object amount = freezed,
    Object memo = freezed,
    Object date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      subcatID: subcatID == freezed ? _value.subcatID : subcatID as UniqueId,
      subcatName:
          subcatName == freezed ? _value.subcatName : subcatName as Name,
      payeeID: payeeID == freezed ? _value.payeeID : payeeID as UniqueId,
      payeeName: payeeName == freezed ? _value.payeeName : payeeName as Name,
      accountID:
          accountID == freezed ? _value.accountID : accountID as UniqueId,
      accountName:
          accountName == freezed ? _value.accountName : accountName as Name,
      amount: amount == freezed ? _value.amount : amount as Amount,
      memo: memo == freezed ? _value.memo : memo as Name,
      date: date == freezed ? _value.date : date as DateTime,
    ));
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
      UniqueId payeeID,
      Name payeeName,
      UniqueId accountID,
      Name accountName,
      Amount amount,
      Name memo,
      DateTime date});
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
    Object id = freezed,
    Object subcatID = freezed,
    Object subcatName = freezed,
    Object payeeID = freezed,
    Object payeeName = freezed,
    Object accountID = freezed,
    Object accountName = freezed,
    Object amount = freezed,
    Object memo = freezed,
    Object date = freezed,
  }) {
    return _then(_MoneyTransaction(
      id: id == freezed ? _value.id : id as UniqueId,
      subcatID: subcatID == freezed ? _value.subcatID : subcatID as UniqueId,
      subcatName:
          subcatName == freezed ? _value.subcatName : subcatName as Name,
      payeeID: payeeID == freezed ? _value.payeeID : payeeID as UniqueId,
      payeeName: payeeName == freezed ? _value.payeeName : payeeName as Name,
      accountID:
          accountID == freezed ? _value.accountID : accountID as UniqueId,
      accountName:
          accountName == freezed ? _value.accountName : accountName as Name,
      amount: amount == freezed ? _value.amount : amount as Amount,
      memo: memo == freezed ? _value.memo : memo as Name,
      date: date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
class _$_MoneyTransaction extends _MoneyTransaction {
  const _$_MoneyTransaction(
      {@required this.id,
      @required this.subcatID,
      @required this.subcatName,
      @required this.payeeID,
      @required this.payeeName,
      @required this.accountID,
      @required this.accountName,
      @required this.amount,
      @required this.memo,
      @required this.date})
      : assert(id != null),
        assert(subcatID != null),
        assert(subcatName != null),
        assert(payeeID != null),
        assert(payeeName != null),
        assert(accountID != null),
        assert(accountName != null),
        assert(amount != null),
        assert(memo != null),
        assert(date != null),
        super._();

  @override
  final UniqueId id;
  @override
  final UniqueId subcatID;
  @override
  final Name subcatName;
  @override
  final UniqueId payeeID;
  @override
  final Name payeeName;
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
    return 'MoneyTransaction(id: $id, subcatID: $subcatID, subcatName: $subcatName, payeeID: $payeeID, payeeName: $payeeName, accountID: $accountID, accountName: $accountName, amount: $amount, memo: $memo, date: $date)';
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
            (identical(other.payeeID, payeeID) ||
                const DeepCollectionEquality()
                    .equals(other.payeeID, payeeID)) &&
            (identical(other.payeeName, payeeName) ||
                const DeepCollectionEquality()
                    .equals(other.payeeName, payeeName)) &&
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
      const DeepCollectionEquality().hash(payeeID) ^
      const DeepCollectionEquality().hash(payeeName) ^
      const DeepCollectionEquality().hash(accountID) ^
      const DeepCollectionEquality().hash(accountName) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(date);

  @override
  _$MoneyTransactionCopyWith<_MoneyTransaction> get copyWith =>
      __$MoneyTransactionCopyWithImpl<_MoneyTransaction>(this, _$identity);
}

abstract class _MoneyTransaction extends MoneyTransaction {
  const _MoneyTransaction._() : super._();
  const factory _MoneyTransaction(
      {@required UniqueId id,
      @required UniqueId subcatID,
      @required Name subcatName,
      @required UniqueId payeeID,
      @required Name payeeName,
      @required UniqueId accountID,
      @required Name accountName,
      @required Amount amount,
      @required Name memo,
      @required DateTime date}) = _$_MoneyTransaction;

  @override
  UniqueId get id;
  @override
  UniqueId get subcatID;
  @override
  Name get subcatName;
  @override
  UniqueId get payeeID;
  @override
  Name get payeeName;
  @override
  UniqueId get accountID;
  @override
  Name get accountName;
  @override
  Amount get amount;
  @override
  Name get memo;
  @override
  DateTime get date;
  @override
  _$MoneyTransactionCopyWith<_MoneyTransaction> get copyWith;
}
