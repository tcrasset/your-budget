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
      _$BudgetValueCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      UniqueId subcategoryId,
      Amount budgeted,
      Amount available,
      DateTime date});
}

/// @nodoc
class _$BudgetValueCopyWithImpl<$Res> implements $BudgetValueCopyWith<$Res> {
  _$BudgetValueCopyWithImpl(this._value, this._then);

  final BudgetValue _value;
  // ignore: unused_field
  final $Res Function(BudgetValue) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? subcategoryId = freezed,
    Object? budgeted = freezed,
    Object? available = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcategoryId: subcategoryId == freezed
          ? _value.subcategoryId
          : subcategoryId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      budgeted: budgeted == freezed
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as Amount,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as Amount,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_BudgetValueCopyWith<$Res>
    implements $BudgetValueCopyWith<$Res> {
  factory _$$_BudgetValueCopyWith(
          _$_BudgetValue value, $Res Function(_$_BudgetValue) then) =
      __$$_BudgetValueCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      UniqueId subcategoryId,
      Amount budgeted,
      Amount available,
      DateTime date});
}

/// @nodoc
class __$$_BudgetValueCopyWithImpl<$Res> extends _$BudgetValueCopyWithImpl<$Res>
    implements _$$_BudgetValueCopyWith<$Res> {
  __$$_BudgetValueCopyWithImpl(
      _$_BudgetValue _value, $Res Function(_$_BudgetValue) _then)
      : super(_value, (v) => _then(v as _$_BudgetValue));

  @override
  _$_BudgetValue get _value => super._value as _$_BudgetValue;

  @override
  $Res call({
    Object? id = freezed,
    Object? subcategoryId = freezed,
    Object? budgeted = freezed,
    Object? available = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_BudgetValue(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      subcategoryId: subcategoryId == freezed
          ? _value.subcategoryId
          : subcategoryId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      budgeted: budgeted == freezed
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as Amount,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as Amount,
      date: date == freezed
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.subcategoryId, subcategoryId) &&
            const DeepCollectionEquality().equals(other.budgeted, budgeted) &&
            const DeepCollectionEquality().equals(other.available, available) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(subcategoryId),
      const DeepCollectionEquality().hash(budgeted),
      const DeepCollectionEquality().hash(available),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
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
