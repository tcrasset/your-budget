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
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_TYPE)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  String? get subcatID =>
      throw _privateConstructorUsedError; // optional because most transactions do not have subcategory
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
  String? get subcatName =>
      throw _privateConstructorUsedError; // optional because most transactions do not have subcategory
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.CAT_ID_OUTSIDE)
  String? get subcatCategoryId =>
      throw _privateConstructorUsedError; // optional because most transactions do not have subcat
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get receiverName => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  double? get receiverBalance =>
      throw _privateConstructorUsedError; // optional because payee does not have balance
  @JsonKey(fromJson: convertToString)
  String get receiverId => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get giverName => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  double? get giverBalance =>
      throw _privateConstructorUsedError; // optional because payee does not have balance
  @JsonKey(fromJson: convertToString)
  String get giverId => throw _privateConstructorUsedError;

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
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_TYPE)
          String type,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          String? subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          String? subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          String? subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String receiverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          double? receiverBalance,
      @JsonKey(fromJson: convertToString)
          String receiverId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String giverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          double? giverBalance,
      @JsonKey(fromJson: convertToString)
          String giverId});
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
    Object? type = null,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? subcatCategoryId = freezed,
    Object? receiverName = null,
    Object? receiverBalance = freezed,
    Object? receiverId = null,
    Object? giverName = null,
    Object? giverBalance = freezed,
    Object? giverId = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      subcatID: freezed == subcatID
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String?,
      subcatName: freezed == subcatName
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as String?,
      subcatCategoryId: freezed == subcatCategoryId
          ? _value.subcatCategoryId
          : subcatCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverBalance: freezed == receiverBalance
          ? _value.receiverBalance
          : receiverBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      giverName: null == giverName
          ? _value.giverName
          : giverName // ignore: cast_nullable_to_non_nullable
              as String,
      giverBalance: freezed == giverBalance
          ? _value.giverBalance
          : giverBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      giverId: null == giverId
          ? _value.giverId
          : giverId // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_TYPE)
          String type,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          String? subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          String? subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          String? subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String receiverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          double? receiverBalance,
      @JsonKey(fromJson: convertToString)
          String receiverId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String giverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          double? giverBalance,
      @JsonKey(fromJson: convertToString)
          String giverId});
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
    Object? type = null,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? subcatCategoryId = freezed,
    Object? receiverName = null,
    Object? receiverBalance = freezed,
    Object? receiverId = null,
    Object? giverName = null,
    Object? giverBalance = freezed,
    Object? giverId = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      subcatID: freezed == subcatID
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String?,
      subcatName: freezed == subcatName
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as String?,
      subcatCategoryId: freezed == subcatCategoryId
          ? _value.subcatCategoryId
          : subcatCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverBalance: freezed == receiverBalance
          ? _value.receiverBalance
          : receiverBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      giverName: null == giverName
          ? _value.giverName
          : giverName // ignore: cast_nullable_to_non_nullable
              as String,
      giverBalance: freezed == giverBalance
          ? _value.giverBalance
          : giverBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      giverId: null == giverId
          ? _value.giverId
          : giverId // ignore: cast_nullable_to_non_nullable
              as String,
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
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_TYPE)
          required this.type,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          required this.subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          required this.subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          required this.subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required this.receiverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required this.receiverBalance,
      @JsonKey(fromJson: convertToString)
          required this.receiverId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required this.giverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required this.giverBalance,
      @JsonKey(fromJson: convertToString)
          required this.giverId})
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
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_TYPE)
  final String type;
  @override
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  final String? subcatID;
// optional because most transactions do not have subcategory
  @override
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
  final String? subcatName;
// optional because most transactions do not have subcategory
  @override
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.CAT_ID_OUTSIDE)
  final String? subcatCategoryId;
// optional because most transactions do not have subcat
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final String receiverName;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final double? receiverBalance;
// optional because payee does not have balance
  @override
  @JsonKey(fromJson: convertToString)
  final String receiverId;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final String giverName;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final double? giverBalance;
// optional because payee does not have balance
  @override
  @JsonKey(fromJson: convertToString)
  final String giverId;

  @override
  String toString() {
    return 'MoneyTransactionDTO(id: $id, amount: $amount, memo: $memo, dateInMillisecondsSinceEpoch: $dateInMillisecondsSinceEpoch, type: $type, subcatID: $subcatID, subcatName: $subcatName, subcatCategoryId: $subcatCategoryId, receiverName: $receiverName, receiverBalance: $receiverBalance, receiverId: $receiverId, giverName: $giverName, giverBalance: $giverBalance, giverId: $giverId)';
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
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subcatID, subcatID) ||
                other.subcatID == subcatID) &&
            (identical(other.subcatName, subcatName) ||
                other.subcatName == subcatName) &&
            (identical(other.subcatCategoryId, subcatCategoryId) ||
                other.subcatCategoryId == subcatCategoryId) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.receiverBalance, receiverBalance) ||
                other.receiverBalance == receiverBalance) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.giverName, giverName) ||
                other.giverName == giverName) &&
            (identical(other.giverBalance, giverBalance) ||
                other.giverBalance == giverBalance) &&
            (identical(other.giverId, giverId) || other.giverId == giverId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      memo,
      dateInMillisecondsSinceEpoch,
      type,
      subcatID,
      subcatName,
      subcatCategoryId,
      receiverName,
      receiverBalance,
      receiverId,
      giverName,
      giverBalance,
      giverId);

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
      @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_TYPE)
          required final String type,
      @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
          required final String? subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
          required final String? subcatName,
      @JsonKey(toJson: ignore, includeIfNull: false, name: DatabaseConstants.CAT_ID_OUTSIDE)
          required final String? subcatCategoryId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required final String receiverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required final double? receiverBalance,
      @JsonKey(fromJson: convertToString)
          required final String receiverId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required final String giverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required final double? giverBalance,
      @JsonKey(fromJson: convertToString)
          required final String giverId}) = _$_TransactionDTO;
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
  @JsonKey(name: DatabaseConstants.MONEYTRANSACTION_TYPE)
  String get type;
  @override
  @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE)
  String? get subcatID;
  @override // optional because most transactions do not have subcategory
  @JsonKey(
      toJson: ignore, includeIfNull: false, name: DatabaseConstants.SUBCAT_NAME)
  String? get subcatName;
  @override // optional because most transactions do not have subcategory
  @JsonKey(
      toJson: ignore,
      includeIfNull: false,
      name: DatabaseConstants.CAT_ID_OUTSIDE)
  String? get subcatCategoryId;
  @override // optional because most transactions do not have subcat
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get receiverName;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  double? get receiverBalance;
  @override // optional because payee does not have balance
  @JsonKey(fromJson: convertToString)
  String get receiverId;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get giverName;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  double? get giverBalance;
  @override // optional because payee does not have balance
  @JsonKey(fromJson: convertToString)
  String get giverId;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDTOCopyWith<_$_TransactionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
