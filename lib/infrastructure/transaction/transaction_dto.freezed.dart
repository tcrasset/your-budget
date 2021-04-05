// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transaction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MoneyTransactionDTO _$MoneyTransactionDTOFromJson(Map<String, dynamic> json) {
  return _MoneyTransactionDTO.fromJson(json);
}

/// @nodoc
class _$MoneyTransactionDTOTearOff {
  const _$MoneyTransactionDTOTearOff();

// ignore: unused_element
  _MoneyTransactionDTO call(
      {@JsonKey(ignore: true) int id,
      @required int subcatID,
      @required int payeeID,
      @required int accountID,
      @required double amount,
      @required String memo,
      @required int dateInMillisecondsSinceEpoch}) {
    return _MoneyTransactionDTO(
      id: id,
      subcatID: subcatID,
      payeeID: payeeID,
      accountID: accountID,
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
  int get id;
  int get subcatID;
  int get payeeID;
  int get accountID;
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
      {@JsonKey(ignore: true) int id,
      int subcatID,
      int payeeID,
      int accountID,
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
    Object payeeID = freezed,
    Object accountID = freezed,
    Object amount = freezed,
    Object memo = freezed,
    Object dateInMillisecondsSinceEpoch = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      subcatID: subcatID == freezed ? _value.subcatID : subcatID as int,
      payeeID: payeeID == freezed ? _value.payeeID : payeeID as int,
      accountID: accountID == freezed ? _value.accountID : accountID as int,
      amount: amount == freezed ? _value.amount : amount as double,
      memo: memo == freezed ? _value.memo : memo as String,
      dateInMillisecondsSinceEpoch: dateInMillisecondsSinceEpoch == freezed
          ? _value.dateInMillisecondsSinceEpoch
          : dateInMillisecondsSinceEpoch as int,
    ));
  }
}

/// @nodoc
abstract class _$MoneyTransactionDTOCopyWith<$Res>
    implements $MoneyTransactionDTOCopyWith<$Res> {
  factory _$MoneyTransactionDTOCopyWith(_MoneyTransactionDTO value,
          $Res Function(_MoneyTransactionDTO) then) =
      __$MoneyTransactionDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) int id,
      int subcatID,
      int payeeID,
      int accountID,
      double amount,
      String memo,
      int dateInMillisecondsSinceEpoch});
}

/// @nodoc
class __$MoneyTransactionDTOCopyWithImpl<$Res>
    extends _$MoneyTransactionDTOCopyWithImpl<$Res>
    implements _$MoneyTransactionDTOCopyWith<$Res> {
  __$MoneyTransactionDTOCopyWithImpl(
      _MoneyTransactionDTO _value, $Res Function(_MoneyTransactionDTO) _then)
      : super(_value, (v) => _then(v as _MoneyTransactionDTO));

  @override
  _MoneyTransactionDTO get _value => super._value as _MoneyTransactionDTO;

  @override
  $Res call({
    Object id = freezed,
    Object subcatID = freezed,
    Object payeeID = freezed,
    Object accountID = freezed,
    Object amount = freezed,
    Object memo = freezed,
    Object dateInMillisecondsSinceEpoch = freezed,
  }) {
    return _then(_MoneyTransactionDTO(
      id: id == freezed ? _value.id : id as int,
      subcatID: subcatID == freezed ? _value.subcatID : subcatID as int,
      payeeID: payeeID == freezed ? _value.payeeID : payeeID as int,
      accountID: accountID == freezed ? _value.accountID : accountID as int,
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
class _$_MoneyTransactionDTO extends _MoneyTransactionDTO {
  const _$_MoneyTransactionDTO(
      {@JsonKey(ignore: true) this.id,
      @required this.subcatID,
      @required this.payeeID,
      @required this.accountID,
      @required this.amount,
      @required this.memo,
      @required this.dateInMillisecondsSinceEpoch})
      : assert(subcatID != null),
        assert(payeeID != null),
        assert(accountID != null),
        assert(amount != null),
        assert(memo != null),
        assert(dateInMillisecondsSinceEpoch != null),
        super._();

  factory _$_MoneyTransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_MoneyTransactionDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final int id;
  @override
  final int subcatID;
  @override
  final int payeeID;
  @override
  final int accountID;
  @override
  final double amount;
  @override
  final String memo;
  @override
  final int dateInMillisecondsSinceEpoch;

  @override
  String toString() {
    return 'MoneyTransactionDTO(id: $id, subcatID: $subcatID, payeeID: $payeeID, accountID: $accountID, amount: $amount, memo: $memo, dateInMillisecondsSinceEpoch: $dateInMillisecondsSinceEpoch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MoneyTransactionDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.subcatID, subcatID) ||
                const DeepCollectionEquality()
                    .equals(other.subcatID, subcatID)) &&
            (identical(other.payeeID, payeeID) ||
                const DeepCollectionEquality()
                    .equals(other.payeeID, payeeID)) &&
            (identical(other.accountID, accountID) ||
                const DeepCollectionEquality()
                    .equals(other.accountID, accountID)) &&
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
      const DeepCollectionEquality().hash(payeeID) ^
      const DeepCollectionEquality().hash(accountID) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(dateInMillisecondsSinceEpoch);

  @override
  _$MoneyTransactionDTOCopyWith<_MoneyTransactionDTO> get copyWith =>
      __$MoneyTransactionDTOCopyWithImpl<_MoneyTransactionDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MoneyTransactionDTOToJson(this);
  }
}

abstract class _MoneyTransactionDTO extends MoneyTransactionDTO {
  const _MoneyTransactionDTO._() : super._();
  const factory _MoneyTransactionDTO(
      {@JsonKey(ignore: true) int id,
      @required int subcatID,
      @required int payeeID,
      @required int accountID,
      @required double amount,
      @required String memo,
      @required int dateInMillisecondsSinceEpoch}) = _$_MoneyTransactionDTO;

  factory _MoneyTransactionDTO.fromJson(Map<String, dynamic> json) =
      _$_MoneyTransactionDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  int get id;
  @override
  int get subcatID;
  @override
  int get payeeID;
  @override
  int get accountID;
  @override
  double get amount;
  @override
  String get memo;
  @override
  int get dateInMillisecondsSinceEpoch;
  @override
  _$MoneyTransactionDTOCopyWith<_MoneyTransactionDTO> get copyWith;
}
