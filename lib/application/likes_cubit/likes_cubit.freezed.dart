// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'likes_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikesState {
  bool get loading => throw _privateConstructorUsedError;
  Option<Either<Failure, Unit>> get likesFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikesStateCopyWith<LikesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikesStateCopyWith<$Res> {
  factory $LikesStateCopyWith(
          LikesState value, $Res Function(LikesState) then) =
      _$LikesStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      Option<Either<Failure, Unit>> likesFailureOrSuccessOption});
}

/// @nodoc
class _$LikesStateCopyWithImpl<$Res> implements $LikesStateCopyWith<$Res> {
  _$LikesStateCopyWithImpl(this._value, this._then);

  final LikesState _value;
  // ignore: unused_field
  final $Res Function(LikesState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? likesFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      likesFailureOrSuccessOption: likesFailureOrSuccessOption == freezed
          ? _value.likesFailureOrSuccessOption
          : likesFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_LikesStateCopyWith<$Res>
    implements $LikesStateCopyWith<$Res> {
  factory _$$_LikesStateCopyWith(
          _$_LikesState value, $Res Function(_$_LikesState) then) =
      __$$_LikesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      Option<Either<Failure, Unit>> likesFailureOrSuccessOption});
}

/// @nodoc
class __$$_LikesStateCopyWithImpl<$Res> extends _$LikesStateCopyWithImpl<$Res>
    implements _$$_LikesStateCopyWith<$Res> {
  __$$_LikesStateCopyWithImpl(
      _$_LikesState _value, $Res Function(_$_LikesState) _then)
      : super(_value, (v) => _then(v as _$_LikesState));

  @override
  _$_LikesState get _value => super._value as _$_LikesState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? likesFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_LikesState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      likesFailureOrSuccessOption: likesFailureOrSuccessOption == freezed
          ? _value.likesFailureOrSuccessOption
          : likesFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_LikesState implements _LikesState {
  const _$_LikesState(
      {required this.loading, required this.likesFailureOrSuccessOption});

  @override
  final bool loading;
  @override
  final Option<Either<Failure, Unit>> likesFailureOrSuccessOption;

  @override
  String toString() {
    return 'LikesState(loading: $loading, likesFailureOrSuccessOption: $likesFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikesState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(
                other.likesFailureOrSuccessOption,
                likesFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(likesFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_LikesStateCopyWith<_$_LikesState> get copyWith =>
      __$$_LikesStateCopyWithImpl<_$_LikesState>(this, _$identity);
}

abstract class _LikesState implements LikesState {
  const factory _LikesState(
      {required final bool loading,
      required final Option<Either<Failure, Unit>>
          likesFailureOrSuccessOption}) = _$_LikesState;

  @override
  bool get loading;
  @override
  Option<Either<Failure, Unit>> get likesFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_LikesStateCopyWith<_$_LikesState> get copyWith =>
      throw _privateConstructorUsedError;
}
