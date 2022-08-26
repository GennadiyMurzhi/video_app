// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoState {
  VideoStatus get videoStatus => throw _privateConstructorUsedError;
  ChewieController? get chewieController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoStateCopyWith<VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStateCopyWith<$Res> {
  factory $VideoStateCopyWith(
          VideoState value, $Res Function(VideoState) then) =
      _$VideoStateCopyWithImpl<$Res>;
  $Res call({VideoStatus videoStatus, ChewieController? chewieController});
}

/// @nodoc
class _$VideoStateCopyWithImpl<$Res> implements $VideoStateCopyWith<$Res> {
  _$VideoStateCopyWithImpl(this._value, this._then);

  final VideoState _value;
  // ignore: unused_field
  final $Res Function(VideoState) _then;

  @override
  $Res call({
    Object? videoStatus = freezed,
    Object? chewieController = freezed,
  }) {
    return _then(_value.copyWith(
      videoStatus: videoStatus == freezed
          ? _value.videoStatus
          : videoStatus // ignore: cast_nullable_to_non_nullable
              as VideoStatus,
      chewieController: chewieController == freezed
          ? _value.chewieController
          : chewieController // ignore: cast_nullable_to_non_nullable
              as ChewieController?,
    ));
  }
}

/// @nodoc
abstract class _$$_VideoStateCopyWith<$Res>
    implements $VideoStateCopyWith<$Res> {
  factory _$$_VideoStateCopyWith(
          _$_VideoState value, $Res Function(_$_VideoState) then) =
      __$$_VideoStateCopyWithImpl<$Res>;
  @override
  $Res call({VideoStatus videoStatus, ChewieController? chewieController});
}

/// @nodoc
class __$$_VideoStateCopyWithImpl<$Res> extends _$VideoStateCopyWithImpl<$Res>
    implements _$$_VideoStateCopyWith<$Res> {
  __$$_VideoStateCopyWithImpl(
      _$_VideoState _value, $Res Function(_$_VideoState) _then)
      : super(_value, (v) => _then(v as _$_VideoState));

  @override
  _$_VideoState get _value => super._value as _$_VideoState;

  @override
  $Res call({
    Object? videoStatus = freezed,
    Object? chewieController = freezed,
  }) {
    return _then(_$_VideoState(
      videoStatus: videoStatus == freezed
          ? _value.videoStatus
          : videoStatus // ignore: cast_nullable_to_non_nullable
              as VideoStatus,
      chewieController: chewieController == freezed
          ? _value.chewieController
          : chewieController // ignore: cast_nullable_to_non_nullable
              as ChewieController?,
    ));
  }
}

/// @nodoc

class _$_VideoState with DiagnosticableTreeMixin implements _VideoState {
  const _$_VideoState(
      {required this.videoStatus, required this.chewieController});

  @override
  final VideoStatus videoStatus;
  @override
  final ChewieController? chewieController;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VideoState(videoStatus: $videoStatus, chewieController: $chewieController)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VideoState'))
      ..add(DiagnosticsProperty('videoStatus', videoStatus))
      ..add(DiagnosticsProperty('chewieController', chewieController));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoState &&
            const DeepCollectionEquality()
                .equals(other.videoStatus, videoStatus) &&
            const DeepCollectionEquality()
                .equals(other.chewieController, chewieController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(videoStatus),
      const DeepCollectionEquality().hash(chewieController));

  @JsonKey(ignore: true)
  @override
  _$$_VideoStateCopyWith<_$_VideoState> get copyWith =>
      __$$_VideoStateCopyWithImpl<_$_VideoState>(this, _$identity);
}

abstract class _VideoState implements VideoState {
  const factory _VideoState(
      {required final VideoStatus videoStatus,
      required final ChewieController? chewieController}) = _$_VideoState;

  @override
  VideoStatus get videoStatus;
  @override
  ChewieController? get chewieController;
  @override
  @JsonKey(ignore: true)
  _$$_VideoStateCopyWith<_$_VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}
