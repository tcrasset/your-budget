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
  Subcategory? get subcategory => throw _privateConstructorUsedError;
  Either<Payee, Account> get receiver => throw _privateConstructorUsedError;
  Either<Payee, Account> get giver => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  Name get memo => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  MoneyTransactionType get type => throw _privateConstructorUsedError;

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
      Subcategory? subcategory,
      Either<Payee, Account> receiver,
      Either<Payee, Account> giver,
      Amount amount,
      Name memo,
      DateTime date,
      MoneyTransactionType type});

  $SubcategoryCopyWith<$Res>? get subcategory;
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
    Object? subcategory = freezed,
    Object? receiver = freezed,
    Object? giver = freezed,
    Object? amount = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcategory: subcategory == freezed
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory?,
      receiver: receiver == freezed
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as Either<Payee, Account>,
      giver: giver == freezed
          ? _value.giver
          : giver // ignore: cast_nullable_to_non_nullable
              as Either<Payee, Account>,
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
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MoneyTransactionType,
    ));
  }

  @override
  $SubcategoryCopyWith<$Res>? get subcategory {
    if (_value.subcategory == null) {
      return null;
    }

    return $SubcategoryCopyWith<$Res>(_value.subcategory!, (value) {
      return _then(_value.copyWith(subcategory: value));
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
  $Res call(
      {UniqueId id,
      Subcategory? subcategory,
      Either<Payee, Account> receiver,
      Either<Payee, Account> giver,
      Amount amount,
      Name memo,
      DateTime date,
      MoneyTransactionType type});

  @override
  $SubcategoryCopyWith<$Res>? get subcategory;
}

/// @nodoc
class __$$_MoneyTransactionCopyWithImpl<$Res>
    extends _$MoneyTransactionCopyWithImpl<$Res>
    implements _$$_MoneyTransactionCopyWith<$Res> {
  __$$_MoneyTransactionCopyWithImpl(
      _$_MoneyTransaction _value, $Res Function(_$_MoneyTransaction) _then)
      : super(_value, (v) => _then(v as _$_MoneyTransaction));

  @override
  _$_MoneyTransaction get _value => super._value as _$_MoneyTransaction;

  @override
  $Res call({
    Object? id = freezed,
    Object? subcategory = freezed,
    Object? receiver = freezed,
    Object? giver = freezed,
    Object? amount = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_MoneyTransaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcategory: subcategory == freezed
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory?,
      receiver: receiver == freezed
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as Either<Payee, Account>,
      giver: giver == freezed
          ? _value.giver
          : giver // ignore: cast_nullable_to_non_nullable
              as Either<Payee, Account>,
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
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MoneyTransactionType,
    ));
  }
}

/// @nodoc

class _$_MoneyTransaction extends _MoneyTransaction {
  const _$_MoneyTransaction(
      {required this.id,
      required this.subcategory,
      required this.receiver,
      required this.giver,
      required this.amount,
      required this.memo,
      required this.date,
      required this.type})
      : super._();

  @override
  final UniqueId id;
  @override
  final Subcategory? subcategory;
  @override
  final Either<Payee, Account> receiver;
  @override
  final Either<Payee, Account> giver;
  @override
  final Amount amount;
  @override
  final Name memo;
  @override
  final DateTime date;
  @override
  final MoneyTransactionType type;

  @override
  String toString() {
    return 'MoneyTransaction(id: $id, subcategory: $subcategory, receiver: $receiver, giver: $giver, amount: $amount, memo: $memo, date: $date, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoneyTransaction &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.subcategory, subcategory) &&
            const DeepCollectionEquality().equals(other.receiver, receiver) &&
            const DeepCollectionEquality().equals(other.giver, giver) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(subcategory),
      const DeepCollectionEquality().hash(receiver),
      const DeepCollectionEquality().hash(giver),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_MoneyTransactionCopyWith<_$_MoneyTransaction> get copyWith =>
      __$$_MoneyTransactionCopyWithImpl<_$_MoneyTransaction>(this, _$identity);
}

abstract class _MoneyTransaction extends MoneyTransaction {
  const factory _MoneyTransaction(
      {required final UniqueId id,
      required final Subcategory? subcategory,
      required final Either<Payee, Account> receiver,
      required final Either<Payee, Account> giver,
      required final Amount amount,
      required final Name memo,
      required final DateTime date,
      required final MoneyTransactionType type}) = _$_MoneyTransaction;
  const _MoneyTransaction._() : super._();

  @override
  UniqueId get id;
  @override
  Subcategory? get subcategory;
  @override
  Either<Payee, Account> get receiver;
  @override
  Either<Payee, Account> get giver;
  @override
  Amount get amount;
  @override
  Name get memo;
  @override
  DateTime get date;
  @override
  MoneyTransactionType get type;
  @override
  @JsonKey(ignore: true)
  _$$_MoneyTransactionCopyWith<_$_MoneyTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
