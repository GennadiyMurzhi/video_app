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
  String get videoName => throw _privateConstructorUsedError;
  String get videoFileId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  ChewieController? get chewieController => throw _privateConstructorUsedError;
  Option<Either<Failure, Success>> get videoFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoStateCopyWith<VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStateCopyWith<$Res> {
  factory $VideoStateCopyWith(
          VideoState value, $Res Function(VideoState) then) =
      _$VideoStateCopyWithImpl<$Res>;
  $Res call(
      {VideoStatus videoStatus,
      String videoName,
      String videoFileId,
      String userId,
      ChewieController? chewieController,
      Option<Either<Failure, Success>> videoFailureOrSuccessOption});
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
    Object? videoName = freezed,
    Object? videoFileId = freezed,
    Object? userId = freezed,
    Object? chewieController = freezed,
    Object? videoFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      videoStatus: videoStatus == freezed
          ? _value.videoStatus
          : videoStatus // ignore: cast_nullable_to_non_nullable
              as VideoStatus,
      videoName: videoName == freezed
          ? _value.videoName
          : videoName // ignore: cast_nullable_to_non_nullable
              as String,
      videoFileId: videoFileId == freezed
          ? _value.videoFileId
          : videoFileId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      chewieController: chewieController == freezed
          ? _value.chewieController
          : chewieController // ignore: cast_nullable_to_non_nullable
              as ChewieController?,
      videoFailureOrSuccessOption: videoFailureOrSuccessOption == freezed
          ? _value.videoFailureOrSuccessOption
          : videoFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Success>>,
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
  $Res call(
      {VideoStatus videoStatus,
      String videoName,
      String videoFileId,
      String userId,
      ChewieController? chewieController,
      Option<Either<Failure, Success>> videoFailureOrSuccessOption});
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
    Object? videoName = freezed,
    Object? videoFileId = freezed,
    Object? userId = freezed,
    Object? chewieController = freezed,
    Object? videoFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_VideoState(
      videoStatus: videoStatus == freezed
          ? _value.videoStatus
          : videoStatus // ignore: cast_nullable_to_non_nullable
              as VideoStatus,
      videoName: videoName == freezed
          ? _value.videoName
          : videoName // ignore: cast_nullable_to_non_nullable
              as String,
      videoFileId: videoFileId == freezed
          ? _value.videoFileId
          : videoFileId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      chewieController: chewieController == freezed
          ? _value.chewieController
          : chewieController // ignore: cast_nullable_to_non_nullable
              as ChewieController?,
      videoFailureOrSuccessOption: videoFailureOrSuccessOption == freezed
          ? _value.videoFailureOrSuccessOption
          : videoFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Success>>,
    ));
  }
}

/// @nodoc

class _$_VideoState with DiagnosticableTreeMixin implements _VideoState {
  const _$_VideoState(
      {required this.videoStatus,
      required this.videoName,
      required this.videoFileId,
      required this.userId,
      required this.chewieController,
      required this.videoFailureOrSuccessOption});

  @override
  final VideoStatus videoStatus;
  @override
  final String videoName;
  @override
  final String videoFileId;
  @override
  final String userId;
  @override
  final ChewieController? chewieController;
  @override
  final Option<Either<Failure, Success>> videoFailureOrSuccessOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VideoState(videoStatus: $videoStatus, videoName: $videoName, videoFileId: $videoFileId, userId: $userId, chewieController: $chewieController, videoFailureOrSuccessOption: $videoFailureOrSuccessOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VideoState'))
      ..add(DiagnosticsProperty('videoStatus', videoStatus))
      ..add(DiagnosticsProperty('videoName', videoName))
      ..add(DiagnosticsProperty('videoFileId', videoFileId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('chewieController', chewieController))
      ..add(DiagnosticsProperty(
          'videoFailureOrSuccessOption', videoFailureOrSuccessOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoState &&
            const DeepCollectionEquality()
                .equals(other.videoStatus, videoStatus) &&
            const DeepCollectionEquality().equals(other.videoName, videoName) &&
            const DeepCollectionEquality()
                .equals(other.videoFileId, videoFileId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.chewieController, chewieController) &&
            const DeepCollectionEquality().equals(
                other.videoFailureOrSuccessOption,
                videoFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(videoStatus),
      const DeepCollectionEquality().hash(videoName),
      const DeepCollectionEquality().hash(videoFileId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(chewieController),
      const DeepCollectionEquality().hash(videoFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_VideoStateCopyWith<_$_VideoState> get copyWith =>
      __$$_VideoStateCopyWithImpl<_$_VideoState>(this, _$identity);
}

abstract class _VideoState implements VideoState {
  const factory _VideoState(
      {required final VideoStatus videoStatus,
      required final String videoName,
      required final String videoFileId,
      required final String userId,
      required final ChewieController? chewieController,
      required final Option<Either<Failure, Success>>
          videoFailureOrSuccessOption}) = _$_VideoState;

  @override
  VideoStatus get videoStatus;
  @override
  String get videoName;
  @override
  String get videoFileId;
  @override
  String get userId;
  @override
  ChewieController? get chewieController;
  @override
  Option<Either<Failure, Success>> get videoFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_VideoStateCopyWith<_$_VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}
