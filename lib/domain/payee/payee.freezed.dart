// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$PayeeCopyWithImpl<$Res, Payee>;
  @useResult
  $Res call({UniqueId id, Name name});
}

/// @nodoc
class _$PayeeCopyWithImpl<$Res, $Val extends Payee>
    implements $PayeeCopyWith<$Res> {
  _$PayeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PayeeCopyWith<$Res> implements $PayeeCopyWith<$Res> {
  factory _$$_PayeeCopyWith(_$_Payee value, $Res Function(_$_Payee) then) =
      __$$_PayeeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId id, Name name});
}

/// @nodoc
class __$$_PayeeCopyWithImpl<$Res> extends _$PayeeCopyWithImpl<$Res, _$_Payee>
    implements _$$_PayeeCopyWith<$Res> {
  __$$_PayeeCopyWithImpl(_$_Payee _value, $Res Function(_$_Payee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_Payee(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
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
        (other.runtimeType == runtimeType &&
            other is _$_Payee &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PayeeCopyWith<_$_Payee> get copyWith =>
      __$$_PayeeCopyWithImpl<_$_Payee>(this, _$identity);
}

abstract class _Payee extends Payee {
  const factory _Payee({required final UniqueId id, required final Name name}) =
      _$_Payee;
  const _Payee._() : super._();

  @override
  UniqueId get id;
  @override
  Name get name;
  @override
  @JsonKey(ignore: true)
  _$$_PayeeCopyWith<_$_Payee> get copyWith =>
      throw _privateConstructorUsedError;
}
