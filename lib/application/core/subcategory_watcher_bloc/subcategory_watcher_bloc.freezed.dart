// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'subcategory_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SubcategoryWatcherEventTearOff {
  const _$SubcategoryWatcherEventTearOff();

  _SubcategoryWatchStarted watchSubcategoriesStarted() {
    return const _SubcategoryWatchStarted();
  }

  _SubcategoriesReceived subcategoriesReceived(
      Either<ValueFailure, List<Subcategory>> failureOrSubcategories) {
    return _SubcategoriesReceived(
      failureOrSubcategories,
    );
  }
}

/// @nodoc
const $SubcategoryWatcherEvent = _$SubcategoryWatcherEventTearOff();

/// @nodoc
mixin _$SubcategoryWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchSubcategoriesStarted,
    required TResult Function(
            Either<ValueFailure, List<Subcategory>> failureOrSubcategories)
        subcategoriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchSubcategoriesStarted,
    TResult Function(
            Either<ValueFailure, List<Subcategory>> failureOrSubcategories)?
        subcategoriesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubcategoryWatchStarted value)
        watchSubcategoriesStarted,
    required TResult Function(_SubcategoriesReceived value)
        subcategoriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubcategoryWatchStarted value)? watchSubcategoriesStarted,
    TResult Function(_SubcategoriesReceived value)? subcategoriesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcategoryWatcherEventCopyWith<$Res> {
  factory $SubcategoryWatcherEventCopyWith(SubcategoryWatcherEvent value,
          $Res Function(SubcategoryWatcherEvent) then) =
      _$SubcategoryWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SubcategoryWatcherEventCopyWithImpl<$Res>
    implements $SubcategoryWatcherEventCopyWith<$Res> {
  _$SubcategoryWatcherEventCopyWithImpl(this._value, this._then);

  final SubcategoryWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(SubcategoryWatcherEvent) _then;
}

/// @nodoc
abstract class _$SubcategoryWatchStartedCopyWith<$Res> {
  factory _$SubcategoryWatchStartedCopyWith(_SubcategoryWatchStarted value,
          $Res Function(_SubcategoryWatchStarted) then) =
      __$SubcategoryWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SubcategoryWatchStartedCopyWithImpl<$Res>
    extends _$SubcategoryWatcherEventCopyWithImpl<$Res>
    implements _$SubcategoryWatchStartedCopyWith<$Res> {
  __$SubcategoryWatchStartedCopyWithImpl(_SubcategoryWatchStarted _value,
      $Res Function(_SubcategoryWatchStarted) _then)
      : super(_value, (v) => _then(v as _SubcategoryWatchStarted));

  @override
  _SubcategoryWatchStarted get _value =>
      super._value as _SubcategoryWatchStarted;
}

/// @nodoc

class _$_SubcategoryWatchStarted implements _SubcategoryWatchStarted {
  const _$_SubcategoryWatchStarted();

  @override
  String toString() {
    return 'SubcategoryWatcherEvent.watchSubcategoriesStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SubcategoryWatchStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchSubcategoriesStarted,
    required TResult Function(
            Either<ValueFailure, List<Subcategory>> failureOrSubcategories)
        subcategoriesReceived,
  }) {
    return watchSubcategoriesStarted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchSubcategoriesStarted,
    TResult Function(
            Either<ValueFailure, List<Subcategory>> failureOrSubcategories)?
        subcategoriesReceived,
    required TResult orElse(),
  }) {
    if (watchSubcategoriesStarted != null) {
      return watchSubcategoriesStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubcategoryWatchStarted value)
        watchSubcategoriesStarted,
    required TResult Function(_SubcategoriesReceived value)
        subcategoriesReceived,
  }) {
    return watchSubcategoriesStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubcategoryWatchStarted value)? watchSubcategoriesStarted,
    TResult Function(_SubcategoriesReceived value)? subcategoriesReceived,
    required TResult orElse(),
  }) {
    if (watchSubcategoriesStarted != null) {
      return watchSubcategoriesStarted(this);
    }
    return orElse();
  }
}

abstract class _SubcategoryWatchStarted implements SubcategoryWatcherEvent {
  const factory _SubcategoryWatchStarted() = _$_SubcategoryWatchStarted;
}

/// @nodoc
abstract class _$SubcategoriesReceivedCopyWith<$Res> {
  factory _$SubcategoriesReceivedCopyWith(_SubcategoriesReceived value,
          $Res Function(_SubcategoriesReceived) then) =
      __$SubcategoriesReceivedCopyWithImpl<$Res>;
  $Res call({Either<ValueFailure, List<Subcategory>> failureOrSubcategories});
}

/// @nodoc
class __$SubcategoriesReceivedCopyWithImpl<$Res>
    extends _$SubcategoryWatcherEventCopyWithImpl<$Res>
    implements _$SubcategoriesReceivedCopyWith<$Res> {
  __$SubcategoriesReceivedCopyWithImpl(_SubcategoriesReceived _value,
      $Res Function(_SubcategoriesReceived) _then)
      : super(_value, (v) => _then(v as _SubcategoriesReceived));

  @override
  _SubcategoriesReceived get _value => super._value as _SubcategoriesReceived;

  @override
  $Res call({
    Object? failureOrSubcategories = freezed,
  }) {
    return _then(_SubcategoriesReceived(
      failureOrSubcategories == freezed
          ? _value.failureOrSubcategories
          : failureOrSubcategories // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure, List<Subcategory>>,
    ));
  }
}

/// @nodoc

class _$_SubcategoriesReceived implements _SubcategoriesReceived {
  const _$_SubcategoriesReceived(this.failureOrSubcategories);

  @override
  final Either<ValueFailure, List<Subcategory>> failureOrSubcategories;

  @override
  String toString() {
    return 'SubcategoryWatcherEvent.subcategoriesReceived(failureOrSubcategories: $failureOrSubcategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubcategoriesReceived &&
            (identical(other.failureOrSubcategories, failureOrSubcategories) ||
                const DeepCollectionEquality().equals(
                    other.failureOrSubcategories, failureOrSubcategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrSubcategories);

  @JsonKey(ignore: true)
  @override
  _$SubcategoriesReceivedCopyWith<_SubcategoriesReceived> get copyWith =>
      __$SubcategoriesReceivedCopyWithImpl<_SubcategoriesReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchSubcategoriesStarted,
    required TResult Function(
            Either<ValueFailure, List<Subcategory>> failureOrSubcategories)
        subcategoriesReceived,
  }) {
    return subcategoriesReceived(failureOrSubcategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchSubcategoriesStarted,
    TResult Function(
            Either<ValueFailure, List<Subcategory>> failureOrSubcategories)?
        subcategoriesReceived,
    required TResult orElse(),
  }) {
    if (subcategoriesReceived != null) {
      return subcategoriesReceived(failureOrSubcategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubcategoryWatchStarted value)
        watchSubcategoriesStarted,
    required TResult Function(_SubcategoriesReceived value)
        subcategoriesReceived,
  }) {
    return subcategoriesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubcategoryWatchStarted value)? watchSubcategoriesStarted,
    TResult Function(_SubcategoriesReceived value)? subcategoriesReceived,
    required TResult orElse(),
  }) {
    if (subcategoriesReceived != null) {
      return subcategoriesReceived(this);
    }
    return orElse();
  }
}

abstract class _SubcategoriesReceived implements SubcategoryWatcherEvent {
  const factory _SubcategoriesReceived(
          Either<ValueFailure, List<Subcategory>> failureOrSubcategories) =
      _$_SubcategoriesReceived;

  Either<ValueFailure, List<Subcategory>> get failureOrSubcategories =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SubcategoriesReceivedCopyWith<_SubcategoriesReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SubcategoryWatcherStateTearOff {
  const _$SubcategoryWatcherStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _SubcategoryLoadSuccess loadSuccess(List<Subcategory> subcategories) {
    return _SubcategoryLoadSuccess(
      subcategories,
    );
  }

  _SubcategoryLoadFailure loadFailure(
      ValueFailure<dynamic> subcategoryFailure) {
    return _SubcategoryLoadFailure(
      subcategoryFailure,
    );
  }
}

/// @nodoc
const $SubcategoryWatcherState = _$SubcategoryWatcherStateTearOff();

/// @nodoc
mixin _$SubcategoryWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Subcategory> subcategories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> subcategoryFailure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Subcategory> subcategories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> subcategoryFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SubcategoryLoadSuccess value) loadSuccess,
    required TResult Function(_SubcategoryLoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SubcategoryLoadSuccess value)? loadSuccess,
    TResult Function(_SubcategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcategoryWatcherStateCopyWith<$Res> {
  factory $SubcategoryWatcherStateCopyWith(SubcategoryWatcherState value,
          $Res Function(SubcategoryWatcherState) then) =
      _$SubcategoryWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SubcategoryWatcherStateCopyWithImpl<$Res>
    implements $SubcategoryWatcherStateCopyWith<$Res> {
  _$SubcategoryWatcherStateCopyWithImpl(this._value, this._then);

  final SubcategoryWatcherState _value;
  // ignore: unused_field
  final $Res Function(SubcategoryWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$SubcategoryWatcherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SubcategoryWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Subcategory> subcategories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> subcategoryFailure)
        loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Subcategory> subcategories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> subcategoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SubcategoryLoadSuccess value) loadSuccess,
    required TResult Function(_SubcategoryLoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SubcategoryLoadSuccess value)? loadSuccess,
    TResult Function(_SubcategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SubcategoryWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$SubcategoryWatcherStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'SubcategoryWatcherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Subcategory> subcategories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> subcategoryFailure)
        loadFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Subcategory> subcategories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> subcategoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SubcategoryLoadSuccess value) loadSuccess,
    required TResult Function(_SubcategoryLoadFailure value) loadFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SubcategoryLoadSuccess value)? loadSuccess,
    TResult Function(_SubcategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SubcategoryWatcherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$SubcategoryLoadSuccessCopyWith<$Res> {
  factory _$SubcategoryLoadSuccessCopyWith(_SubcategoryLoadSuccess value,
          $Res Function(_SubcategoryLoadSuccess) then) =
      __$SubcategoryLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Subcategory> subcategories});
}

/// @nodoc
class __$SubcategoryLoadSuccessCopyWithImpl<$Res>
    extends _$SubcategoryWatcherStateCopyWithImpl<$Res>
    implements _$SubcategoryLoadSuccessCopyWith<$Res> {
  __$SubcategoryLoadSuccessCopyWithImpl(_SubcategoryLoadSuccess _value,
      $Res Function(_SubcategoryLoadSuccess) _then)
      : super(_value, (v) => _then(v as _SubcategoryLoadSuccess));

  @override
  _SubcategoryLoadSuccess get _value => super._value as _SubcategoryLoadSuccess;

  @override
  $Res call({
    Object? subcategories = freezed,
  }) {
    return _then(_SubcategoryLoadSuccess(
      subcategories == freezed
          ? _value.subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<Subcategory>,
    ));
  }
}

/// @nodoc

class _$_SubcategoryLoadSuccess implements _SubcategoryLoadSuccess {
  const _$_SubcategoryLoadSuccess(this.subcategories);

  @override
  final List<Subcategory> subcategories;

  @override
  String toString() {
    return 'SubcategoryWatcherState.loadSuccess(subcategories: $subcategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubcategoryLoadSuccess &&
            (identical(other.subcategories, subcategories) ||
                const DeepCollectionEquality()
                    .equals(other.subcategories, subcategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(subcategories);

  @JsonKey(ignore: true)
  @override
  _$SubcategoryLoadSuccessCopyWith<_SubcategoryLoadSuccess> get copyWith =>
      __$SubcategoryLoadSuccessCopyWithImpl<_SubcategoryLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Subcategory> subcategories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> subcategoryFailure)
        loadFailure,
  }) {
    return loadSuccess(subcategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Subcategory> subcategories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> subcategoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(subcategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SubcategoryLoadSuccess value) loadSuccess,
    required TResult Function(_SubcategoryLoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SubcategoryLoadSuccess value)? loadSuccess,
    TResult Function(_SubcategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _SubcategoryLoadSuccess implements SubcategoryWatcherState {
  const factory _SubcategoryLoadSuccess(List<Subcategory> subcategories) =
      _$_SubcategoryLoadSuccess;

  List<Subcategory> get subcategories => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SubcategoryLoadSuccessCopyWith<_SubcategoryLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SubcategoryLoadFailureCopyWith<$Res> {
  factory _$SubcategoryLoadFailureCopyWith(_SubcategoryLoadFailure value,
          $Res Function(_SubcategoryLoadFailure) then) =
      __$SubcategoryLoadFailureCopyWithImpl<$Res>;
  $Res call({ValueFailure<dynamic> subcategoryFailure});

  $ValueFailureCopyWith<dynamic, $Res> get subcategoryFailure;
}

/// @nodoc
class __$SubcategoryLoadFailureCopyWithImpl<$Res>
    extends _$SubcategoryWatcherStateCopyWithImpl<$Res>
    implements _$SubcategoryLoadFailureCopyWith<$Res> {
  __$SubcategoryLoadFailureCopyWithImpl(_SubcategoryLoadFailure _value,
      $Res Function(_SubcategoryLoadFailure) _then)
      : super(_value, (v) => _then(v as _SubcategoryLoadFailure));

  @override
  _SubcategoryLoadFailure get _value => super._value as _SubcategoryLoadFailure;

  @override
  $Res call({
    Object? subcategoryFailure = freezed,
  }) {
    return _then(_SubcategoryLoadFailure(
      subcategoryFailure == freezed
          ? _value.subcategoryFailure
          : subcategoryFailure // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>,
    ));
  }

  @override
  $ValueFailureCopyWith<dynamic, $Res> get subcategoryFailure {
    return $ValueFailureCopyWith<dynamic, $Res>(_value.subcategoryFailure,
        (value) {
      return _then(_value.copyWith(subcategoryFailure: value));
    });
  }
}

/// @nodoc

class _$_SubcategoryLoadFailure implements _SubcategoryLoadFailure {
  const _$_SubcategoryLoadFailure(this.subcategoryFailure);

  @override
  final ValueFailure<dynamic> subcategoryFailure;

  @override
  String toString() {
    return 'SubcategoryWatcherState.loadFailure(subcategoryFailure: $subcategoryFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubcategoryLoadFailure &&
            (identical(other.subcategoryFailure, subcategoryFailure) ||
                const DeepCollectionEquality()
                    .equals(other.subcategoryFailure, subcategoryFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subcategoryFailure);

  @JsonKey(ignore: true)
  @override
  _$SubcategoryLoadFailureCopyWith<_SubcategoryLoadFailure> get copyWith =>
      __$SubcategoryLoadFailureCopyWithImpl<_SubcategoryLoadFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Subcategory> subcategories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> subcategoryFailure)
        loadFailure,
  }) {
    return loadFailure(subcategoryFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Subcategory> subcategories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> subcategoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(subcategoryFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SubcategoryLoadSuccess value) loadSuccess,
    required TResult Function(_SubcategoryLoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SubcategoryLoadSuccess value)? loadSuccess,
    TResult Function(_SubcategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _SubcategoryLoadFailure implements SubcategoryWatcherState {
  const factory _SubcategoryLoadFailure(
      ValueFailure<dynamic> subcategoryFailure) = _$_SubcategoryLoadFailure;

  ValueFailure<dynamic> get subcategoryFailure =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SubcategoryLoadFailureCopyWith<_SubcategoryLoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
