// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'budgetvalue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BudgetValue {
  UniqueId get id => throw _privateConstructorUsedError;
  UniqueId get subcategoryId => throw _privateConstructorUsedError;
  Amount get budgeted => throw _privateConstructorUsedError;
  Amount get available => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetValueCopyWith<BudgetValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetValueCopyWith<$Res> {
  factory $BudgetValueCopyWith(
          BudgetValue value, $Res Function(BudgetValue) then) =
      _$BudgetValueCopyWithImpl<$Res, BudgetValue>;
  @useResult
  $Res call(
      {UniqueId id,
      UniqueId subcategoryId,
      Amount budgeted,
      Amount available,
      DateTime date});
}

/// @nodoc
class _$BudgetValueCopyWithImpl<$Res, $Val extends BudgetValue>
    implements $BudgetValueCopyWith<$Res> {
  _$BudgetValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subcategoryId = null,
    Object? budgeted = null,
    Object? available = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcategoryId: null == subcategoryId
          ? _value.subcategoryId
          : subcategoryId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      budgeted: null == budgeted
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as Amount,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as Amount,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BudgetValueCopyWith<$Res>
    implements $BudgetValueCopyWith<$Res> {
  factory _$$_BudgetValueCopyWith(
          _$_BudgetValue value, $Res Function(_$_BudgetValue) then) =
      __$$_BudgetValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      UniqueId subcategoryId,
      Amount budgeted,
      Amount available,
      DateTime date});
}

/// @nodoc
class __$$_BudgetValueCopyWithImpl<$Res>
    extends _$BudgetValueCopyWithImpl<$Res, _$_BudgetValue>
    implements _$$_BudgetValueCopyWith<$Res> {
  __$$_BudgetValueCopyWithImpl(
      _$_BudgetValue _value, $Res Function(_$_BudgetValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subcategoryId = null,
    Object? budgeted = null,
    Object? available = null,
    Object? date = null,
  }) {
    return _then(_$_BudgetValue(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcategoryId: null == subcategoryId
          ? _value.subcategoryId
          : subcategoryId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      budgeted: null == budgeted
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as Amount,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as Amount,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_BudgetValue extends _BudgetValue {
  const _$_BudgetValue(
      {required this.id,
      required this.subcategoryId,
      required this.budgeted,
      required this.available,
      required this.date})
      : super._();

  @override
  final UniqueId id;
  @override
  final UniqueId subcategoryId;
  @override
  final Amount budgeted;
  @override
  final Amount available;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'BudgetValue(id: $id, subcategoryId: $subcategoryId, budgeted: $budgeted, available: $available, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetValue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subcategoryId, subcategoryId) ||
                other.subcategoryId == subcategoryId) &&
            (identical(other.budgeted, budgeted) ||
                other.budgeted == budgeted) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, subcategoryId, budgeted, available, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetValueCopyWith<_$_BudgetValue> get copyWith =>
      __$$_BudgetValueCopyWithImpl<_$_BudgetValue>(this, _$identity);
}

abstract class _BudgetValue extends BudgetValue {
  const factory _BudgetValue(
      {required final UniqueId id,
      required final UniqueId subcategoryId,
      required final Amount budgeted,
      required final Amount available,
      required final DateTime date}) = _$_BudgetValue;
  const _BudgetValue._() : super._();

  @override
  UniqueId get id;
  @override
  UniqueId get subcategoryId;
  @override
  Amount get budgeted;
  @override
  Amount get available;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetValueCopyWith<_$_BudgetValue> get copyWith =>
      throw _privateConstructorUsedError;
}
