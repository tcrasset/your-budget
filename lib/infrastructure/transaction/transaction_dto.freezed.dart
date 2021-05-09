// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transaction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MoneyTransactionDTO _$MoneyTransactionDTOFromJson(Map<String, dynamic> json) {
  return _TransactionDTO.fromJson(json);
}

/// @nodoc
class _$MoneyTransactionDTOTearOff {
  const _$MoneyTransactionDTOTearOff();

// ignore: unused_element
  _TransactionDTO call(
      {@JsonKey(ignore: true) String id,
      @required String subcatID,
      @required String subcatName,
      @required String payeeID,
      @required String payeeName,
      @required String accountID,
      @required String accountName,
      @required double amount,
      @required String memo,
      @required int dateInMillisecondsSinceEpoch}) {
    return _TransactionDTO(
      id: id,
      subcatID: subcatID,
      subcatName: subcatName,
      payeeID: payeeID,
      payeeName: payeeName,
      accountID: accountID,
      accountName: accountName,
      amount: amount,
      memo: memo,
      dateInMillisecondsSinceEpoch: dateInMillisecondsSinceEpoch,
    );
  }

// ignore: unused_element
  MoneyTransactionDTO fromJson(Map<String, Object> json) {
    return MoneyTransactionDTO.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $MoneyTransactionDTO = _$MoneyTransactionDTOTearOff();

/// @nodoc
mixin _$MoneyTransactionDTO {
  @JsonKey(ignore: true)
  String get id;
  String get subcatID;
  String get subcatName;
  String get payeeID;
  String get payeeName;
  String get accountID;
  String get accountName;
  double get amount;
  String get memo;
  int get dateInMillisecondsSinceEpoch;

  Map<String, dynamic> toJson();
  $MoneyTransactionDTOCopyWith<MoneyTransactionDTO> get copyWith;
}

/// @nodoc
abstract class $MoneyTransactionDTOCopyWith<$Res> {
  factory $MoneyTransactionDTOCopyWith(
          MoneyTransactionDTO value, $Res Function(MoneyTransactionDTO) then) =
      _$MoneyTransactionDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String subcatID,
      String subcatName,
      String payeeID,
      String payeeName,
      String accountID,
      String accountName,
      double amount,
      String memo,
      int dateInMillisecondsSinceEpoch});
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
    Object id = freezed,
    Object subcatID = freezed,
    Object subcatName = freezed,
    Object payeeID = freezed,
    Object payeeName = freezed,
    Object accountID = freezed,
    Object accountName = freezed,
    Object amount = freezed,
    Object memo = freezed,
    Object dateInMillisecondsSinceEpoch = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      subcatID: subcatID == freezed ? _value.subcatID : subcatID as String,
      subcatName:
          subcatName == freezed ? _value.subcatName : subcatName as String,
      payeeID: payeeID == freezed ? _value.payeeID : payeeID as String,
      payeeName: payeeName == freezed ? _value.payeeName : payeeName as String,
      accountID: accountID == freezed ? _value.accountID : accountID as String,
      accountName:
          accountName == freezed ? _value.accountName : accountName as String,
      amount: amount == freezed ? _value.amount : amount as double,
      memo: memo == freezed ? _value.memo : memo as String,
      dateInMillisecondsSinceEpoch: dateInMillisecondsSinceEpoch == freezed
          ? _value.dateInMillisecondsSinceEpoch
          : dateInMillisecondsSinceEpoch as int,
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
      {@JsonKey(ignore: true) String id,
      String subcatID,
      String subcatName,
      String payeeID,
      String payeeName,
      String accountID,
      String accountName,
      double amount,
      String memo,
      int dateInMillisecondsSinceEpoch});
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
    Object id = freezed,
    Object subcatID = freezed,
    Object subcatName = freezed,
    Object payeeID = freezed,
    Object payeeName = freezed,
    Object accountID = freezed,
    Object accountName = freezed,
    Object amount = freezed,
    Object memo = freezed,
    Object dateInMillisecondsSinceEpoch = freezed,
  }) {
    return _then(_TransactionDTO(
      id: id == freezed ? _value.id : id as String,
      subcatID: subcatID == freezed ? _value.subcatID : subcatID as String,
      subcatName:
          subcatName == freezed ? _value.subcatName : subcatName as String,
      payeeID: payeeID == freezed ? _value.payeeID : payeeID as String,
      payeeName: payeeName == freezed ? _value.payeeName : payeeName as String,
      accountID: accountID == freezed ? _value.accountID : accountID as String,
      accountName:
          accountName == freezed ? _value.accountName : accountName as String,
      amount: amount == freezed ? _value.amount : amount as double,
      memo: memo == freezed ? _value.memo : memo as String,
      dateInMillisecondsSinceEpoch: dateInMillisecondsSinceEpoch == freezed
          ? _value.dateInMillisecondsSinceEpoch
          : dateInMillisecondsSinceEpoch as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TransactionDTO extends _TransactionDTO {
  const _$_TransactionDTO(
      {@JsonKey(ignore: true) this.id,
      @required this.subcatID,
      @required this.subcatName,
      @required this.payeeID,
      @required this.payeeName,
      @required this.accountID,
      @required this.accountName,
      @required this.amount,
      @required this.memo,
      @required this.dateInMillisecondsSinceEpoch})
      : assert(subcatID != null),
        assert(subcatName != null),
        assert(payeeID != null),
        assert(payeeName != null),
        assert(accountID != null),
        assert(accountName != null),
        assert(amount != null),
        assert(memo != null),
        assert(dateInMillisecondsSinceEpoch != null),
        super._();

  factory _$_TransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_TransactionDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String subcatID;
  @override
  final String subcatName;
  @override
  final String payeeID;
  @override
  final String payeeName;
  @override
  final String accountID;
  @override
  final String accountName;
  @override
  final double amount;
  @override
  final String memo;
  @override
  final int dateInMillisecondsSinceEpoch;

  @override
  String toString() {
    return 'MoneyTransactionDTO(id: $id, subcatID: $subcatID, subcatName: $subcatName, payeeID: $payeeID, payeeName: $payeeName, accountID: $accountID, accountName: $accountName, amount: $amount, memo: $memo, dateInMillisecondsSinceEpoch: $dateInMillisecondsSinceEpoch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.subcatID, subcatID) ||
                const DeepCollectionEquality()
                    .equals(other.subcatID, subcatID)) &&
            (identical(other.subcatName, subcatName) ||
                const DeepCollectionEquality()
                    .equals(other.subcatName, subcatName)) &&
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
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.dateInMillisecondsSinceEpoch,
                    dateInMillisecondsSinceEpoch) ||
                const DeepCollectionEquality().equals(
                    other.dateInMillisecondsSinceEpoch,
                    dateInMillisecondsSinceEpoch)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(subcatID) ^
      const DeepCollectionEquality().hash(subcatName) ^
      const DeepCollectionEquality().hash(payeeID) ^
      const DeepCollectionEquality().hash(payeeName) ^
      const DeepCollectionEquality().hash(accountID) ^
      const DeepCollectionEquality().hash(accountName) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(dateInMillisecondsSinceEpoch);

  @override
  _$TransactionDTOCopyWith<_TransactionDTO> get copyWith =>
      __$TransactionDTOCopyWithImpl<_TransactionDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransactionDTOToJson(this);
  }
}

abstract class _TransactionDTO extends MoneyTransactionDTO {
  const _TransactionDTO._() : super._();
  const factory _TransactionDTO(
      {@JsonKey(ignore: true) String id,
      @required String subcatID,
      @required String subcatName,
      @required String payeeID,
      @required String payeeName,
      @required String accountID,
      @required String accountName,
      @required double amount,
      @required String memo,
      @required int dateInMillisecondsSinceEpoch}) = _$_TransactionDTO;

  factory _TransactionDTO.fromJson(Map<String, dynamic> json) =
      _$_TransactionDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get subcatID;
  @override
  String get subcatName;
  @override
  String get payeeID;
  @override
  String get payeeName;
  @override
  String get accountID;
  @override
  String get accountName;
  @override
  double get amount;
  @override
  String get memo;
  @override
  int get dateInMillisecondsSinceEpoch;
  @override
  _$TransactionDTOCopyWith<_TransactionDTO> get copyWith;
}
