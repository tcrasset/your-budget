// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoneyTransaction {
  UniqueId get id => throw _privateConstructorUsedError;
  Subcategory get subcategory => throw _privateConstructorUsedError;
  Payee get payee => throw _privateConstructorUsedError;
  Account get account => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  Name get memo => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  bool get isInitialTransaction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoneyTransactionCopyWith<MoneyTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyTransactionCopyWith<$Res> {
  factory $MoneyTransactionCopyWith(
          MoneyTransaction value, $Res Function(MoneyTransaction) then) =
      _$MoneyTransactionCopyWithImpl<$Res, MoneyTransaction>;
  @useResult
  $Res call(
      {UniqueId id,
      Subcategory subcategory,
      Payee payee,
      Account account,
      Amount amount,
      Name memo,
      DateTime date,
      bool isInitialTransaction});

  $SubcategoryCopyWith<$Res> get subcategory;
  $PayeeCopyWith<$Res> get payee;
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class _$MoneyTransactionCopyWithImpl<$Res, $Val extends MoneyTransaction>
    implements $MoneyTransactionCopyWith<$Res> {
  _$MoneyTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subcategory = null,
    Object? payee = null,
    Object? account = null,
    Object? amount = null,
    Object? memo = null,
    Object? date = null,
    Object? isInitialTransaction = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
      payee: null == payee
          ? _value.payee
          : payee // ignore: cast_nullable_to_non_nullable
              as Payee,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Name,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isInitialTransaction: null == isInitialTransaction
          ? _value.isInitialTransaction
          : isInitialTransaction // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubcategoryCopyWith<$Res> get subcategory {
    return $SubcategoryCopyWith<$Res>(_value.subcategory, (value) {
      return _then(_value.copyWith(subcategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PayeeCopyWith<$Res> get payee {
    return $PayeeCopyWith<$Res>(_value.payee, (value) {
      return _then(_value.copyWith(payee: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MoneyTransactionCopyWith<$Res>
    implements $MoneyTransactionCopyWith<$Res> {
  factory _$$_MoneyTransactionCopyWith(
          _$_MoneyTransaction value, $Res Function(_$_MoneyTransaction) then) =
      __$$_MoneyTransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Subcategory subcategory,
      Payee payee,
      Account account,
      Amount amount,
      Name memo,
      DateTime date,
      bool isInitialTransaction});

  @override
  $SubcategoryCopyWith<$Res> get subcategory;
  @override
  $PayeeCopyWith<$Res> get payee;
  @override
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$_MoneyTransactionCopyWithImpl<$Res>
    extends _$MoneyTransactionCopyWithImpl<$Res, _$_MoneyTransaction>
    implements _$$_MoneyTransactionCopyWith<$Res> {
  __$$_MoneyTransactionCopyWithImpl(
      _$_MoneyTransaction _value, $Res Function(_$_MoneyTransaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subcategory = null,
    Object? payee = null,
    Object? account = null,
    Object? amount = null,
    Object? memo = null,
    Object? date = null,
    Object? isInitialTransaction = null,
  }) {
    return _then(_$_MoneyTransaction(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
      payee: null == payee
          ? _value.payee
          : payee // ignore: cast_nullable_to_non_nullable
              as Payee,
      account: null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Name,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isInitialTransaction: null == isInitialTransaction
          ? _value.isInitialTransaction
          : isInitialTransaction // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MoneyTransaction extends _MoneyTransaction {
  const _$_MoneyTransaction(
      {required this.id,
      required this.subcategory,
      required this.payee,
      required this.account,
      required this.amount,
      required this.memo,
      required this.date,
      this.isInitialTransaction = false})
      : super._();

  @override
  final UniqueId id;
  @override
  final Subcategory subcategory;
  @override
  final Payee payee;
  @override
  final Account account;
  @override
  final Amount amount;
  @override
  final Name memo;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final bool isInitialTransaction;

  @override
  String toString() {
    return 'MoneyTransaction(id: $id, subcategory: $subcategory, payee: $payee, account: $account, amount: $amount, memo: $memo, date: $date, isInitialTransaction: $isInitialTransaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoneyTransaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.payee, payee) || other.payee == payee) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isInitialTransaction, isInitialTransaction) ||
                other.isInitialTransaction == isInitialTransaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, subcategory, payee, account,
      amount, memo, date, isInitialTransaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoneyTransactionCopyWith<_$_MoneyTransaction> get copyWith =>
      __$$_MoneyTransactionCopyWithImpl<_$_MoneyTransaction>(this, _$identity);
}

abstract class _MoneyTransaction extends MoneyTransaction {
  const factory _MoneyTransaction(
      {required final UniqueId id,
      required final Subcategory subcategory,
      required final Payee payee,
      required final Account account,
      required final Amount amount,
      required final Name memo,
      required final DateTime date,
      final bool isInitialTransaction}) = _$_MoneyTransaction;
  const _MoneyTransaction._() : super._();

  @override
  UniqueId get id;
  @override
  Subcategory get subcategory;
  @override
  Payee get payee;
  @override
  Account get account;
  @override
  Amount get amount;
  @override
  Name get memo;
  @override
  DateTime get date;
  @override
  bool get isInitialTransaction;
  @override
  @JsonKey(ignore: true)
  _$$_MoneyTransactionCopyWith<_$_MoneyTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
