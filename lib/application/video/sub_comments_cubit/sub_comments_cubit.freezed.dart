// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sub_comments_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubCommentsState {
  bool get isOpen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubCommentsStateCopyWith<SubCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCommentsStateCopyWith<$Res> {
  factory $SubCommentsStateCopyWith(
          SubCommentsState value, $Res Function(SubCommentsState) then) =
      _$SubCommentsStateCopyWithImpl<$Res>;
  $Res call({bool isOpen});
}

/// @nodoc
class _$SubCommentsStateCopyWithImpl<$Res>
    implements $SubCommentsStateCopyWith<$Res> {
  _$SubCommentsStateCopyWithImpl(this._value, this._then);

  final SubCommentsState _value;
  // ignore: unused_field
  final $Res Function(SubCommentsState) _then;

  @override
  $Res call({
    Object? isOpen = freezed,
  }) {
    return _then(_value.copyWith(
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SubCommentsStateCopyWith<$Res>
    implements $SubCommentsStateCopyWith<$Res> {
  factory _$$_SubCommentsStateCopyWith(
          _$_SubCommentsState value, $Res Function(_$_SubCommentsState) then) =
      __$$_SubCommentsStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isOpen});
}

/// @nodoc
class __$$_SubCommentsStateCopyWithImpl<$Res>
    extends _$SubCommentsStateCopyWithImpl<$Res>
    implements _$$_SubCommentsStateCopyWith<$Res> {
  __$$_SubCommentsStateCopyWithImpl(
      _$_SubCommentsState _value, $Res Function(_$_SubCommentsState) _then)
      : super(_value, (v) => _then(v as _$_SubCommentsState));

  @override
  _$_SubCommentsState get _value => super._value as _$_SubCommentsState;

  @override
  $Res call({
    Object? isOpen = freezed,
  }) {
    return _then(_$_SubCommentsState(
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SubCommentsState implements _SubCommentsState {
  const _$_SubCommentsState({required this.isOpen});

  @override
  final bool isOpen;

  @override
  String toString() {
    return 'SubCommentsState(isOpen: $isOpen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubCommentsState &&
            const DeepCollectionEquality().equals(other.isOpen, isOpen));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isOpen));

  @JsonKey(ignore: true)
  @override
  _$$_SubCommentsStateCopyWith<_$_SubCommentsState> get copyWith =>
      __$$_SubCommentsStateCopyWithImpl<_$_SubCommentsState>(this, _$identity);
}

abstract class _SubCommentsState implements SubCommentsState {
  const factory _SubCommentsState({required final bool isOpen}) =
      _$_SubCommentsState;

  @override
  bool get isOpen;
  @override
  @JsonKey(ignore: true)
  _$$_SubCommentsStateCopyWith<_$_SubCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
