// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transaction_creator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransactionCreatorEventTearOff {
  const _$TransactionCreatorEventTearOff();

  _Initialized initialized() {
    return const _Initialized();
  }

  _AmountChanged amountChanged(String amount) {
    return _AmountChanged(
      amount,
    );
  }

  _PayeeChanged payeeChanged(Payee payee) {
    return _PayeeChanged(
      payee,
    );
  }

  _AccountChanged accountChanged(Account account) {
    return _AccountChanged(
      account,
    );
  }

  _SubcategoryChanged subcategoryChanged(Subcategory subcategory) {
    return _SubcategoryChanged(
      subcategory,
    );
  }

  _DateChanged dateChanged(DateTime date) {
    return _DateChanged(
      date,
    );
  }

  _MemoChanged memoChanged(String memo) {
    return _MemoChanged(
      memo,
    );
  }

  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
const $TransactionCreatorEvent = _$TransactionCreatorEventTearOff();

/// @nodoc
mixin _$TransactionCreatorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Payee payee) payeeChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Payee payee)? payeeChanged,
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
    required TResult Function(_PayeeChanged value) payeeChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_PayeeChanged value)? payeeChanged,
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
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;
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
    return identical(this, other) || (other is _Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Payee payee) payeeChanged,
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Payee payee)? payeeChanged,
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
    required TResult Function(_PayeeChanged value) payeeChanged,
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_PayeeChanged value)? payeeChanged,
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
abstract class _$AmountChangedCopyWith<$Res> {
  factory _$AmountChangedCopyWith(
          _AmountChanged value, $Res Function(_AmountChanged) then) =
      __$AmountChangedCopyWithImpl<$Res>;
  $Res call({String amount});
}

/// @nodoc
class __$AmountChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$AmountChangedCopyWith<$Res> {
  __$AmountChangedCopyWithImpl(
      _AmountChanged _value, $Res Function(_AmountChanged) _then)
      : super(_value, (v) => _then(v as _AmountChanged));

  @override
  _AmountChanged get _value => super._value as _AmountChanged;

  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_AmountChanged(
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
        (other is _AmountChanged &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(amount);

  @JsonKey(ignore: true)
  @override
  _$AmountChangedCopyWith<_AmountChanged> get copyWith =>
      __$AmountChangedCopyWithImpl<_AmountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Payee payee) payeeChanged,
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Payee payee)? payeeChanged,
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
    required TResult Function(_PayeeChanged value) payeeChanged,
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_PayeeChanged value)? payeeChanged,
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
  const factory _AmountChanged(String amount) = _$_AmountChanged;

  String get amount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AmountChangedCopyWith<_AmountChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PayeeChangedCopyWith<$Res> {
  factory _$PayeeChangedCopyWith(
          _PayeeChanged value, $Res Function(_PayeeChanged) then) =
      __$PayeeChangedCopyWithImpl<$Res>;
  $Res call({Payee payee});

  $PayeeCopyWith<$Res> get payee;
}

/// @nodoc
class __$PayeeChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$PayeeChangedCopyWith<$Res> {
  __$PayeeChangedCopyWithImpl(
      _PayeeChanged _value, $Res Function(_PayeeChanged) _then)
      : super(_value, (v) => _then(v as _PayeeChanged));

  @override
  _PayeeChanged get _value => super._value as _PayeeChanged;

  @override
  $Res call({
    Object? payee = freezed,
  }) {
    return _then(_PayeeChanged(
      payee == freezed
          ? _value.payee
          : payee // ignore: cast_nullable_to_non_nullable
              as Payee,
    ));
  }

  @override
  $PayeeCopyWith<$Res> get payee {
    return $PayeeCopyWith<$Res>(_value.payee, (value) {
      return _then(_value.copyWith(payee: value));
    });
  }
}

/// @nodoc

class _$_PayeeChanged implements _PayeeChanged {
  const _$_PayeeChanged(this.payee);

  @override
  final Payee payee;

  @override
  String toString() {
    return 'TransactionCreatorEvent.payeeChanged(payee: $payee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PayeeChanged &&
            (identical(other.payee, payee) ||
                const DeepCollectionEquality().equals(other.payee, payee)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(payee);

  @JsonKey(ignore: true)
  @override
  _$PayeeChangedCopyWith<_PayeeChanged> get copyWith =>
      __$PayeeChangedCopyWithImpl<_PayeeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Payee payee) payeeChanged,
    required TResult Function(Account account) accountChanged,
    required TResult Function(Subcategory subcategory) subcategoryChanged,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String memo) memoChanged,
    required TResult Function() saved,
  }) {
    return payeeChanged(payee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Payee payee)? payeeChanged,
    TResult Function(Account account)? accountChanged,
    TResult Function(Subcategory subcategory)? subcategoryChanged,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String memo)? memoChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (payeeChanged != null) {
      return payeeChanged(payee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_PayeeChanged value) payeeChanged,
    required TResult Function(_AccountChanged value) accountChanged,
    required TResult Function(_SubcategoryChanged value) subcategoryChanged,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_MemoChanged value) memoChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return payeeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_PayeeChanged value)? payeeChanged,
    TResult Function(_AccountChanged value)? accountChanged,
    TResult Function(_SubcategoryChanged value)? subcategoryChanged,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_MemoChanged value)? memoChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (payeeChanged != null) {
      return payeeChanged(this);
    }
    return orElse();
  }
}

abstract class _PayeeChanged implements TransactionCreatorEvent {
  const factory _PayeeChanged(Payee payee) = _$_PayeeChanged;

  Payee get payee => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PayeeChangedCopyWith<_PayeeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AccountChangedCopyWith<$Res> {
  factory _$AccountChangedCopyWith(
          _AccountChanged value, $Res Function(_AccountChanged) then) =
      __$AccountChangedCopyWithImpl<$Res>;
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$AccountChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$AccountChangedCopyWith<$Res> {
  __$AccountChangedCopyWithImpl(
      _AccountChanged _value, $Res Function(_AccountChanged) _then)
      : super(_value, (v) => _then(v as _AccountChanged));

  @override
  _AccountChanged get _value => super._value as _AccountChanged;

  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_AccountChanged(
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
        (other is _AccountChanged &&
            (identical(other.account, account) ||
                const DeepCollectionEquality().equals(other.account, account)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(account);

  @JsonKey(ignore: true)
  @override
  _$AccountChangedCopyWith<_AccountChanged> get copyWith =>
      __$AccountChangedCopyWithImpl<_AccountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Payee payee) payeeChanged,
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Payee payee)? payeeChanged,
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
    required TResult Function(_PayeeChanged value) payeeChanged,
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_PayeeChanged value)? payeeChanged,
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
  const factory _AccountChanged(Account account) = _$_AccountChanged;

  Account get account => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AccountChangedCopyWith<_AccountChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SubcategoryChangedCopyWith<$Res> {
  factory _$SubcategoryChangedCopyWith(
          _SubcategoryChanged value, $Res Function(_SubcategoryChanged) then) =
      __$SubcategoryChangedCopyWithImpl<$Res>;
  $Res call({Subcategory subcategory});

  $SubcategoryCopyWith<$Res> get subcategory;
}

/// @nodoc
class __$SubcategoryChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$SubcategoryChangedCopyWith<$Res> {
  __$SubcategoryChangedCopyWithImpl(
      _SubcategoryChanged _value, $Res Function(_SubcategoryChanged) _then)
      : super(_value, (v) => _then(v as _SubcategoryChanged));

  @override
  _SubcategoryChanged get _value => super._value as _SubcategoryChanged;

  @override
  $Res call({
    Object? subcategory = freezed,
  }) {
    return _then(_SubcategoryChanged(
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
        (other is _SubcategoryChanged &&
            (identical(other.subcategory, subcategory) ||
                const DeepCollectionEquality()
                    .equals(other.subcategory, subcategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(subcategory);

  @JsonKey(ignore: true)
  @override
  _$SubcategoryChangedCopyWith<_SubcategoryChanged> get copyWith =>
      __$SubcategoryChangedCopyWithImpl<_SubcategoryChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Payee payee) payeeChanged,
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Payee payee)? payeeChanged,
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
    required TResult Function(_PayeeChanged value) payeeChanged,
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_PayeeChanged value)? payeeChanged,
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
  const factory _SubcategoryChanged(Subcategory subcategory) =
      _$_SubcategoryChanged;

  Subcategory get subcategory => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SubcategoryChangedCopyWith<_SubcategoryChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DateChangedCopyWith<$Res> {
  factory _$DateChangedCopyWith(
          _DateChanged value, $Res Function(_DateChanged) then) =
      __$DateChangedCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$DateChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$DateChangedCopyWith<$Res> {
  __$DateChangedCopyWithImpl(
      _DateChanged _value, $Res Function(_DateChanged) _then)
      : super(_value, (v) => _then(v as _DateChanged));

  @override
  _DateChanged get _value => super._value as _DateChanged;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_DateChanged(
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
        (other is _DateChanged &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$DateChangedCopyWith<_DateChanged> get copyWith =>
      __$DateChangedCopyWithImpl<_DateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Payee payee) payeeChanged,
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Payee payee)? payeeChanged,
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
    required TResult Function(_PayeeChanged value) payeeChanged,
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_PayeeChanged value)? payeeChanged,
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
  const factory _DateChanged(DateTime date) = _$_DateChanged;

  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$DateChangedCopyWith<_DateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$MemoChangedCopyWith<$Res> {
  factory _$MemoChangedCopyWith(
          _MemoChanged value, $Res Function(_MemoChanged) then) =
      __$MemoChangedCopyWithImpl<$Res>;
  $Res call({String memo});
}

/// @nodoc
class __$MemoChangedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$MemoChangedCopyWith<$Res> {
  __$MemoChangedCopyWithImpl(
      _MemoChanged _value, $Res Function(_MemoChanged) _then)
      : super(_value, (v) => _then(v as _MemoChanged));

  @override
  _MemoChanged get _value => super._value as _MemoChanged;

  @override
  $Res call({
    Object? memo = freezed,
  }) {
    return _then(_MemoChanged(
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
        (other is _MemoChanged &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(memo);

  @JsonKey(ignore: true)
  @override
  _$MemoChangedCopyWith<_MemoChanged> get copyWith =>
      __$MemoChangedCopyWithImpl<_MemoChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Payee payee) payeeChanged,
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Payee payee)? payeeChanged,
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
    required TResult Function(_PayeeChanged value) payeeChanged,
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_PayeeChanged value)? payeeChanged,
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
  const factory _MemoChanged(String memo) = _$_MemoChanged;

  String get memo => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$MemoChangedCopyWith<_MemoChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res>
    extends _$TransactionCreatorEventCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
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
    return identical(this, other) || (other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String amount) amountChanged,
    required TResult Function(Payee payee) payeeChanged,
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String amount)? amountChanged,
    TResult Function(Payee payee)? payeeChanged,
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
    required TResult Function(_PayeeChanged value) payeeChanged,
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_PayeeChanged value)? payeeChanged,
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
class _$TransactionCreatorStateTearOff {
  const _$TransactionCreatorStateTearOff();

  _TransactionCreatorState call(
      {required MoneyTransaction moneyTransaction,
      required bool showErrorMessages,
      required bool isSaving,
      required bool isEditing,
      required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption}) {
    return _TransactionCreatorState(
      moneyTransaction: moneyTransaction,
      showErrorMessages: showErrorMessages,
      isSaving: isSaving,
      isEditing: isEditing,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $TransactionCreatorState = _$TransactionCreatorStateTearOff();

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
abstract class _$TransactionCreatorStateCopyWith<$Res>
    implements $TransactionCreatorStateCopyWith<$Res> {
  factory _$TransactionCreatorStateCopyWith(_TransactionCreatorState value,
          $Res Function(_TransactionCreatorState) then) =
      __$TransactionCreatorStateCopyWithImpl<$Res>;
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
class __$TransactionCreatorStateCopyWithImpl<$Res>
    extends _$TransactionCreatorStateCopyWithImpl<$Res>
    implements _$TransactionCreatorStateCopyWith<$Res> {
  __$TransactionCreatorStateCopyWithImpl(_TransactionCreatorState _value,
      $Res Function(_TransactionCreatorState) _then)
      : super(_value, (v) => _then(v as _TransactionCreatorState));

  @override
  _TransactionCreatorState get _value =>
      super._value as _TransactionCreatorState;

  @override
  $Res call({
    Object? moneyTransaction = freezed,
    Object? showErrorMessages = freezed,
    Object? isSaving = freezed,
    Object? isEditing = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_TransactionCreatorState(
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
        (other is _TransactionCreatorState &&
            (identical(other.moneyTransaction, moneyTransaction) ||
                const DeepCollectionEquality()
                    .equals(other.moneyTransaction, moneyTransaction)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality()
                    .equals(other.isSaving, isSaving)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality()
                    .equals(other.isEditing, isEditing)) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(moneyTransaction) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(isEditing) ^
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$TransactionCreatorStateCopyWith<_TransactionCreatorState> get copyWith =>
      __$TransactionCreatorStateCopyWithImpl<_TransactionCreatorState>(
          this, _$identity);
}

abstract class _TransactionCreatorState implements TransactionCreatorState {
  const factory _TransactionCreatorState(
      {required MoneyTransaction moneyTransaction,
      required bool showErrorMessages,
      required bool isSaving,
      required bool isEditing,
      required Option<Either<ValueFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_TransactionCreatorState;

  @override
  MoneyTransaction get moneyTransaction => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  bool get isSaving => throw _privateConstructorUsedError;
  @override
  bool get isEditing => throw _privateConstructorUsedError;
  @override
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransactionCreatorStateCopyWith<_TransactionCreatorState> get copyWith =>
      throw _privateConstructorUsedError;
}
