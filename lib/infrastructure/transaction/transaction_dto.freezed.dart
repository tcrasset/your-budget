// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transaction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoneyTransactionDTO _$MoneyTransactionDTOFromJson(Map<String, dynamic> json) {
  return _TransactionDTO.fromJson(json);
}

/// @nodoc
class _$MoneyTransactionDTOTearOff {
  const _$MoneyTransactionDTOTearOff();

  _TransactionDTO call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false, name: DatabaseConstants.MONEYTRANSACTION_ID)
          required String id,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
          required double amount,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
          required String memo,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
          required int dateInMillisecondsSinceEpoch,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          required String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          required String subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          required String subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          required double subcatBudgeted,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          required double subcatAvailable,
      @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
          required String payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
          required String payeeName,
      @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
          required String accountID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_NAME)
          required String accountName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_BALANCE)
          required double accountBalance}) {
    return _TransactionDTO(
      id: id,
      amount: amount,
      memo: memo,
      dateInMillisecondsSinceEpoch: dateInMillisecondsSinceEpoch,
      subcatID: subcatID,
      subcatName: subcatName,
      subcatCategoryId: subcatCategoryId,
      subcatBudgeted: subcatBudgeted,
      subcatAvailable: subcatAvailable,
      payeeID: payeeID,
      payeeName: payeeName,
      accountID: accountID,
      accountName: accountName,
      accountBalance: accountBalance,
    );
  }

  MoneyTransactionDTO fromJson(Map<String, Object> json) {
    return MoneyTransactionDTO.fromJson(json);
  }
}

/// @nodoc
const $MoneyTransactionDTO = _$MoneyTransactionDTOTearOff();

/// @nodoc
mixin _$MoneyTransactionDTO {
  @JsonKey(
      toJson: ignore,
      fromJson: convertToString,
      includeIfNull: false,
      name: DatabaseConstants.MONEYTRANSACTION_ID)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
  String get memo => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
  int get dateInMillisecondsSinceEpoch => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  String get subcatID => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
  String get subcatName => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.CAT_ID_OUTSIDE)
  String get subcatCategoryId => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
  double get subcatBudgeted => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
  double get subcatAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
  String get payeeID => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
  String get payeeName => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
  String get accountID => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.ACCOUNT_NAME)
  String get accountName => throw _privateConstructorUsedError;
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.ACCOUNT_BALANCE)
  double get accountBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoneyTransactionDTOCopyWith<MoneyTransactionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyTransactionDTOCopyWith<$Res> {
  factory $MoneyTransactionDTOCopyWith(
          MoneyTransactionDTO value, $Res Function(MoneyTransactionDTO) then) =
      _$MoneyTransactionDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false, name: DatabaseConstants.MONEYTRANSACTION_ID)
          String id,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
          double amount,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
          String memo,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
          int dateInMillisecondsSinceEpoch,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          String subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          String subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          double subcatBudgeted,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          double subcatAvailable,
      @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
          String payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
          String payeeName,
      @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
          String accountID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_NAME)
          String accountName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_BALANCE)
          double accountBalance});
}

/// @nodoc
class _$MoneyTransactionDTOCopyWithImpl<$Res>
    implements $MoneyTransactionDTOCopyWith<$Res> {
  _$MoneyTransactionDTOCopyWithImpl(this._value, this._then);

  final MoneyTransactionDTO _value;
  // ignore: unused_field
  final $Res Function(MoneyTransactionDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? memo = freezed,
    Object? dateInMillisecondsSinceEpoch = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? subcatCategoryId = freezed,
    Object? subcatBudgeted = freezed,
    Object? subcatAvailable = freezed,
    Object? payeeID = freezed,
    Object? payeeName = freezed,
    Object? accountID = freezed,
    Object? accountName = freezed,
    Object? accountBalance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      dateInMillisecondsSinceEpoch: dateInMillisecondsSinceEpoch == freezed
          ? _value.dateInMillisecondsSinceEpoch
          : dateInMillisecondsSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      subcatID: subcatID == freezed
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String,
      subcatName: subcatName == freezed
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as String,
      subcatCategoryId: subcatCategoryId == freezed
          ? _value.subcatCategoryId
          : subcatCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      subcatBudgeted: subcatBudgeted == freezed
          ? _value.subcatBudgeted
          : subcatBudgeted // ignore: cast_nullable_to_non_nullable
              as double,
      subcatAvailable: subcatAvailable == freezed
          ? _value.subcatAvailable
          : subcatAvailable // ignore: cast_nullable_to_non_nullable
              as double,
      payeeID: payeeID == freezed
          ? _value.payeeID
          : payeeID // ignore: cast_nullable_to_non_nullable
              as String,
      payeeName: payeeName == freezed
          ? _value.payeeName
          : payeeName // ignore: cast_nullable_to_non_nullable
              as String,
      accountID: accountID == freezed
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountBalance: accountBalance == freezed
          ? _value.accountBalance
          : accountBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$TransactionDTOCopyWith<$Res>
    implements $MoneyTransactionDTOCopyWith<$Res> {
  factory _$TransactionDTOCopyWith(
          _TransactionDTO value, $Res Function(_TransactionDTO) then) =
      __$TransactionDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false, name: DatabaseConstants.MONEYTRANSACTION_ID)
          String id,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
          double amount,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
          String memo,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
          int dateInMillisecondsSinceEpoch,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          String subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          String subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          double subcatBudgeted,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          double subcatAvailable,
      @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
          String payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
          String payeeName,
      @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
          String accountID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_NAME)
          String accountName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_BALANCE)
          double accountBalance});
}

/// @nodoc
class __$TransactionDTOCopyWithImpl<$Res>
    extends _$MoneyTransactionDTOCopyWithImpl<$Res>
    implements _$TransactionDTOCopyWith<$Res> {
  __$TransactionDTOCopyWithImpl(
      _TransactionDTO _value, $Res Function(_TransactionDTO) _then)
      : super(_value, (v) => _then(v as _TransactionDTO));

  @override
  _TransactionDTO get _value => super._value as _TransactionDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? memo = freezed,
    Object? dateInMillisecondsSinceEpoch = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? subcatCategoryId = freezed,
    Object? subcatBudgeted = freezed,
    Object? subcatAvailable = freezed,
    Object? payeeID = freezed,
    Object? payeeName = freezed,
    Object? accountID = freezed,
    Object? accountName = freezed,
    Object? accountBalance = freezed,
  }) {
    return _then(_TransactionDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      dateInMillisecondsSinceEpoch: dateInMillisecondsSinceEpoch == freezed
          ? _value.dateInMillisecondsSinceEpoch
          : dateInMillisecondsSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      subcatID: subcatID == freezed
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String,
      subcatName: subcatName == freezed
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as String,
      subcatCategoryId: subcatCategoryId == freezed
          ? _value.subcatCategoryId
          : subcatCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      subcatBudgeted: subcatBudgeted == freezed
          ? _value.subcatBudgeted
          : subcatBudgeted // ignore: cast_nullable_to_non_nullable
              as double,
      subcatAvailable: subcatAvailable == freezed
          ? _value.subcatAvailable
          : subcatAvailable // ignore: cast_nullable_to_non_nullable
              as double,
      payeeID: payeeID == freezed
          ? _value.payeeID
          : payeeID // ignore: cast_nullable_to_non_nullable
              as String,
      payeeName: payeeName == freezed
          ? _value.payeeName
          : payeeName // ignore: cast_nullable_to_non_nullable
              as String,
      accountID: accountID == freezed
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountBalance: accountBalance == freezed
          ? _value.accountBalance
          : accountBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionDTO extends _TransactionDTO {
  const _$_TransactionDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false, name: DatabaseConstants.MONEYTRANSACTION_ID)
          required this.id,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
          required this.amount,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
          required this.memo,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
          required this.dateInMillisecondsSinceEpoch,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          required this.subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          required this.subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          required this.subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          required this.subcatBudgeted,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          required this.subcatAvailable,
      @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
          required this.payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
          required this.payeeName,
      @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
          required this.accountID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_NAME)
          required this.accountName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_BALANCE)
          required this.accountBalance})
      : super._();

  factory _$_TransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_TransactionDTOFromJson(json);

  @override
  @JsonKey(
      toJson: ignore,
      fromJson: convertToString,
      includeIfNull: false,
      name: DatabaseConstants.MONEYTRANSACTION_ID)
  final String id;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
  final double amount;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
  final String memo;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
  final int dateInMillisecondsSinceEpoch;
  @override
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  final String subcatID;
  @override
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
  final String subcatName;
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.CAT_ID_OUTSIDE)
  final String subcatCategoryId;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
  final double subcatBudgeted;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
  final double subcatAvailable;
  @override
  @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
  final String payeeID;
  @override
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
  final String payeeName;
  @override
  @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
  final String accountID;
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.ACCOUNT_NAME)
  final String accountName;
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.ACCOUNT_BALANCE)
  final double accountBalance;

  @override
  String toString() {
    return 'MoneyTransactionDTO(id: $id, amount: $amount, memo: $memo, dateInMillisecondsSinceEpoch: $dateInMillisecondsSinceEpoch, subcatID: $subcatID, subcatName: $subcatName, subcatCategoryId: $subcatCategoryId, subcatBudgeted: $subcatBudgeted, subcatAvailable: $subcatAvailable, payeeID: $payeeID, payeeName: $payeeName, accountID: $accountID, accountName: $accountName, accountBalance: $accountBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.dateInMillisecondsSinceEpoch,
                    dateInMillisecondsSinceEpoch) ||
                const DeepCollectionEquality().equals(
                    other.dateInMillisecondsSinceEpoch,
                    dateInMillisecondsSinceEpoch)) &&
            (identical(other.subcatID, subcatID) ||
                const DeepCollectionEquality()
                    .equals(other.subcatID, subcatID)) &&
            (identical(other.subcatName, subcatName) ||
                const DeepCollectionEquality()
                    .equals(other.subcatName, subcatName)) &&
            (identical(other.subcatCategoryId, subcatCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.subcatCategoryId, subcatCategoryId)) &&
            (identical(other.subcatBudgeted, subcatBudgeted) ||
                const DeepCollectionEquality()
                    .equals(other.subcatBudgeted, subcatBudgeted)) &&
            (identical(other.subcatAvailable, subcatAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.subcatAvailable, subcatAvailable)) &&
            (identical(other.payeeID, payeeID) ||
                const DeepCollectionEquality()
                    .equals(other.payeeID, payeeID)) &&
            (identical(other.payeeName, payeeName) ||
                const DeepCollectionEquality()
                    .equals(other.payeeName, payeeName)) &&
            (identical(other.accountID, accountID) ||
                const DeepCollectionEquality()
                    .equals(other.accountID, accountID)) &&
            (identical(other.accountName, accountName) ||
                const DeepCollectionEquality()
                    .equals(other.accountName, accountName)) &&
            (identical(other.accountBalance, accountBalance) ||
                const DeepCollectionEquality()
                    .equals(other.accountBalance, accountBalance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(dateInMillisecondsSinceEpoch) ^
      const DeepCollectionEquality().hash(subcatID) ^
      const DeepCollectionEquality().hash(subcatName) ^
      const DeepCollectionEquality().hash(subcatCategoryId) ^
      const DeepCollectionEquality().hash(subcatBudgeted) ^
      const DeepCollectionEquality().hash(subcatAvailable) ^
      const DeepCollectionEquality().hash(payeeID) ^
      const DeepCollectionEquality().hash(payeeName) ^
      const DeepCollectionEquality().hash(accountID) ^
      const DeepCollectionEquality().hash(accountName) ^
      const DeepCollectionEquality().hash(accountBalance);

  @JsonKey(ignore: true)
  @override
  _$TransactionDTOCopyWith<_TransactionDTO> get copyWith =>
      __$TransactionDTOCopyWithImpl<_TransactionDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransactionDTOToJson(this);
  }
}

abstract class _TransactionDTO extends MoneyTransactionDTO {
  const factory _TransactionDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false, name: DatabaseConstants.MONEYTRANSACTION_ID)
          required String id,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
          required double amount,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
          required String memo,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
          required int dateInMillisecondsSinceEpoch,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          required String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          required String subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          required String subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          required double subcatBudgeted,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          required double subcatAvailable,
      @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
          required String payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
          required String payeeName,
      @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
          required String accountID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_NAME)
          required String accountName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_BALANCE)
          required double accountBalance}) = _$_TransactionDTO;
  const _TransactionDTO._() : super._();

  factory _TransactionDTO.fromJson(Map<String, dynamic> json) =
      _$_TransactionDTO.fromJson;

  @override
  @JsonKey(
      toJson: ignore,
      fromJson: convertToString,
      includeIfNull: false,
      name: DatabaseConstants.MONEYTRANSACTION_ID)
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
  double get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
  String get memo => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
  int get dateInMillisecondsSinceEpoch => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  String get subcatID => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
  String get subcatName => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.CAT_ID_OUTSIDE)
  String get subcatCategoryId => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
  double get subcatBudgeted => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
  double get subcatAvailable => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
  String get payeeID => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
  String get payeeName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
  String get accountID => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.ACCOUNT_NAME)
  String get accountName => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.ACCOUNT_BALANCE)
  double get accountBalance => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransactionDTOCopyWith<_TransactionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
