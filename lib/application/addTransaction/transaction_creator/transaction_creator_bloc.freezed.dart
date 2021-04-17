// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transaction_creator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TransactionCreatorEventTearOff {
  const _$TransactionCreatorEventTearOff();

// ignore: unused_element
  _Initialized initialized() {
    return const _Initialized();
  }

// ignore: unused_element
  _PayeeChanged payeeChanged(Payee payee) {
    return _PayeeChanged(
      payee,
    );
  }

// ignore: unused_element
  _AccountChanged accountChanged(Account account) {
    return _AccountChanged(
      account,
    );
  }

// ignore: unused_element
  _SubcategoryChanged subcategoryChanged(Subcategory subcategory) {
    return _SubcategoryChanged(
      subcategory,
    );
  }

// ignore: unused_element
  _DateChanged dateChanged(DateTime date) {
    return _DateChanged(
      date,
    );
  }

// ignore: unused_element
  _MemoChanged memoChanged(String memo) {
    return _MemoChanged(
      memo,
    );
  }

// ignore: unused_element
  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
// ignore: unused_element
const $TransactionCreatorEvent = _$TransactionCreatorEventTearOff();

/// @nodoc
mixin _$TransactionCreatorEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result payeeChanged(Payee payee),
    @required Result accountChanged(Account account),
    @required Result subcategoryChanged(Subcategory subcategory),
    @required Result dateChanged(DateTime date),
    @required Result memoChanged(String memo),
    @required Result saved(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result payeeChanged(Payee payee),
    Result accountChanged(Account account),
    Result subcategoryChanged(Subcategory subcategory),
    Result dateChanged(DateTime date),
    Result memoChanged(String memo),
    Result saved(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result payeeChanged(_PayeeChanged value),
    @required Result accountChanged(_AccountChanged value),
    @required Result subcategoryChanged(_SubcategoryChanged value),
    @required Result dateChanged(_DateChanged value),
    @required Result memoChanged(_MemoChanged value),
    @required Result saved(_Saved value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result payeeChanged(_PayeeChanged value),
    Result accountChanged(_AccountChanged value),
    Result subcategoryChanged(_SubcategoryChanged value),
    Result dateChanged(_DateChanged value),
    Result memoChanged(_MemoChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  });
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
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result payeeChanged(Payee payee),
    @required Result accountChanged(Account account),
    @required Result subcategoryChanged(Subcategory subcategory),
    @required Result dateChanged(DateTime date),
    @required Result memoChanged(String memo),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return initialized();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result payeeChanged(Payee payee),
    Result accountChanged(Account account),
    Result subcategoryChanged(Subcategory subcategory),
    Result dateChanged(DateTime date),
    Result memoChanged(String memo),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result payeeChanged(_PayeeChanged value),
    @required Result accountChanged(_AccountChanged value),
    @required Result subcategoryChanged(_SubcategoryChanged value),
    @required Result dateChanged(_DateChanged value),
    @required Result memoChanged(_MemoChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result payeeChanged(_PayeeChanged value),
    Result accountChanged(_AccountChanged value),
    Result subcategoryChanged(_SubcategoryChanged value),
    Result dateChanged(_DateChanged value),
    Result memoChanged(_MemoChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
    Object payee = freezed,
  }) {
    return _then(_PayeeChanged(
      payee == freezed ? _value.payee : payee as Payee,
    ));
  }

  @override
  $PayeeCopyWith<$Res> get payee {
    if (_value.payee == null) {
      return null;
    }
    return $PayeeCopyWith<$Res>(_value.payee, (value) {
      return _then(_value.copyWith(payee: value));
    });
  }
}

/// @nodoc
class _$_PayeeChanged implements _PayeeChanged {
  const _$_PayeeChanged(this.payee) : assert(payee != null);

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

  @override
  _$PayeeChangedCopyWith<_PayeeChanged> get copyWith =>
      __$PayeeChangedCopyWithImpl<_PayeeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result payeeChanged(Payee payee),
    @required Result accountChanged(Account account),
    @required Result subcategoryChanged(Subcategory subcategory),
    @required Result dateChanged(DateTime date),
    @required Result memoChanged(String memo),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return payeeChanged(payee);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result payeeChanged(Payee payee),
    Result accountChanged(Account account),
    Result subcategoryChanged(Subcategory subcategory),
    Result dateChanged(DateTime date),
    Result memoChanged(String memo),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (payeeChanged != null) {
      return payeeChanged(payee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result payeeChanged(_PayeeChanged value),
    @required Result accountChanged(_AccountChanged value),
    @required Result subcategoryChanged(_SubcategoryChanged value),
    @required Result dateChanged(_DateChanged value),
    @required Result memoChanged(_MemoChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return payeeChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result payeeChanged(_PayeeChanged value),
    Result accountChanged(_AccountChanged value),
    Result subcategoryChanged(_SubcategoryChanged value),
    Result dateChanged(_DateChanged value),
    Result memoChanged(_MemoChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (payeeChanged != null) {
      return payeeChanged(this);
    }
    return orElse();
  }
}

abstract class _PayeeChanged implements TransactionCreatorEvent {
  const factory _PayeeChanged(Payee payee) = _$_PayeeChanged;

  Payee get payee;
  _$PayeeChangedCopyWith<_PayeeChanged> get copyWith;
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
    Object account = freezed,
  }) {
    return _then(_AccountChanged(
      account == freezed ? _value.account : account as Account,
    ));
  }

  @override
  $AccountCopyWith<$Res> get account {
    if (_value.account == null) {
      return null;
    }
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc
class _$_AccountChanged implements _AccountChanged {
  const _$_AccountChanged(this.account) : assert(account != null);

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

  @override
  _$AccountChangedCopyWith<_AccountChanged> get copyWith =>
      __$AccountChangedCopyWithImpl<_AccountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result payeeChanged(Payee payee),
    @required Result accountChanged(Account account),
    @required Result subcategoryChanged(Subcategory subcategory),
    @required Result dateChanged(DateTime date),
    @required Result memoChanged(String memo),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return accountChanged(account);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result payeeChanged(Payee payee),
    Result accountChanged(Account account),
    Result subcategoryChanged(Subcategory subcategory),
    Result dateChanged(DateTime date),
    Result memoChanged(String memo),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (accountChanged != null) {
      return accountChanged(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result payeeChanged(_PayeeChanged value),
    @required Result accountChanged(_AccountChanged value),
    @required Result subcategoryChanged(_SubcategoryChanged value),
    @required Result dateChanged(_DateChanged value),
    @required Result memoChanged(_MemoChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return accountChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result payeeChanged(_PayeeChanged value),
    Result accountChanged(_AccountChanged value),
    Result subcategoryChanged(_SubcategoryChanged value),
    Result dateChanged(_DateChanged value),
    Result memoChanged(_MemoChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (accountChanged != null) {
      return accountChanged(this);
    }
    return orElse();
  }
}

abstract class _AccountChanged implements TransactionCreatorEvent {
  const factory _AccountChanged(Account account) = _$_AccountChanged;

  Account get account;
  _$AccountChangedCopyWith<_AccountChanged> get copyWith;
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
    Object subcategory = freezed,
  }) {
    return _then(_SubcategoryChanged(
      subcategory == freezed ? _value.subcategory : subcategory as Subcategory,
    ));
  }

  @override
  $SubcategoryCopyWith<$Res> get subcategory {
    if (_value.subcategory == null) {
      return null;
    }
    return $SubcategoryCopyWith<$Res>(_value.subcategory, (value) {
      return _then(_value.copyWith(subcategory: value));
    });
  }
}

/// @nodoc
class _$_SubcategoryChanged implements _SubcategoryChanged {
  const _$_SubcategoryChanged(this.subcategory) : assert(subcategory != null);

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

  @override
  _$SubcategoryChangedCopyWith<_SubcategoryChanged> get copyWith =>
      __$SubcategoryChangedCopyWithImpl<_SubcategoryChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result payeeChanged(Payee payee),
    @required Result accountChanged(Account account),
    @required Result subcategoryChanged(Subcategory subcategory),
    @required Result dateChanged(DateTime date),
    @required Result memoChanged(String memo),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return subcategoryChanged(subcategory);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result payeeChanged(Payee payee),
    Result accountChanged(Account account),
    Result subcategoryChanged(Subcategory subcategory),
    Result dateChanged(DateTime date),
    Result memoChanged(String memo),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subcategoryChanged != null) {
      return subcategoryChanged(subcategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result payeeChanged(_PayeeChanged value),
    @required Result accountChanged(_AccountChanged value),
    @required Result subcategoryChanged(_SubcategoryChanged value),
    @required Result dateChanged(_DateChanged value),
    @required Result memoChanged(_MemoChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return subcategoryChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result payeeChanged(_PayeeChanged value),
    Result accountChanged(_AccountChanged value),
    Result subcategoryChanged(_SubcategoryChanged value),
    Result dateChanged(_DateChanged value),
    Result memoChanged(_MemoChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (subcategoryChanged != null) {
      return subcategoryChanged(this);
    }
    return orElse();
  }
}

abstract class _SubcategoryChanged implements TransactionCreatorEvent {
  const factory _SubcategoryChanged(Subcategory subcategory) =
      _$_SubcategoryChanged;

  Subcategory get subcategory;
  _$SubcategoryChangedCopyWith<_SubcategoryChanged> get copyWith;
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
    Object date = freezed,
  }) {
    return _then(_DateChanged(
      date == freezed ? _value.date : date as DateTime,
    ));
  }
}

/// @nodoc
class _$_DateChanged implements _DateChanged {
  const _$_DateChanged(this.date) : assert(date != null);

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

  @override
  _$DateChangedCopyWith<_DateChanged> get copyWith =>
      __$DateChangedCopyWithImpl<_DateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result payeeChanged(Payee payee),
    @required Result accountChanged(Account account),
    @required Result subcategoryChanged(Subcategory subcategory),
    @required Result dateChanged(DateTime date),
    @required Result memoChanged(String memo),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result payeeChanged(Payee payee),
    Result accountChanged(Account account),
    Result subcategoryChanged(Subcategory subcategory),
    Result dateChanged(DateTime date),
    Result memoChanged(String memo),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dateChanged != null) {
      return dateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result payeeChanged(_PayeeChanged value),
    @required Result accountChanged(_AccountChanged value),
    @required Result subcategoryChanged(_SubcategoryChanged value),
    @required Result dateChanged(_DateChanged value),
    @required Result memoChanged(_MemoChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result payeeChanged(_PayeeChanged value),
    Result accountChanged(_AccountChanged value),
    Result subcategoryChanged(_SubcategoryChanged value),
    Result dateChanged(_DateChanged value),
    Result memoChanged(_MemoChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class _DateChanged implements TransactionCreatorEvent {
  const factory _DateChanged(DateTime date) = _$_DateChanged;

  DateTime get date;
  _$DateChangedCopyWith<_DateChanged> get copyWith;
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
    Object memo = freezed,
  }) {
    return _then(_MemoChanged(
      memo == freezed ? _value.memo : memo as String,
    ));
  }
}

/// @nodoc
class _$_MemoChanged implements _MemoChanged {
  const _$_MemoChanged(this.memo) : assert(memo != null);

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

  @override
  _$MemoChangedCopyWith<_MemoChanged> get copyWith =>
      __$MemoChangedCopyWithImpl<_MemoChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result payeeChanged(Payee payee),
    @required Result accountChanged(Account account),
    @required Result subcategoryChanged(Subcategory subcategory),
    @required Result dateChanged(DateTime date),
    @required Result memoChanged(String memo),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return memoChanged(memo);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result payeeChanged(Payee payee),
    Result accountChanged(Account account),
    Result subcategoryChanged(Subcategory subcategory),
    Result dateChanged(DateTime date),
    Result memoChanged(String memo),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (memoChanged != null) {
      return memoChanged(memo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result payeeChanged(_PayeeChanged value),
    @required Result accountChanged(_AccountChanged value),
    @required Result subcategoryChanged(_SubcategoryChanged value),
    @required Result dateChanged(_DateChanged value),
    @required Result memoChanged(_MemoChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return memoChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result payeeChanged(_PayeeChanged value),
    Result accountChanged(_AccountChanged value),
    Result subcategoryChanged(_SubcategoryChanged value),
    Result dateChanged(_DateChanged value),
    Result memoChanged(_MemoChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (memoChanged != null) {
      return memoChanged(this);
    }
    return orElse();
  }
}

abstract class _MemoChanged implements TransactionCreatorEvent {
  const factory _MemoChanged(String memo) = _$_MemoChanged;

  String get memo;
  _$MemoChangedCopyWith<_MemoChanged> get copyWith;
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
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result payeeChanged(Payee payee),
    @required Result accountChanged(Account account),
    @required Result subcategoryChanged(Subcategory subcategory),
    @required Result dateChanged(DateTime date),
    @required Result memoChanged(String memo),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result payeeChanged(Payee payee),
    Result accountChanged(Account account),
    Result subcategoryChanged(Subcategory subcategory),
    Result dateChanged(DateTime date),
    Result memoChanged(String memo),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result payeeChanged(_PayeeChanged value),
    @required Result accountChanged(_AccountChanged value),
    @required Result subcategoryChanged(_SubcategoryChanged value),
    @required Result dateChanged(_DateChanged value),
    @required Result memoChanged(_MemoChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(payeeChanged != null);
    assert(accountChanged != null);
    assert(subcategoryChanged != null);
    assert(dateChanged != null);
    assert(memoChanged != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result payeeChanged(_PayeeChanged value),
    Result accountChanged(_AccountChanged value),
    Result subcategoryChanged(_SubcategoryChanged value),
    Result dateChanged(_DateChanged value),
    Result memoChanged(_MemoChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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

// ignore: unused_element
  _TransactionCreatorState call(
      {@required
          MoneyTransaction moneyTransaction,
      @required
          bool showErrorMessages,
      @required
          bool isSaving,
      @required
          bool isEditing,
      @required
          Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption}) {
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
// ignore: unused_element
const $TransactionCreatorState = _$TransactionCreatorStateTearOff();

/// @nodoc
mixin _$TransactionCreatorState {
  MoneyTransaction get moneyTransaction;
  bool get showErrorMessages;
  bool get isSaving;
  bool get isEditing;
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption;

  $TransactionCreatorStateCopyWith<TransactionCreatorState> get copyWith;
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
    Object moneyTransaction = freezed,
    Object showErrorMessages = freezed,
    Object isSaving = freezed,
    Object isEditing = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      moneyTransaction: moneyTransaction == freezed
          ? _value.moneyTransaction
          : moneyTransaction as MoneyTransaction,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<ValueFailure, Unit>>,
    ));
  }

  @override
  $MoneyTransactionCopyWith<$Res> get moneyTransaction {
    if (_value.moneyTransaction == null) {
      return null;
    }
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
    Object moneyTransaction = freezed,
    Object showErrorMessages = freezed,
    Object isSaving = freezed,
    Object isEditing = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_TransactionCreatorState(
      moneyTransaction: moneyTransaction == freezed
          ? _value.moneyTransaction
          : moneyTransaction as MoneyTransaction,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<ValueFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_TransactionCreatorState implements _TransactionCreatorState {
  const _$_TransactionCreatorState(
      {@required this.moneyTransaction,
      @required this.showErrorMessages,
      @required this.isSaving,
      @required this.isEditing,
      @required this.saveFailureOrSuccessOption})
      : assert(moneyTransaction != null),
        assert(showErrorMessages != null),
        assert(isSaving != null),
        assert(isEditing != null),
        assert(saveFailureOrSuccessOption != null);

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

  @override
  _$TransactionCreatorStateCopyWith<_TransactionCreatorState> get copyWith =>
      __$TransactionCreatorStateCopyWithImpl<_TransactionCreatorState>(
          this, _$identity);
}

abstract class _TransactionCreatorState implements TransactionCreatorState {
  const factory _TransactionCreatorState(
          {@required
              MoneyTransaction moneyTransaction,
          @required
              bool showErrorMessages,
          @required
              bool isSaving,
          @required
              bool isEditing,
          @required
              Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption}) =
      _$_TransactionCreatorState;

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
  _$TransactionCreatorStateCopyWith<_TransactionCreatorState> get copyWith;
}
