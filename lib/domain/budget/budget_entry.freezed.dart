// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'budget_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BudgetEntry {
  Subcategory get subcategory => throw _privateConstructorUsedError;
  BudgetValue get budgetValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetEntryCopyWith<BudgetEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetEntryCopyWith<$Res> {
  factory $BudgetEntryCopyWith(
          BudgetEntry value, $Res Function(BudgetEntry) then) =
      _$BudgetEntryCopyWithImpl<$Res, BudgetEntry>;
  @useResult
  $Res call({Subcategory subcategory, BudgetValue budgetValue});

  $SubcategoryCopyWith<$Res> get subcategory;
  $BudgetValueCopyWith<$Res> get budgetValue;
}

/// @nodoc
class _$BudgetEntryCopyWithImpl<$Res, $Val extends BudgetEntry>
    implements $BudgetEntryCopyWith<$Res> {
  _$BudgetEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subcategory = null,
    Object? budgetValue = null,
  }) {
    return _then(_value.copyWith(
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
      budgetValue: null == budgetValue
          ? _value.budgetValue
          : budgetValue // ignore: cast_nullable_to_non_nullable
              as BudgetValue,
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
  $BudgetValueCopyWith<$Res> get budgetValue {
    return $BudgetValueCopyWith<$Res>(_value.budgetValue, (value) {
      return _then(_value.copyWith(budgetValue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BudgetEntryCopyWith<$Res>
    implements $BudgetEntryCopyWith<$Res> {
  factory _$$_BudgetEntryCopyWith(
          _$_BudgetEntry value, $Res Function(_$_BudgetEntry) then) =
      __$$_BudgetEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Subcategory subcategory, BudgetValue budgetValue});

  @override
  $SubcategoryCopyWith<$Res> get subcategory;
  @override
  $BudgetValueCopyWith<$Res> get budgetValue;
}

/// @nodoc
class __$$_BudgetEntryCopyWithImpl<$Res>
    extends _$BudgetEntryCopyWithImpl<$Res, _$_BudgetEntry>
    implements _$$_BudgetEntryCopyWith<$Res> {
  __$$_BudgetEntryCopyWithImpl(
      _$_BudgetEntry _value, $Res Function(_$_BudgetEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subcategory = null,
    Object? budgetValue = null,
  }) {
    return _then(_$_BudgetEntry(
      subcategory: null == subcategory
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
      budgetValue: null == budgetValue
          ? _value.budgetValue
          : budgetValue // ignore: cast_nullable_to_non_nullable
              as BudgetValue,
    ));
  }
}

/// @nodoc

class _$_BudgetEntry extends _BudgetEntry {
  _$_BudgetEntry({required this.subcategory, required this.budgetValue})
      : super._();

  @override
  final Subcategory subcategory;
  @override
  final BudgetValue budgetValue;

  @override
  String toString() {
    return 'BudgetEntry(subcategory: $subcategory, budgetValue: $budgetValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetEntry &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.budgetValue, budgetValue) ||
                other.budgetValue == budgetValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subcategory, budgetValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetEntryCopyWith<_$_BudgetEntry> get copyWith =>
      __$$_BudgetEntryCopyWithImpl<_$_BudgetEntry>(this, _$identity);
}

abstract class _BudgetEntry extends BudgetEntry {
  factory _BudgetEntry(
      {required final Subcategory subcategory,
      required final BudgetValue budgetValue}) = _$_BudgetEntry;
  _BudgetEntry._() : super._();

  @override
  Subcategory get subcategory;
  @override
  BudgetValue get budgetValue;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetEntryCopyWith<_$_BudgetEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
