// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newVideo,
    required TResult Function() deleted,
    required TResult Function() updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? newVideo,
    TResult Function()? deleted,
    TResult Function()? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newVideo,
    TResult Function()? deleted,
    TResult Function()? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewVideo value) newVideo,
    required TResult Function(Deleted value) deleted,
    required TResult Function(Updated value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewVideo value)? newVideo,
    TResult Function(Deleted value)? deleted,
    TResult Function(Updated value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewVideo value)? newVideo,
    TResult Function(Deleted value)? deleted,
    TResult Function(Updated value)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoEventCopyWith<$Res> {
  factory $VideoEventCopyWith(
          VideoEvent value, $Res Function(VideoEvent) then) =
      _$VideoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$VideoEventCopyWithImpl<$Res> implements $VideoEventCopyWith<$Res> {
  _$VideoEventCopyWithImpl(this._value, this._then);

  final VideoEvent _value;
  // ignore: unused_field
  final $Res Function(VideoEvent) _then;
}

/// @nodoc
abstract class _$$NewVideoCopyWith<$Res> {
  factory _$$NewVideoCopyWith(
          _$NewVideo value, $Res Function(_$NewVideo) then) =
      __$$NewVideoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewVideoCopyWithImpl<$Res> extends _$VideoEventCopyWithImpl<$Res>
    implements _$$NewVideoCopyWith<$Res> {
  __$$NewVideoCopyWithImpl(_$NewVideo _value, $Res Function(_$NewVideo) _then)
      : super(_value, (v) => _then(v as _$NewVideo));

  @override
  _$NewVideo get _value => super._value as _$NewVideo;
}

/// @nodoc

class _$NewVideo implements NewVideo {
  const _$NewVideo();

  @override
  String toString() {
    return 'VideoEvent.newVideo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewVideo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newVideo,
    required TResult Function() deleted,
    required TResult Function() updated,
  }) {
    return newVideo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? newVideo,
    TResult Function()? deleted,
    TResult Function()? updated,
  }) {
    return newVideo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newVideo,
    TResult Function()? deleted,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (newVideo != null) {
      return newVideo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewVideo value) newVideo,
    required TResult Function(Deleted value) deleted,
    required TResult Function(Updated value) updated,
  }) {
    return newVideo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewVideo value)? newVideo,
    TResult Function(Deleted value)? deleted,
    TResult Function(Updated value)? updated,
  }) {
    return newVideo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewVideo value)? newVideo,
    TResult Function(Deleted value)? deleted,
    TResult Function(Updated value)? updated,
    required TResult orElse(),
  }) {
    if (newVideo != null) {
      return newVideo(this);
    }
    return orElse();
  }
}

abstract class NewVideo implements VideoEvent {
  const factory NewVideo() = _$NewVideo;
}

/// @nodoc
abstract class _$$DeletedCopyWith<$Res> {
  factory _$$DeletedCopyWith(_$Deleted value, $Res Function(_$Deleted) then) =
      __$$DeletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletedCopyWithImpl<$Res> extends _$VideoEventCopyWithImpl<$Res>
    implements _$$DeletedCopyWith<$Res> {
  __$$DeletedCopyWithImpl(_$Deleted _value, $Res Function(_$Deleted) _then)
      : super(_value, (v) => _then(v as _$Deleted));

  @override
  _$Deleted get _value => super._value as _$Deleted;
}

/// @nodoc

class _$Deleted implements Deleted {
  const _$Deleted();

  @override
  String toString() {
    return 'VideoEvent.deleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Deleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newVideo,
    required TResult Function() deleted,
    required TResult Function() updated,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? newVideo,
    TResult Function()? deleted,
    TResult Function()? updated,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newVideo,
    TResult Function()? deleted,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewVideo value) newVideo,
    required TResult Function(Deleted value) deleted,
    required TResult Function(Updated value) updated,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewVideo value)? newVideo,
    TResult Function(Deleted value)? deleted,
    TResult Function(Updated value)? updated,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewVideo value)? newVideo,
    TResult Function(Deleted value)? deleted,
    TResult Function(Updated value)? updated,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class Deleted implements VideoEvent {
  const factory Deleted() = _$Deleted;
}

/// @nodoc
abstract class _$$UpdatedCopyWith<$Res> {
  factory _$$UpdatedCopyWith(_$Updated value, $Res Function(_$Updated) then) =
      __$$UpdatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatedCopyWithImpl<$Res> extends _$VideoEventCopyWithImpl<$Res>
    implements _$$UpdatedCopyWith<$Res> {
  __$$UpdatedCopyWithImpl(_$Updated _value, $Res Function(_$Updated) _then)
      : super(_value, (v) => _then(v as _$Updated));

  @override
  _$Updated get _value => super._value as _$Updated;
}

/// @nodoc

class _$Updated implements Updated {
  const _$Updated();

  @override
  String toString() {
    return 'VideoEvent.updated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Updated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newVideo,
    required TResult Function() deleted,
    required TResult Function() updated,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? newVideo,
    TResult Function()? deleted,
    TResult Function()? updated,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newVideo,
    TResult Function()? deleted,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewVideo value) newVideo,
    required TResult Function(Deleted value) deleted,
    required TResult Function(Updated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NewVideo value)? newVideo,
    TResult Function(Deleted value)? deleted,
    TResult Function(Updated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewVideo value)? newVideo,
    TResult Function(Deleted value)? deleted,
    TResult Function(Updated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class Updated implements VideoEvent {
  const factory Updated() = _$Updated;
}
