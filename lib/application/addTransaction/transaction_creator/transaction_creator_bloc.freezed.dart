// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_creator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionCreatorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Either<Payee, Account> payable) receiverChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_ReceiverChanged value) receiverChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCreatorEventCopyWith<$Res> {
  factory $TransactionCreatorEventCopyWith(TransactionCreatorEvent value,
          $Res Function(TransactionCreatorEvent) then) =
      _$TransactionCreatorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionCreatorEventCopyWithImpl<$Res>
    implements $TransactionCreatorEventCopyWith<$Res> {
  _$TransactionCreatorEventCopyWithImpl(this._value, this._then);

  final TransactionCreatorEvent _value;
  // ignore: unused_field
  final $Res Function(TransactionCreatorEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, (v) => _then(v as _$_Initialized));

  @override
  _$_Initialized get _value => super._value as _$_Initialized;
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'TransactionCreatorEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Either<Payee, Account> payable) receiverChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_ReceiverChanged value) receiverChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements TransactionCreatorEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_AmountChangedCopyWith<$Res> {
  factory _$$_AmountChangedCopyWith(
          _$_AmountChanged value, $Res Function(_$_AmountChanged) then) =
      __$$_AmountChangedCopyWithImpl<$Res>;
  $Res call({String amount});
}

/// @nodoc
class __$$_AmountChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$$_AmountChangedCopyWith<$Res> {
  __$$_AmountChangedCopyWithImpl(
      _$_AmountChanged _value, $Res Function(_$_AmountChanged) _then)
      : super(_value, (v) => _then(v as _$_AmountChanged));

  @override
  _$_AmountChanged get _value => super._value as _$_AmountChanged;

  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_$_AmountChanged(
      amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AmountChanged implements _AmountChanged {
  const _$_AmountChanged(this.amount);

  @override
  final String amount;

  @override
  String toString() {
    return 'TransactionCreatorEvent.amountChanged(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AmountChanged &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  _$$_AmountChangedCopyWith<_$_AmountChanged> get copyWith =>
      __$$_AmountChangedCopyWithImpl<_$_AmountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Either<Payee, Account> payable) receiverChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) {
    return amountChanged(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
  }) {
    return amountChanged?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_ReceiverChanged value) receiverChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return amountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return amountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(this);
    }
    return orElse();
  }
}

abstract class _AmountChanged implements TransactionCreatorEvent {
  const factory _AmountChanged(final String amount) = _$_AmountChanged;

  String get amount;
  @JsonKey(ignore: true)
  _$$_AmountChangedCopyWith<_$_AmountChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReceiverChangedCopyWith<$Res> {
  factory _$$_ReceiverChangedCopyWith(
          _$_ReceiverChanged value, $Res Function(_$_ReceiverChanged) then) =
      __$$_ReceiverChangedCopyWithImpl<$Res>;
  $Res call({Either<Payee, Account> payable});
}

/// @nodoc
class __$$_ReceiverChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$$_ReceiverChangedCopyWith<$Res> {
  __$$_ReceiverChangedCopyWithImpl(
      _$_ReceiverChanged _value, $Res Function(_$_ReceiverChanged) _then)
      : super(_value, (v) => _then(v as _$_ReceiverChanged));

  @override
  _$_ReceiverChanged get _value => super._value as _$_ReceiverChanged;

  @override
  $Res call({
    Object? payable = freezed,
  }) {
    return _then(_$_ReceiverChanged(
      payable == freezed
          ? _value.payable
          : payable // ignore: cast_nullable_to_non_nullable
              as Either<Payee, Account>,
    ));
  }
}

/// @nodoc

class _$_ReceiverChanged implements _ReceiverChanged {
  const _$_ReceiverChanged(this.payable);

  @override
  final Either<Payee, Account> payable;

  @override
  String toString() {
    return 'TransactionCreatorEvent.receiverChanged(payable: $payable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiverChanged &&
            const DeepCollectionEquality().equals(other.payable, payable));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(payable));

  @JsonKey(ignore: true)
  @override
  _$$_ReceiverChangedCopyWith<_$_ReceiverChanged> get copyWith =>
      __$$_ReceiverChangedCopyWithImpl<_$_ReceiverChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Either<Payee, Account> payable) receiverChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) {
    return receiverChanged(payable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
  }) {
    return receiverChanged?.call(payable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (receiverChanged != null) {
      return receiverChanged(payable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_ReceiverChanged value) receiverChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return receiverChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return receiverChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (receiverChanged != null) {
      return receiverChanged(this);
    }
    return orElse();
  }
}

abstract class _ReceiverChanged implements TransactionCreatorEvent {
  const factory _ReceiverChanged(final Either<Payee, Account> payable) =
      _$_ReceiverChanged;

  Either<Payee, Account> get payable;
  @JsonKey(ignore: true)
  _$$_ReceiverChangedCopyWith<_$_ReceiverChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AccountChangedCopyWith<$Res> {
  factory _$$_AccountChangedCopyWith(
          _$_AccountChanged value, $Res Function(_$_AccountChanged) then) =
      __$$_AccountChangedCopyWithImpl<$Res>;
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$_AccountChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$$_AccountChangedCopyWith<$Res> {
  __$$_AccountChangedCopyWithImpl(
      _$_AccountChanged _value, $Res Function(_$_AccountChanged) _then)
      : super(_value, (v) => _then(v as _$_AccountChanged));

  @override
  _$_AccountChanged get _value => super._value as _$_AccountChanged;

  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_$_AccountChanged(
      account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }

  @override
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$_AccountChanged implements _AccountChanged {
  const _$_AccountChanged(this.account);

  @override
  final Account account;

  @override
  String toString() {
    return 'TransactionCreatorEvent.accountChanged(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountChanged &&
            const DeepCollectionEquality().equals(other.account, account));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(account));

  @JsonKey(ignore: true)
  @override
  _$$_AccountChangedCopyWith<_$_AccountChanged> get copyWith =>
      __$$_AccountChangedCopyWithImpl<_$_AccountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Either<Payee, Account> payable) receiverChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) {
    return accountChanged(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
  }) {
    return accountChanged?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (accountChanged != null) {
      return accountChanged(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_ReceiverChanged value) receiverChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return accountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return accountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (accountChanged != null) {
      return accountChanged(this);
    }
    return orElse();
  }
}

abstract class _AccountChanged implements TransactionCreatorEvent {
  const factory _AccountChanged(final Account account) = _$_AccountChanged;

  Account get account;
  @JsonKey(ignore: true)
  _$$_AccountChangedCopyWith<_$_AccountChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SubcategoryChangedCopyWith<$Res> {
  factory _$$_SubcategoryChangedCopyWith(_$_SubcategoryChanged value,
          $Res Function(_$_SubcategoryChanged) then) =
      __$$_SubcategoryChangedCopyWithImpl<$Res>;
  $Res call({Subcategory subcategory});

  $SubcategoryCopyWith<$Res> get subcategory;
}

/// @nodoc
class __$$_SubcategoryChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$$_SubcategoryChangedCopyWith<$Res> {
  __$$_SubcategoryChangedCopyWithImpl(
      _$_SubcategoryChanged _value, $Res Function(_$_SubcategoryChanged) _then)
      : super(_value, (v) => _then(v as _$_SubcategoryChanged));

  @override
  _$_SubcategoryChanged get _value => super._value as _$_SubcategoryChanged;

  @override
  $Res call({
    Object? subcategory = freezed,
  }) {
    return _then(_$_SubcategoryChanged(
      subcategory == freezed
          ? _value.subcategory
          : subcategory // ignore: cast_nullable_to_non_nullable
              as Subcategory,
    ));
  }

  @override
  $SubcategoryCopyWith<$Res> get subcategory {
    return $SubcategoryCopyWith<$Res>(_value.subcategory, (value) {
      return _then(_value.copyWith(subcategory: value));
    });
  }
}

/// @nodoc

class _$_SubcategoryChanged implements _SubcategoryChanged {
  const _$_SubcategoryChanged(this.subcategory);

  @override
  final Subcategory subcategory;

  @override
  String toString() {
    return 'TransactionCreatorEvent.subcategoryChanged(subcategory: $subcategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubcategoryChanged &&
            const DeepCollectionEquality()
                .equals(other.subcategory, subcategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(subcategory));

  @JsonKey(ignore: true)
  @override
  _$$_SubcategoryChangedCopyWith<_$_SubcategoryChanged> get copyWith =>
      __$$_SubcategoryChangedCopyWithImpl<_$_SubcategoryChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Either<Payee, Account> payable) receiverChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) {
    return subcategoryChanged(subcategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
  }) {
    return subcategoryChanged?.call(subcategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (subcategoryChanged != null) {
      return subcategoryChanged(subcategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_ReceiverChanged value) receiverChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return subcategoryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return subcategoryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (subcategoryChanged != null) {
      return subcategoryChanged(this);
    }
    return orElse();
  }
}

abstract class _SubcategoryChanged implements TransactionCreatorEvent {
  const factory _SubcategoryChanged(final Subcategory subcategory) =
      _$_SubcategoryChanged;

  Subcategory get subcategory;
  @JsonKey(ignore: true)
  _$$_SubcategoryChangedCopyWith<_$_SubcategoryChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DateChangedCopyWith<$Res> {
  factory _$$_DateChangedCopyWith(
          _$_DateChanged value, $Res Function(_$_DateChanged) then) =
      __$$_DateChangedCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$$_DateChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$$_DateChangedCopyWith<$Res> {
  __$$_DateChangedCopyWithImpl(
      _$_DateChanged _value, $Res Function(_$_DateChanged) _then)
      : super(_value, (v) => _then(v as _$_DateChanged));

  @override
  _$_DateChanged get _value => super._value as _$_DateChanged;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$_DateChanged(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DateChanged implements _DateChanged {
  const _$_DateChanged(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'TransactionCreatorEvent.dateChanged(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DateChanged &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_DateChangedCopyWith<_$_DateChanged> get copyWith =>
      __$$_DateChangedCopyWithImpl<_$_DateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Either<Payee, Account> payable) receiverChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) {
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
  }) {
    return dateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_ReceiverChanged value) receiverChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class _DateChanged implements TransactionCreatorEvent {
  const factory _DateChanged(final DateTime date) = _$_DateChanged;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$_DateChangedCopyWith<_$_DateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MemoChangedCopyWith<$Res> {
  factory _$$_MemoChangedCopyWith(
          _$_MemoChanged value, $Res Function(_$_MemoChanged) then) =
      __$$_MemoChangedCopyWithImpl<$Res>;
  $Res call({String memo});
}

/// @nodoc
class __$$_MemoChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$$_MemoChangedCopyWith<$Res> {
  __$$_MemoChangedCopyWithImpl(
      _$_MemoChanged _value, $Res Function(_$_MemoChanged) _then)
      : super(_value, (v) => _then(v as _$_MemoChanged));

  @override
  _$_MemoChanged get _value => super._value as _$_MemoChanged;

  @override
  $Res call({
    Object? memo = freezed,
  }) {
    return _then(_$_MemoChanged(
      memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MemoChanged implements _MemoChanged {
  const _$_MemoChanged(this.memo);

  @override
  final String memo;

  @override
  String toString() {
    return 'TransactionCreatorEvent.memoChanged(memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemoChanged &&
            const DeepCollectionEquality().equals(other.memo, memo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(memo));

  @JsonKey(ignore: true)
  @override
  _$$_MemoChangedCopyWith<_$_MemoChanged> get copyWith =>
      __$$_MemoChangedCopyWithImpl<_$_MemoChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Either<Payee, Account> payable) receiverChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) {
    return memoChanged(memo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
  }) {
    return memoChanged?.call(memo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (memoChanged != null) {
      return memoChanged(memo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_ReceiverChanged value) receiverChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return memoChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return memoChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (memoChanged != null) {
      return memoChanged(this);
    }
    return orElse();
  }
}

abstract class _MemoChanged implements TransactionCreatorEvent {
  const factory _MemoChanged(final String memo) = _$_MemoChanged;

  String get memo;
  @JsonKey(ignore: true)
  _$$_MemoChangedCopyWith<_$_MemoChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SavedCopyWith<$Res> {
  factory _$$_SavedCopyWith(_$_Saved value, $Res Function(_$_Saved) then) =
      __$$_SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SavedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$$_SavedCopyWith<$Res> {
  __$$_SavedCopyWithImpl(_$_Saved _value, $Res Function(_$_Saved) _then)
      : super(_value, (v) => _then(v as _$_Saved));

  @override
  _$_Saved get _value => super._value as _$_Saved;
}

/// @nodoc

class _$_Saved implements _Saved {
  const _$_Saved();

  @override
  String toString() {
    return 'TransactionCreatorEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Either<Payee, Account> payable) receiverChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Either<Payee, Account> payable)? receiverChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_ReceiverChanged value) receiverChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_ReceiverChanged value)? receiverChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements TransactionCreatorEvent {
  const factory _Saved() = _$_Saved;
}

/// @nodoc
mixin _$TransactionCreatorState {
  MoneyTransaction get moneyTransaction => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionCreatorStateCopyWith<TransactionCreatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCreatorStateCopyWith<$Res> {
  factory $TransactionCreatorStateCopyWith(TransactionCreatorState value,
          $Res Function(TransactionCreatorState) then) =
      _$TransactionCreatorStateCopyWithImpl<$Res>;
  $Res call(
      {MoneyTransaction moneyTransaction,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption});

  $MoneyTransactionCopyWith<$Res> get moneyTransaction;
}

/// @nodoc
class _$TransactionCreatorStateCopyWithImpl<$Res>
    implements $TransactionCreatorStateCopyWith<$Res> {
  _$TransactionCreatorStateCopyWithImpl(this._value, this._then);

  final TransactionCreatorState _value;
  // ignore: unused_field
  final $Res Function(TransactionCreatorState) _then;

  @override
  $Res call({
    Object? moneyTransaction = freezed,
    Object? showErrorMessages = freezed,
    Object? isSaving = freezed,
    Object? isEditing = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      moneyTransaction: moneyTransaction == freezed
          ? _value.moneyTransaction
          : moneyTransaction // ignore: cast_nullable_to_non_nullable
              as MoneyTransaction,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ValueFailure, Unit>>,
    ));
  }

  @override
  $MoneyTransactionCopyWith<$Res> get moneyTransaction {
    return $MoneyTransactionCopyWith<$Res>(_value.moneyTransaction, (value) {
      return _then(_value.copyWith(moneyTransaction: value));
    });
  }
}

/// @nodoc
abstract class _$$_TransactionCreatorStateCopyWith<$Res>
    implements $TransactionCreatorStateCopyWith<$Res> {
  factory _$$_TransactionCreatorStateCopyWith(_$_TransactionCreatorState value,
          $Res Function(_$_TransactionCreatorState) then) =
      __$$_TransactionCreatorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {MoneyTransaction moneyTransaction,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $MoneyTransactionCopyWith<$Res> get moneyTransaction;
}

/// @nodoc
class __$$_TransactionCreatorStateCopyWithImpl<$Res>
    extends _$TransactionCreatorStateCopyWithImpl<$Res>
    implements _$$_TransactionCreatorStateCopyWith<$Res> {
  __$$_TransactionCreatorStateCopyWithImpl(_$_TransactionCreatorState _value,
      $Res Function(_$_TransactionCreatorState) _then)
      : super(_value, (v) => _then(v as _$_TransactionCreatorState));

  @override
  _$_TransactionCreatorState get _value =>
      super._value as _$_TransactionCreatorState;

  @override
  $Res call({
    Object? moneyTransaction = freezed,
    Object? showErrorMessages = freezed,
    Object? isSaving = freezed,
    Object? isEditing = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_TransactionCreatorState(
      moneyTransaction: moneyTransaction == freezed
          ? _value.moneyTransaction
          : moneyTransaction // ignore: cast_nullable_to_non_nullable
              as MoneyTransaction,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ValueFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_TransactionCreatorState implements _TransactionCreatorState {
  const _$_TransactionCreatorState(
      {required this.moneyTransaction,
      required this.showErrorMessages,
      required this.isSaving,
      required this.isEditing,
      required this.saveFailureOrSuccessOption});

  @override
  final MoneyTransaction moneyTransaction;
  @override
  final bool showErrorMessages;
  @override
  final bool isSaving;
  @override
  final bool isEditing;
  @override
  final Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'TransactionCreatorState(moneyTransaction: $moneyTransaction, showErrorMessages: $showErrorMessages, isSaving: $isSaving, isEditing: $isEditing, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionCreatorState &&
            const DeepCollectionEquality()
                .equals(other.moneyTransaction, moneyTransaction) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.isSaving, isSaving) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing) &&
            const DeepCollectionEquality().equals(
                other.saveFailureOrSuccessOption, saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(moneyTransaction),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSaving),
      const DeepCollectionEquality().hash(isEditing),
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionCreatorStateCopyWith<_$_TransactionCreatorState>
      get copyWith =>
          __$$_TransactionCreatorStateCopyWithImpl<_$_TransactionCreatorState>(
              this, _$identity);
}

abstract class _TransactionCreatorState implements TransactionCreatorState {
  const factory _TransactionCreatorState(
      {required final MoneyTransaction moneyTransaction,
      required final bool showErrorMessages,
      required final bool isSaving,
      required final bool isEditing,
      required final Option<Either<ValueFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_TransactionCreatorState;

  @override
  MoneyTransaction get moneyTransaction;
  @override
  bool get showErrorMessages;
  @override
  bool get isSaving;
  @override
  bool get isEditing;
  @override
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCreatorStateCopyWith<_$_TransactionCreatorState>
      get copyWith => throw _privateConstructorUsedError;
}
