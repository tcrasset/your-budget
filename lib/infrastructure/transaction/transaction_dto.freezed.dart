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
  String get receiverId => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get giverName => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  double? get giverBalance =>
      throw _privateConstructorUsedError; // optional because payee does not have balance
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
      String receiverId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String giverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          double? giverBalance,
      String giverId});
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
    Object? type = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? subcatCategoryId = freezed,
    Object? receiverName = freezed,
    Object? receiverBalance = freezed,
    Object? receiverId = freezed,
    Object? giverName = freezed,
    Object? giverBalance = freezed,
    Object? giverId = freezed,
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
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      subcatID: subcatID == freezed
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String?,
      subcatName: subcatName == freezed
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as String?,
      subcatCategoryId: subcatCategoryId == freezed
          ? _value.subcatCategoryId
          : subcatCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverName: receiverName == freezed
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverBalance: receiverBalance == freezed
          ? _value.receiverBalance
          : receiverBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      giverName: giverName == freezed
          ? _value.giverName
          : giverName // ignore: cast_nullable_to_non_nullable
              as String,
      giverBalance: giverBalance == freezed
          ? _value.giverBalance
          : giverBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      giverId: giverId == freezed
          ? _value.giverId
          : giverId // ignore: cast_nullable_to_non_nullable
              as String,
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
      String receiverId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String giverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          double? giverBalance,
      String giverId});
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
    Object? type = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? subcatCategoryId = freezed,
    Object? receiverName = freezed,
    Object? receiverBalance = freezed,
    Object? receiverId = freezed,
    Object? giverName = freezed,
    Object? giverBalance = freezed,
    Object? giverId = freezed,
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
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      subcatID: subcatID == freezed
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String?,
      subcatName: subcatName == freezed
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
              as String?,
      subcatCategoryId: subcatCategoryId == freezed
          ? _value.subcatCategoryId
          : subcatCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverName: receiverName == freezed
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverBalance: receiverBalance == freezed
          ? _value.receiverBalance
          : receiverBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      giverName: giverName == freezed
          ? _value.giverName
          : giverName // ignore: cast_nullable_to_non_nullable
              as String,
      giverBalance: giverBalance == freezed
          ? _value.giverBalance
          : giverBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      giverId: giverId == freezed
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
      required this.receiverId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required this.giverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required this.giverBalance,
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
  final String receiverId;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final String giverName;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final double? giverBalance;
// optional because payee does not have balance
  @override
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
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(
                other.dateInMillisecondsSinceEpoch,
                dateInMillisecondsSinceEpoch) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.subcatID, subcatID) &&
            const DeepCollectionEquality()
                .equals(other.subcatName, subcatName) &&
            const DeepCollectionEquality()
                .equals(other.subcatCategoryId, subcatCategoryId) &&
            const DeepCollectionEquality()
                .equals(other.receiverName, receiverName) &&
            const DeepCollectionEquality()
                .equals(other.receiverBalance, receiverBalance) &&
            const DeepCollectionEquality()
                .equals(other.receiverId, receiverId) &&
            const DeepCollectionEquality().equals(other.giverName, giverName) &&
            const DeepCollectionEquality()
                .equals(other.giverBalance, giverBalance) &&
            const DeepCollectionEquality().equals(other.giverId, giverId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(dateInMillisecondsSinceEpoch),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(subcatID),
      const DeepCollectionEquality().hash(subcatName),
      const DeepCollectionEquality().hash(subcatCategoryId),
      const DeepCollectionEquality().hash(receiverName),
      const DeepCollectionEquality().hash(receiverBalance),
      const DeepCollectionEquality().hash(receiverId),
      const DeepCollectionEquality().hash(giverName),
      const DeepCollectionEquality().hash(giverBalance),
      const DeepCollectionEquality().hash(giverId));

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
      required final String receiverId,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required final String giverName,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required final double? giverBalance,
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
  String get receiverId;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get giverName;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  double? get giverBalance;
  @override // optional because payee does not have balance
  String get giverId;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDTOCopyWith<_$_TransactionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
