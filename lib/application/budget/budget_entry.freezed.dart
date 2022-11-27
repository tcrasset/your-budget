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
      _$BudgetEntryCopyWithImpl<$Res>;
  $Res call({Subcategory subcategory, BudgetValue budgetValue});

  $SubcategoryCopyWith<$Res> get subcategory;
  $BudgetValueCopyWith<$Res> get budgetValue;
}

/// @nodoc
class _$BudgetEntryCopyWithImpl<$Res> implements $BudgetEntryCopyWith<$Res> {
  _$BudgetEntryCopyWithImpl(this._value, this._then);

  final BudgetEntry _value;
  // ignore: unused_field
  final $Res Function(BudgetEntry) _then;

  @override
  $Res call({
    Object? subcategory = freezed,
    Object? budgetValue = freezed,
  }) {
    return _then(_value.copyWith(
      subcategory: subcategory == freezed
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
      budgetValue: budgetValue == freezed
          ? _value.budgetValue
          : budgetValue // ignore: cast_nullable_to_non_nullable
              as BudgetValue,
    ));
  }

  @override
  $SubcategoryCopyWith<$Res> get subcategory {
    return $SubcategoryCopyWith<$Res>(_value.subcategory, (value) {
      return _then(_value.copyWith(subcategory: value));
    });
  }

  @override
  $BudgetValueCopyWith<$Res> get budgetValue {
    return $BudgetValueCopyWith<$Res>(_value.budgetValue, (value) {
      return _then(_value.copyWith(budgetValue: value));
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
  $Res call({Subcategory subcategory, BudgetValue budgetValue});

  @override
  $SubcategoryCopyWith<$Res> get subcategory;
  @override
  $BudgetValueCopyWith<$Res> get budgetValue;
}

/// @nodoc
class __$$_BudgetEntryCopyWithImpl<$Res> extends _$BudgetEntryCopyWithImpl<$Res>
    implements _$$_BudgetEntryCopyWith<$Res> {
  __$$_BudgetEntryCopyWithImpl(
      _$_BudgetEntry _value, $Res Function(_$_BudgetEntry) _then)
      : super(_value, (v) => _then(v as _$_BudgetEntry));

  @override
  _$_BudgetEntry get _value => super._value as _$_BudgetEntry;

  @override
  $Res call({
    Object? subcategory = freezed,
    Object? budgetValue = freezed,
  }) {
    return _then(_$_BudgetEntry(
      subcategory: subcategory == freezed
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
      budgetValue: budgetValue == freezed
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
            const DeepCollectionEquality()
                .equals(other.subcategory, subcategory) &&
            const DeepCollectionEquality()
                .equals(other.budgetValue, budgetValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(subcategory),
      const DeepCollectionEquality().hash(budgetValue));

  @JsonKey(ignore: true)
  @override
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
