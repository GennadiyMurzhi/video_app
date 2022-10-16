// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscriptions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubscriptionsState {
  bool get loading => throw _privateConstructorUsedError;
  Option<Either<Failure, Unit>> get subscriptionFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionsStateCopyWith<SubscriptionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionsStateCopyWith<$Res> {
  factory $SubscriptionsStateCopyWith(
          SubscriptionsState value, $Res Function(SubscriptionsState) then) =
      _$SubscriptionsStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      Option<Either<Failure, Unit>> subscriptionFailureOrSuccessOption});
}

/// @nodoc
class _$SubscriptionsStateCopyWithImpl<$Res>
    implements $SubscriptionsStateCopyWith<$Res> {
  _$SubscriptionsStateCopyWithImpl(this._value, this._then);

  final SubscriptionsState _value;
  // ignore: unused_field
  final $Res Function(SubscriptionsState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? subscriptionFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      subscriptionFailureOrSuccessOption: subscriptionFailureOrSuccessOption ==
              freezed
          ? _value.subscriptionFailureOrSuccessOption
          : subscriptionFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_SubscriptionsStateCopyWith<$Res>
    implements $SubscriptionsStateCopyWith<$Res> {
  factory _$$_SubscriptionsStateCopyWith(_$_SubscriptionsState value,
          $Res Function(_$_SubscriptionsState) then) =
      __$$_SubscriptionsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      Option<Either<Failure, Unit>> subscriptionFailureOrSuccessOption});
}

/// @nodoc
class __$$_SubscriptionsStateCopyWithImpl<$Res>
    extends _$SubscriptionsStateCopyWithImpl<$Res>
    implements _$$_SubscriptionsStateCopyWith<$Res> {
  __$$_SubscriptionsStateCopyWithImpl(
      _$_SubscriptionsState _value, $Res Function(_$_SubscriptionsState) _then)
      : super(_value, (v) => _then(v as _$_SubscriptionsState));

  @override
  _$_SubscriptionsState get _value => super._value as _$_SubscriptionsState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? subscriptionFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_SubscriptionsState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      subscriptionFailureOrSuccessOption: subscriptionFailureOrSuccessOption ==
              freezed
          ? _value.subscriptionFailureOrSuccessOption
          : subscriptionFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_SubscriptionsState implements _SubscriptionsState {
  const _$_SubscriptionsState(
      {required this.loading,
      required this.subscriptionFailureOrSuccessOption});

  @override
  final bool loading;
  @override
  final Option<Either<Failure, Unit>> subscriptionFailureOrSuccessOption;

  @override
  String toString() {
    return 'SubscriptionsState(loading: $loading, subscriptionFailureOrSuccessOption: $subscriptionFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubscriptionsState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(
                other.subscriptionFailureOrSuccessOption,
                subscriptionFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(subscriptionFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_SubscriptionsStateCopyWith<_$_SubscriptionsState> get copyWith =>
      __$$_SubscriptionsStateCopyWithImpl<_$_SubscriptionsState>(
          this, _$identity);
}

abstract class _SubscriptionsState implements SubscriptionsState {
  const factory _SubscriptionsState(
      {required final bool loading,
      required final Option<Either<Failure, Unit>>
          subscriptionFailureOrSuccessOption}) = _$_SubscriptionsState;

  @override
  bool get loading;
  @override
  Option<Either<Failure, Unit>> get subscriptionFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionsStateCopyWith<_$_SubscriptionsState> get copyWith =>
      throw _privateConstructorUsedError;
}
