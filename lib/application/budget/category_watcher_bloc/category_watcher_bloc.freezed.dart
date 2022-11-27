// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchCategoriesStarted,
    required TResult Function(
            Either<ValueFailure, List<Category>> failureOrCategories)
        categoriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchCategoriesStarted,
    TResult Function(Either<ValueFailure, List<Category>> failureOrCategories)?
        categoriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchCategoriesStarted,
    TResult Function(Either<ValueFailure, List<Category>> failureOrCategories)?
        categoriesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryWatchStarted value)
        watchCategoriesStarted,
    required TResult Function(_CategoriesReceived value) categoriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CategoryWatchStarted value)? watchCategoriesStarted,
    TResult Function(_CategoriesReceived value)? categoriesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryWatchStarted value)? watchCategoriesStarted,
    TResult Function(_CategoriesReceived value)? categoriesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryWatcherEventCopyWith<$Res> {
  factory $CategoryWatcherEventCopyWith(CategoryWatcherEvent value,
          $Res Function(CategoryWatcherEvent) then) =
      _$CategoryWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryWatcherEventCopyWithImpl<$Res>
    implements $CategoryWatcherEventCopyWith<$Res> {
  _$CategoryWatcherEventCopyWithImpl(this._value, this._then);

  final CategoryWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(CategoryWatcherEvent) _then;
}

/// @nodoc
abstract class _$$_CategoryWatchStartedCopyWith<$Res> {
  factory _$$_CategoryWatchStartedCopyWith(_$_CategoryWatchStarted value,
          $Res Function(_$_CategoryWatchStarted) then) =
      __$$_CategoryWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CategoryWatchStartedCopyWithImpl<$Res>
    extends _$CategoryWatcherEventCopyWithImpl<$Res>
    implements _$$_CategoryWatchStartedCopyWith<$Res> {
  __$$_CategoryWatchStartedCopyWithImpl(_$_CategoryWatchStarted _value,
      $Res Function(_$_CategoryWatchStarted) _then)
      : super(_value, (v) => _then(v as _$_CategoryWatchStarted));

  @override
  _$_CategoryWatchStarted get _value => super._value as _$_CategoryWatchStarted;
}

/// @nodoc

class _$_CategoryWatchStarted implements _CategoryWatchStarted {
  const _$_CategoryWatchStarted();

  @override
  String toString() {
    return 'CategoryWatcherEvent.watchCategoriesStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CategoryWatchStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchCategoriesStarted,
    required TResult Function(
            Either<ValueFailure, List<Category>> failureOrCategories)
        categoriesReceived,
  }) {
    return watchCategoriesStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchCategoriesStarted,
    TResult Function(Either<ValueFailure, List<Category>> failureOrCategories)?
        categoriesReceived,
  }) {
    return watchCategoriesStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchCategoriesStarted,
    TResult Function(Either<ValueFailure, List<Category>> failureOrCategories)?
        categoriesReceived,
    required TResult orElse(),
  }) {
    if (watchCategoriesStarted != null) {
      return watchCategoriesStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryWatchStarted value)
        watchCategoriesStarted,
    required TResult Function(_CategoriesReceived value) categoriesReceived,
  }) {
    return watchCategoriesStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CategoryWatchStarted value)? watchCategoriesStarted,
    TResult Function(_CategoriesReceived value)? categoriesReceived,
  }) {
    return watchCategoriesStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryWatchStarted value)? watchCategoriesStarted,
    TResult Function(_CategoriesReceived value)? categoriesReceived,
    required TResult orElse(),
  }) {
    if (watchCategoriesStarted != null) {
      return watchCategoriesStarted(this);
    }
    return orElse();
  }
}

abstract class _CategoryWatchStarted implements CategoryWatcherEvent {
  const factory _CategoryWatchStarted() = _$_CategoryWatchStarted;
}

/// @nodoc
abstract class _$$_CategoriesReceivedCopyWith<$Res> {
  factory _$$_CategoriesReceivedCopyWith(_$_CategoriesReceived value,
          $Res Function(_$_CategoriesReceived) then) =
      __$$_CategoriesReceivedCopyWithImpl<$Res>;
  $Res call({Either<ValueFailure, List<Category>> failureOrCategories});
}

/// @nodoc
class __$$_CategoriesReceivedCopyWithImpl<$Res>
    extends _$CategoryWatcherEventCopyWithImpl<$Res>
    implements _$$_CategoriesReceivedCopyWith<$Res> {
  __$$_CategoriesReceivedCopyWithImpl(
      _$_CategoriesReceived _value, $Res Function(_$_CategoriesReceived) _then)
      : super(_value, (v) => _then(v as _$_CategoriesReceived));

  @override
  _$_CategoriesReceived get _value => super._value as _$_CategoriesReceived;

  @override
  $Res call({
    Object? failureOrCategories = freezed,
  }) {
    return _then(_$_CategoriesReceived(
      failureOrCategories == freezed
          ? _value.failureOrCategories
          : failureOrCategories // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure, List<Category>>,
    ));
  }
}

/// @nodoc

class _$_CategoriesReceived implements _CategoriesReceived {
  const _$_CategoriesReceived(this.failureOrCategories);

  @override
  final Either<ValueFailure, List<Category>> failureOrCategories;

  @override
  String toString() {
    return 'CategoryWatcherEvent.categoriesReceived(failureOrCategories: $failureOrCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoriesReceived &&
            const DeepCollectionEquality()
                .equals(other.failureOrCategories, failureOrCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureOrCategories));

  @JsonKey(ignore: true)
  @override
  _$$_CategoriesReceivedCopyWith<_$_CategoriesReceived> get copyWith =>
      __$$_CategoriesReceivedCopyWithImpl<_$_CategoriesReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchCategoriesStarted,
    required TResult Function(
            Either<ValueFailure, List<Category>> failureOrCategories)
        categoriesReceived,
  }) {
    return categoriesReceived(failureOrCategories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchCategoriesStarted,
    TResult Function(Either<ValueFailure, List<Category>> failureOrCategories)?
        categoriesReceived,
  }) {
    return categoriesReceived?.call(failureOrCategories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchCategoriesStarted,
    TResult Function(Either<ValueFailure, List<Category>> failureOrCategories)?
        categoriesReceived,
    required TResult orElse(),
  }) {
    if (categoriesReceived != null) {
      return categoriesReceived(failureOrCategories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CategoryWatchStarted value)
        watchCategoriesStarted,
    required TResult Function(_CategoriesReceived value) categoriesReceived,
  }) {
    return categoriesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CategoryWatchStarted value)? watchCategoriesStarted,
    TResult Function(_CategoriesReceived value)? categoriesReceived,
  }) {
    return categoriesReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CategoryWatchStarted value)? watchCategoriesStarted,
    TResult Function(_CategoriesReceived value)? categoriesReceived,
    required TResult orElse(),
  }) {
    if (categoriesReceived != null) {
      return categoriesReceived(this);
    }
    return orElse();
  }
}

abstract class _CategoriesReceived implements CategoryWatcherEvent {
  const factory _CategoriesReceived(
          final Either<ValueFailure, List<Category>> failureOrCategories) =
      _$_CategoriesReceived;

  Either<ValueFailure, List<Category>> get failureOrCategories;
  @JsonKey(ignore: true)
  _$$_CategoriesReceivedCopyWith<_$_CategoriesReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Category> categories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> categoryFailure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CategoryLoadSuccess value) loadSuccess,
    required TResult Function(_CategoryLoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryWatcherStateCopyWith<$Res> {
  factory $CategoryWatcherStateCopyWith(CategoryWatcherState value,
          $Res Function(CategoryWatcherState) then) =
      _$CategoryWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryWatcherStateCopyWithImpl<$Res>
    implements $CategoryWatcherStateCopyWith<$Res> {
  _$CategoryWatcherStateCopyWithImpl(this._value, this._then);

  final CategoryWatcherState _value;
  // ignore: unused_field
  final $Res Function(CategoryWatcherState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CategoryWatcherStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CategoryWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Category> categories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> categoryFailure)
        loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
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
    required TResult Function(_CategoryLoadSuccess value) loadSuccess,
    required TResult Function(_CategoryLoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CategoryWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CategoryWatcherStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'CategoryWatcherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Category> categories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> categoryFailure)
        loadFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
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
    required TResult Function(_CategoryLoadSuccess value) loadSuccess,
    required TResult Function(_CategoryLoadFailure value) loadFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CategoryWatcherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_CategoryLoadSuccessCopyWith<$Res> {
  factory _$$_CategoryLoadSuccessCopyWith(_$_CategoryLoadSuccess value,
          $Res Function(_$_CategoryLoadSuccess) then) =
      __$$_CategoryLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Category> categories});
}

/// @nodoc
class __$$_CategoryLoadSuccessCopyWithImpl<$Res>
    extends _$CategoryWatcherStateCopyWithImpl<$Res>
    implements _$$_CategoryLoadSuccessCopyWith<$Res> {
  __$$_CategoryLoadSuccessCopyWithImpl(_$_CategoryLoadSuccess _value,
      $Res Function(_$_CategoryLoadSuccess) _then)
      : super(_value, (v) => _then(v as _$_CategoryLoadSuccess));

  @override
  _$_CategoryLoadSuccess get _value => super._value as _$_CategoryLoadSuccess;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$_CategoryLoadSuccess(
      categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$_CategoryLoadSuccess implements _CategoryLoadSuccess {
  const _$_CategoryLoadSuccess(final List<Category> categories)
      : _categories = categories;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoryWatcherState.loadSuccess(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryLoadSuccess &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryLoadSuccessCopyWith<_$_CategoryLoadSuccess> get copyWith =>
      __$$_CategoryLoadSuccessCopyWithImpl<_$_CategoryLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Category> categories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> categoryFailure)
        loadFailure,
  }) {
    return loadSuccess(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
  }) {
    return loadSuccess?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CategoryLoadSuccess value) loadSuccess,
    required TResult Function(_CategoryLoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _CategoryLoadSuccess implements CategoryWatcherState {
  const factory _CategoryLoadSuccess(final List<Category> categories) =
      _$_CategoryLoadSuccess;

  List<Category> get categories;
  @JsonKey(ignore: true)
  _$$_CategoryLoadSuccessCopyWith<_$_CategoryLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CategoryLoadFailureCopyWith<$Res> {
  factory _$$_CategoryLoadFailureCopyWith(_$_CategoryLoadFailure value,
          $Res Function(_$_CategoryLoadFailure) then) =
      __$$_CategoryLoadFailureCopyWithImpl<$Res>;
  $Res call({ValueFailure<dynamic> categoryFailure});

  $ValueFailureCopyWith<dynamic, $Res> get categoryFailure;
}

/// @nodoc
class __$$_CategoryLoadFailureCopyWithImpl<$Res>
    extends _$CategoryWatcherStateCopyWithImpl<$Res>
    implements _$$_CategoryLoadFailureCopyWith<$Res> {
  __$$_CategoryLoadFailureCopyWithImpl(_$_CategoryLoadFailure _value,
      $Res Function(_$_CategoryLoadFailure) _then)
      : super(_value, (v) => _then(v as _$_CategoryLoadFailure));

  @override
  _$_CategoryLoadFailure get _value => super._value as _$_CategoryLoadFailure;

  @override
  $Res call({
    Object? categoryFailure = freezed,
  }) {
    return _then(_$_CategoryLoadFailure(
      categoryFailure == freezed
          ? _value.categoryFailure
          : categoryFailure // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>,
    ));
  }

  @override
  $ValueFailureCopyWith<dynamic, $Res> get categoryFailure {
    return $ValueFailureCopyWith<dynamic, $Res>(_value.categoryFailure,
        (value) {
      return _then(_value.copyWith(categoryFailure: value));
    });
  }
}

/// @nodoc

class _$_CategoryLoadFailure implements _CategoryLoadFailure {
  const _$_CategoryLoadFailure(this.categoryFailure);

  @override
  final ValueFailure<dynamic> categoryFailure;

  @override
  String toString() {
    return 'CategoryWatcherState.loadFailure(categoryFailure: $categoryFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryLoadFailure &&
            const DeepCollectionEquality()
                .equals(other.categoryFailure, categoryFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(categoryFailure));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryLoadFailureCopyWith<_$_CategoryLoadFailure> get copyWith =>
      __$$_CategoryLoadFailureCopyWithImpl<_$_CategoryLoadFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Category> categories) loadSuccess,
    required TResult Function(ValueFailure<dynamic> categoryFailure)
        loadFailure,
  }) {
    return loadFailure(categoryFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
  }) {
    return loadFailure?.call(categoryFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories)? loadSuccess,
    TResult Function(ValueFailure<dynamic> categoryFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(categoryFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CategoryLoadSuccess value) loadSuccess,
    required TResult Function(_CategoryLoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CategoryLoadSuccess value)? loadSuccess,
    TResult Function(_CategoryLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _CategoryLoadFailure implements CategoryWatcherState {
  const factory _CategoryLoadFailure(
      final ValueFailure<dynamic> categoryFailure) = _$_CategoryLoadFailure;

  ValueFailure<dynamic> get categoryFailure;
  @JsonKey(ignore: true)
  _$$_CategoryLoadFailureCopyWith<_$_CategoryLoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
