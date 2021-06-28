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
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required String id,
      required String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required String subcatName,
      required String payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required String payeeName,
      required String accountID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required String accountName,
      required double amount,
      required String memo,
      required int dateInMillisecondsSinceEpoch}) {
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

  MoneyTransactionDTO fromJson(Map<String, Object> json) {
    return MoneyTransactionDTO.fromJson(json);
  }
}

/// @nodoc
const $MoneyTransactionDTO = _$MoneyTransactionDTOTearOff();

/// @nodoc
mixin _$MoneyTransactionDTO {
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id => throw _privateConstructorUsedError;
  String get subcatID => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get subcatName => throw _privateConstructorUsedError;
  String get payeeID => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get payeeName => throw _privateConstructorUsedError;
  String get accountID => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get accountName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  int get dateInMillisecondsSinceEpoch => throw _privateConstructorUsedError;

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
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String subcatName,
      String payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String payeeName,
      String accountID,
      @JsonKey(toJson: ignore, includeIfNull: false)
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
    Object? id = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? payeeID = freezed,
    Object? payeeName = freezed,
    Object? accountID = freezed,
    Object? accountName = freezed,
    Object? amount = freezed,
    Object? memo = freezed,
    Object? dateInMillisecondsSinceEpoch = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subcatID: subcatID == freezed
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String,
      subcatName: subcatName == freezed
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String subcatName,
      String payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          String payeeName,
      String accountID,
      @JsonKey(toJson: ignore, includeIfNull: false)
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
    Object? id = freezed,
    Object? subcatID = freezed,
    Object? subcatName = freezed,
    Object? payeeID = freezed,
    Object? payeeName = freezed,
    Object? accountID = freezed,
    Object? accountName = freezed,
    Object? amount = freezed,
    Object? memo = freezed,
    Object? dateInMillisecondsSinceEpoch = freezed,
  }) {
    return _then(_TransactionDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subcatID: subcatID == freezed
          ? _value.subcatID
          : subcatID // ignore: cast_nullable_to_non_nullable
              as String,
      subcatName: subcatName == freezed
          ? _value.subcatName
          : subcatName // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionDTO extends _TransactionDTO {
  const _$_TransactionDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required this.id,
      required this.subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required this.subcatName,
      required this.payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required this.payeeName,
      required this.accountID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required this.accountName,
      required this.amount,
      required this.memo,
      required this.dateInMillisecondsSinceEpoch})
      : super._();

  factory _$_TransactionDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_TransactionDTOFromJson(json);

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  final String id;
  @override
  final String subcatID;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final String subcatName;
  @override
  final String payeeID;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final String payeeName;
  @override
  final String accountID;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
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
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required String id,
      required String subcatID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required String subcatName,
      required String payeeID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required String payeeName,
      required String accountID,
      @JsonKey(toJson: ignore, includeIfNull: false)
          required String accountName,
      required double amount,
      required String memo,
      required int dateInMillisecondsSinceEpoch}) = _$_TransactionDTO;
  const _TransactionDTO._() : super._();

  factory _TransactionDTO.fromJson(Map<String, dynamic> json) =
      _$_TransactionDTO.fromJson;

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id => throw _privateConstructorUsedError;
  @override
  String get subcatID => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get subcatName => throw _privateConstructorUsedError;
  @override
  String get payeeID => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get payeeName => throw _privateConstructorUsedError;
  @override
  String get accountID => throw _privateConstructorUsedError;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  String get accountName => throw _privateConstructorUsedError;
  @override
  double get amount => throw _privateConstructorUsedError;
  @override
  String get memo => throw _privateConstructorUsedError;
  @override
  int get dateInMillisecondsSinceEpoch => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransactionDTOCopyWith<_TransactionDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
