// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoListState {
  bool get loading => throw _privateConstructorUsedError;
  Option<VideoEvent> get event => throw _privateConstructorUsedError;
  Option<Either<Failure, Unit>> get videoListFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoListStateCopyWith<VideoListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoListStateCopyWith<$Res> {
  factory $VideoListStateCopyWith(
          VideoListState value, $Res Function(VideoListState) then) =
      _$VideoListStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      Option<VideoEvent> event,
      Option<Either<Failure, Unit>> videoListFailureOrSuccessOption});
}

/// @nodoc
class _$VideoListStateCopyWithImpl<$Res>
    implements $VideoListStateCopyWith<$Res> {
  _$VideoListStateCopyWithImpl(this._value, this._then);

  final VideoListState _value;
  // ignore: unused_field
  final $Res Function(VideoListState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? event = freezed,
    Object? videoListFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Option<VideoEvent>,
      videoListFailureOrSuccessOption: videoListFailureOrSuccessOption ==
              freezed
          ? _value.videoListFailureOrSuccessOption
          : videoListFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_VideoListStateCopyWith<$Res>
    implements $VideoListStateCopyWith<$Res> {
  factory _$$_VideoListStateCopyWith(
          _$_VideoListState value, $Res Function(_$_VideoListState) then) =
      __$$_VideoListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      Option<VideoEvent> event,
      Option<Either<Failure, Unit>> videoListFailureOrSuccessOption});
}

/// @nodoc
class __$$_VideoListStateCopyWithImpl<$Res>
    extends _$VideoListStateCopyWithImpl<$Res>
    implements _$$_VideoListStateCopyWith<$Res> {
  __$$_VideoListStateCopyWithImpl(
      _$_VideoListState _value, $Res Function(_$_VideoListState) _then)
      : super(_value, (v) => _then(v as _$_VideoListState));

  @override
  _$_VideoListState get _value => super._value as _$_VideoListState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? event = freezed,
    Object? videoListFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_VideoListState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Option<VideoEvent>,
      videoListFailureOrSuccessOption: videoListFailureOrSuccessOption ==
              freezed
          ? _value.videoListFailureOrSuccessOption
          : videoListFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_VideoListState implements _VideoListState {
  const _$_VideoListState(
      {required this.loading,
      required this.event,
      required this.videoListFailureOrSuccessOption});

  @override
  final bool loading;
  @override
  final Option<VideoEvent> event;
  @override
  final Option<Either<Failure, Unit>> videoListFailureOrSuccessOption;

  @override
  String toString() {
    return 'VideoListState(loading: $loading, event: $event, videoListFailureOrSuccessOption: $videoListFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoListState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.event, event) &&
            const DeepCollectionEquality().equals(
                other.videoListFailureOrSuccessOption,
                videoListFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(event),
      const DeepCollectionEquality().hash(videoListFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_VideoListStateCopyWith<_$_VideoListState> get copyWith =>
      __$$_VideoListStateCopyWithImpl<_$_VideoListState>(this, _$identity);
}

abstract class _VideoListState implements VideoListState {
  const factory _VideoListState(
      {required final bool loading,
      required final Option<VideoEvent> event,
      required final Option<Either<Failure, Unit>>
          videoListFailureOrSuccessOption}) = _$_VideoListState;

  @override
  bool get loading;
  @override
  Option<VideoEvent> get event;
  @override
  Option<Either<Failure, Unit>> get videoListFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_VideoListStateCopyWith<_$_VideoListState> get copyWith =>
      throw _privateConstructorUsedError;
}
