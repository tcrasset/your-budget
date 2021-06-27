// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PayeeTearOff {
  const _$PayeeTearOff();

  _Payee call({required UniqueId id, required Name name}) {
    return _Payee(
      id: id,
      name: name,
    );
  }
}

/// @nodoc
const $Payee = _$PayeeTearOff();

/// @nodoc
mixin _$Payee {
  UniqueId get id => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PayeeCopyWith<Payee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayeeCopyWith<$Res> {
  factory $PayeeCopyWith(Payee value, $Res Function(Payee) then) =
      _$PayeeCopyWithImpl<$Res>;
  $Res call({UniqueId id, Name name});
}

/// @nodoc
class _$PayeeCopyWithImpl<$Res> implements $PayeeCopyWith<$Res> {
  _$PayeeCopyWithImpl(this._value, this._then);

  final Payee _value;
  // ignore: unused_field
  final $Res Function(Payee) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
    ));
  }
}

/// @nodoc
abstract class _$PayeeCopyWith<$Res> implements $PayeeCopyWith<$Res> {
  factory _$PayeeCopyWith(_Payee value, $Res Function(_Payee) then) =
      __$PayeeCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, Name name});
}

/// @nodoc
class __$PayeeCopyWithImpl<$Res> extends _$PayeeCopyWithImpl<$Res>
    implements _$PayeeCopyWith<$Res> {
  __$PayeeCopyWithImpl(_Payee _value, $Res Function(_Payee) _then)
      : super(_value, (v) => _then(v as _Payee));

  @override
  _Payee get _value => super._value as _Payee;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_Payee(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
    ));
  }
}

/// @nodoc

class _$_Payee extends _Payee {
  const _$_Payee({required this.id, required this.name}) : super._();

  @override
  final UniqueId id;
  @override
  final Name name;

  @override
  String toString() {
    return 'Payee(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Payee &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$PayeeCopyWith<_Payee> get copyWith =>
      __$PayeeCopyWithImpl<_Payee>(this, _$identity);
}

abstract class _Payee extends Payee {
  const factory _Payee({required UniqueId id, required Name name}) = _$_Payee;
  const _Payee._() : super._();

  @override
  UniqueId get id => throw _privateConstructorUsedError;
  @override
  Name get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PayeeCopyWith<_Payee> get copyWith => throw _privateConstructorUsedError;
}
