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
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
          int isInitialTransaction,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          String subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          String subcatCategoryId,
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
    Object? isInitialTransaction = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? subcatCategoryId = freezed,
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
      isInitialTransaction: isInitialTransaction == freezed
          ? _value.isInitialTransaction
          : isInitialTransaction // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TransactionDTOCopyWith<$Res>
    implements $MoneyTransactionDTOCopyWith<$Res> {
  factory _$$_TransactionDTOCopyWith(
          _$_TransactionDTO value, $Res Function(_$_TransactionDTO) then) =
      __$$_TransactionDTOCopyWithImpl<$Res>;
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
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
          int isInitialTransaction,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          String subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          String subcatCategoryId,
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
    extends _$MoneyTransactionDTOCopyWithImpl<$Res>
    implements _$$_TransactionDTOCopyWith<$Res> {
  __$$_TransactionDTOCopyWithImpl(
      _$_TransactionDTO _value, $Res Function(_$_TransactionDTO) _then)
      : super(_value, (v) => _then(v as _$_TransactionDTO));

  @override
  _$_TransactionDTO get _value => super._value as _$_TransactionDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? memo = freezed,
    Object? dateInMillisecondsSinceEpoch = freezed,
    Object? isInitialTransaction = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? subcatCategoryId = freezed,
    Object? payeeID = freezed,
    Object? payeeName = freezed,
    Object? accountID = freezed,
    Object? accountName = freezed,
    Object? accountBalance = freezed,
  }) {
    return _then(_$_TransactionDTO(
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
      isInitialTransaction: isInitialTransaction == freezed
          ? _value.isInitialTransaction
          : isInitialTransaction // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_IS_INITIAL_TRANSACTION)
          required this.isInitialTransaction,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          required this.subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          required this.subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          required this.subcatCategoryId,
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
    return 'MoneyTransactionDTO(id: $id, amount: $amount, memo: $memo, dateInMillisecondsSinceEpoch: $dateInMillisecondsSinceEpoch, isInitialTransaction: $isInitialTransaction, subcatID: $subcatID, subcatName: $subcatName, subcatCategoryId: $subcatCategoryId, payeeID: $payeeID, payeeName: $payeeName, accountID: $accountID, accountName: $accountName, accountBalance: $accountBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(
                other.dateInMillisecondsSinceEpoch,
                dateInMillisecondsSinceEpoch) &&
            const DeepCollectionEquality()
                .equals(other.isInitialTransaction, isInitialTransaction) &&
            const DeepCollectionEquality().equals(other.subcatID, subcatID) &&
            const DeepCollectionEquality()
                .equals(other.subcatName, subcatName) &&
            const DeepCollectionEquality()
                .equals(other.subcatCategoryId, subcatCategoryId) &&
            const DeepCollectionEquality().equals(other.payeeID, payeeID) &&
            const DeepCollectionEquality().equals(other.payeeName, payeeName) &&
            const DeepCollectionEquality().equals(other.accountID, accountID) &&
            const DeepCollectionEquality()
                .equals(other.accountName, accountName) &&
            const DeepCollectionEquality()
                .equals(other.accountBalance, accountBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(dateInMillisecondsSinceEpoch),
      const DeepCollectionEquality().hash(isInitialTransaction),
      const DeepCollectionEquality().hash(subcatID),
      const DeepCollectionEquality().hash(subcatName),
      const DeepCollectionEquality().hash(subcatCategoryId),
      const DeepCollectionEquality().hash(payeeID),
      const DeepCollectionEquality().hash(payeeName),
      const DeepCollectionEquality().hash(accountID),
      const DeepCollectionEquality().hash(accountName),
      const DeepCollectionEquality().hash(accountBalance));

  @JsonKey(ignore: true)
  @override
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
