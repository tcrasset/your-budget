// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoneyTransactionDTO _$MoneyTransactionDTOFromJson(Map<String, dynamic> json) {
  return _TransactionDTO.fromJson(json);
}

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
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
  int get isInitialTransaction => throw _privateConstructorUsedError;
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
      _$MoneyTransactionDTOCopyWithImpl<$Res, MoneyTransactionDTO>;
  @useResult
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false, name: DatabaseConstants.MONEYTRANSACTION_ID)
          String id,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
          double amount,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
          String memo,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
          int dateInMillisecondsSinceEpoch,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
          int isInitialTransaction,
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
class _$MoneyTransactionDTOCopyWithImpl<$Res, $Val extends MoneyTransactionDTO>
    implements $MoneyTransactionDTOCopyWith<$Res> {
  _$MoneyTransactionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? memo = null,
    Object? dateInMillisecondsSinceEpoch = null,
    Object? isInitialTransaction = null,
    Object? subcatID = null,
    Object? subcatName = null,
    Object? subcatCategoryId = null,
    Object? subcatBudgeted = null,
    Object? subcatAvailable = null,
    Object? payeeID = null,
    Object? payeeName = null,
    Object? accountID = null,
    Object? accountName = null,
    Object? accountBalance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      dateInMillisecondsSinceEpoch: null == dateInMillisecondsSinceEpoch
          ? _value.dateInMillisecondsSinceEpoch
          : dateInMillisecondsSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      isInitialTransaction: null == isInitialTransaction
          ? _value.isInitialTransaction
          : isInitialTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      subcatID: null == subcatID
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String,
      subcatName: null == subcatName
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as String,
      subcatCategoryId: null == subcatCategoryId
          ? _value.subcatCategoryId
          : subcatCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      subcatBudgeted: null == subcatBudgeted
          ? _value.subcatBudgeted
          : subcatBudgeted // ignore: cast_nullable_to_non_nullable
              as double,
      subcatAvailable: null == subcatAvailable
          ? _value.subcatAvailable
          : subcatAvailable // ignore: cast_nullable_to_non_nullable
              as double,
      payeeID: null == payeeID
          ? _value.payeeID
          : payeeID // ignore: cast_nullable_to_non_nullable
              as String,
      payeeName: null == payeeName
          ? _value.payeeName
          : payeeName // ignore: cast_nullable_to_non_nullable
              as String,
      accountID: null == accountID
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountBalance: null == accountBalance
          ? _value.accountBalance
          : accountBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionDTOCopyWith<$Res>
    implements $MoneyTransactionDTOCopyWith<$Res> {
  factory _$$_TransactionDTOCopyWith(
          _$_TransactionDTO value, $Res Function(_$_TransactionDTO) then) =
      __$$_TransactionDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false, name: DatabaseConstants.MONEYTRANSACTION_ID)
          String id,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
          double amount,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
          String memo,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
          int dateInMillisecondsSinceEpoch,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
          int isInitialTransaction,
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
class __$$_TransactionDTOCopyWithImpl<$Res>
    extends _$MoneyTransactionDTOCopyWithImpl<$Res, _$_TransactionDTO>
    implements _$$_TransactionDTOCopyWith<$Res> {
  __$$_TransactionDTOCopyWithImpl(
      _$_TransactionDTO _value, $Res Function(_$_TransactionDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? memo = null,
    Object? dateInMillisecondsSinceEpoch = null,
    Object? isInitialTransaction = null,
    Object? subcatID = null,
    Object? subcatName = null,
    Object? subcatCategoryId = null,
    Object? subcatBudgeted = null,
    Object? subcatAvailable = null,
    Object? payeeID = null,
    Object? payeeName = null,
    Object? accountID = null,
    Object? accountName = null,
    Object? accountBalance = null,
  }) {
    return _then(_$_TransactionDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      dateInMillisecondsSinceEpoch: null == dateInMillisecondsSinceEpoch
          ? _value.dateInMillisecondsSinceEpoch
          : dateInMillisecondsSinceEpoch // ignore: cast_nullable_to_non_nullable
              as int,
      isInitialTransaction: null == isInitialTransaction
          ? _value.isInitialTransaction
          : isInitialTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      subcatID: null == subcatID
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String,
      subcatName: null == subcatName
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as String,
      subcatCategoryId: null == subcatCategoryId
          ? _value.subcatCategoryId
          : subcatCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      subcatBudgeted: null == subcatBudgeted
          ? _value.subcatBudgeted
          : subcatBudgeted // ignore: cast_nullable_to_non_nullable
              as double,
      subcatAvailable: null == subcatAvailable
          ? _value.subcatAvailable
          : subcatAvailable // ignore: cast_nullable_to_non_nullable
              as double,
      payeeID: null == payeeID
          ? _value.payeeID
          : payeeID // ignore: cast_nullable_to_non_nullable
              as String,
      payeeName: null == payeeName
          ? _value.payeeName
          : payeeName // ignore: cast_nullable_to_non_nullable
              as String,
      accountID: null == accountID
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountBalance: null == accountBalance
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
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
          required this.isInitialTransaction,
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
      _$$_TransactionDTOFromJson(json);

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
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
  final int isInitialTransaction;
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
    return 'MoneyTransactionDTO(id: $id, amount: $amount, memo: $memo, dateInMillisecondsSinceEpoch: $dateInMillisecondsSinceEpoch, isInitialTransaction: $isInitialTransaction, subcatID: $subcatID, subcatName: $subcatName, subcatCategoryId: $subcatCategoryId, subcatBudgeted: $subcatBudgeted, subcatAvailable: $subcatAvailable, payeeID: $payeeID, payeeName: $payeeName, accountID: $accountID, accountName: $accountName, accountBalance: $accountBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.dateInMillisecondsSinceEpoch,
                    dateInMillisecondsSinceEpoch) ||
                other.dateInMillisecondsSinceEpoch ==
                    dateInMillisecondsSinceEpoch) &&
            (identical(other.isInitialTransaction, isInitialTransaction) ||
                other.isInitialTransaction == isInitialTransaction) &&
            (identical(other.subcatID, subcatID) ||
                other.subcatID == subcatID) &&
            (identical(other.subcatName, subcatName) ||
                other.subcatName == subcatName) &&
            (identical(other.subcatCategoryId, subcatCategoryId) ||
                other.subcatCategoryId == subcatCategoryId) &&
            (identical(other.subcatBudgeted, subcatBudgeted) ||
                other.subcatBudgeted == subcatBudgeted) &&
            (identical(other.subcatAvailable, subcatAvailable) ||
                other.subcatAvailable == subcatAvailable) &&
            (identical(other.payeeID, payeeID) || other.payeeID == payeeID) &&
            (identical(other.payeeName, payeeName) ||
                other.payeeName == payeeName) &&
            (identical(other.accountID, accountID) ||
                other.accountID == accountID) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountBalance, accountBalance) ||
                other.accountBalance == accountBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      memo,
      dateInMillisecondsSinceEpoch,
      isInitialTransaction,
      subcatID,
      subcatName,
      subcatCategoryId,
      subcatBudgeted,
      subcatAvailable,
      payeeID,
      payeeName,
      accountID,
      accountName,
      accountBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionDTOCopyWith<_$_TransactionDTO> get copyWith =>
      __$$_TransactionDTOCopyWithImpl<_$_TransactionDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionDTOToJson(
      this,
    );
  }
}

abstract class _TransactionDTO extends MoneyTransactionDTO {
  const factory _TransactionDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false, name: DatabaseConstants.MONEYTRANSACTION_ID)
          required final String id,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
          required final double amount,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
          required final String memo,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
          required final int dateInMillisecondsSinceEpoch,
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
          required final int isInitialTransaction,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          required final String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          required final String subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          required final String subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          required final double subcatBudgeted,
      @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
          required final double subcatAvailable,
      @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
          required final String payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
          required final String payeeName,
      @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
          required final String accountID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_NAME)
          required final String accountName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.ACCOUNT_BALANCE)
          required final double accountBalance}) = _$_TransactionDTO;
  const _TransactionDTO._() : super._();

  factory _TransactionDTO.fromJson(Map<String, dynamic> json) =
      _$_TransactionDTO.fromJson;

  @override
  @JsonKey(
      toJson: ignore,
      fromJson: convertToString,
      includeIfNull: false,
      name: DatabaseConstants.MONEYTRANSACTION_ID)
  String get id;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_AMOUNT)
  double get amount;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_MEMO)
  String get memo;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_DATE)
  int get dateInMillisecondsSinceEpoch;
  @override
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
  int get isInitialTransaction;
  @override
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  String get subcatID;
  @override
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
  String get subcatName;
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.CAT_ID_OUTSIDE)
  String get subcatCategoryId;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
  double get subcatBudgeted;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false, defaultValue: 0.00)
  double get subcatAvailable;
  @override
  @JsonKey(name: DatabaseConstants.PAYEE_ID_OUTSIDE)
  String get payeeID;
  @override
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.PAYEE_NAME)
  String get payeeName;
  @override
  @JsonKey(name: DatabaseConstants.ACCOUNT_ID_OUTSIDE)
  String get accountID;
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.ACCOUNT_NAME)
  String get accountName;
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.ACCOUNT_BALANCE)
  double get accountBalance;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDTOCopyWith<_$_TransactionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
