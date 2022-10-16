// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'success.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Success {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? uploadFileID) videoUploaded,
    required TResult Function() videoReplaced,
    required TResult Function() videoDeleted,
    required TResult Function() videoInfoUpdated,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoUploaded value) videoUploaded,
    required TResult Function(VideoReplaced value) videoReplaced,
    required TResult Function(VideoDeleted value) videoDeleted,
    required TResult Function(VideoInfoUpdated value) videoInfoUpdated,
    required TResult Function(None value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._value, this._then);

  final Success _value;
  // ignore: unused_field
  final $Res Function(Success) _then;
}

/// @nodoc
abstract class _$$VideoUploadedCopyWith<$Res> {
  factory _$$VideoUploadedCopyWith(
          _$VideoUploaded value, $Res Function(_$VideoUploaded) then) =
      __$$VideoUploadedCopyWithImpl<$Res>;
  $Res call({String? uploadFileID});
}

/// @nodoc
class __$$VideoUploadedCopyWithImpl<$Res> extends _$SuccessCopyWithImpl<$Res>
    implements _$$VideoUploadedCopyWith<$Res> {
  __$$VideoUploadedCopyWithImpl(
      _$VideoUploaded _value, $Res Function(_$VideoUploaded) _then)
      : super(_value, (v) => _then(v as _$VideoUploaded));

  @override
  _$VideoUploaded get _value => super._value as _$VideoUploaded;

  @override
  $Res call({
    Object? uploadFileID = freezed,
  }) {
    return _then(_$VideoUploaded(
      uploadFileID == freezed
          ? _value.uploadFileID
          : uploadFileID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VideoUploaded implements VideoUploaded {
  const _$VideoUploaded(this.uploadFileID);

  @override
  final String? uploadFileID;

  @override
  String toString() {
    return 'Success.videoUploaded(uploadFileID: $uploadFileID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoUploaded &&
            const DeepCollectionEquality()
                .equals(other.uploadFileID, uploadFileID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(uploadFileID));

  @JsonKey(ignore: true)
  @override
  _$$VideoUploadedCopyWith<_$VideoUploaded> get copyWith =>
      __$$VideoUploadedCopyWithImpl<_$VideoUploaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? uploadFileID) videoUploaded,
    required TResult Function() videoReplaced,
    required TResult Function() videoDeleted,
    required TResult Function() videoInfoUpdated,
    required TResult Function() none,
  }) {
    return videoUploaded(uploadFileID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
  }) {
    return videoUploaded?.call(uploadFileID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (videoUploaded != null) {
      return videoUploaded(uploadFileID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoUploaded value) videoUploaded,
    required TResult Function(VideoReplaced value) videoReplaced,
    required TResult Function(VideoDeleted value) videoDeleted,
    required TResult Function(VideoInfoUpdated value) videoInfoUpdated,
    required TResult Function(None value) none,
  }) {
    return videoUploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
  }) {
    return videoUploaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (videoUploaded != null) {
      return videoUploaded(this);
    }
    return orElse();
  }
}

abstract class VideoUploaded implements Success {
  const factory VideoUploaded(final String? uploadFileID) = _$VideoUploaded;

  String? get uploadFileID;
  @JsonKey(ignore: true)
  _$$VideoUploadedCopyWith<_$VideoUploaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoReplacedCopyWith<$Res> {
  factory _$$VideoReplacedCopyWith(
          _$VideoReplaced value, $Res Function(_$VideoReplaced) then) =
      __$$VideoReplacedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoReplacedCopyWithImpl<$Res> extends _$SuccessCopyWithImpl<$Res>
    implements _$$VideoReplacedCopyWith<$Res> {
  __$$VideoReplacedCopyWithImpl(
      _$VideoReplaced _value, $Res Function(_$VideoReplaced) _then)
      : super(_value, (v) => _then(v as _$VideoReplaced));

  @override
  _$VideoReplaced get _value => super._value as _$VideoReplaced;
}

/// @nodoc

class _$VideoReplaced implements VideoReplaced {
  const _$VideoReplaced();

  @override
  String toString() {
    return 'Success.videoReplaced()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoReplaced);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? uploadFileID) videoUploaded,
    required TResult Function() videoReplaced,
    required TResult Function() videoDeleted,
    required TResult Function() videoInfoUpdated,
    required TResult Function() none,
  }) {
    return videoReplaced();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
  }) {
    return videoReplaced?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (videoReplaced != null) {
      return videoReplaced();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoUploaded value) videoUploaded,
    required TResult Function(VideoReplaced value) videoReplaced,
    required TResult Function(VideoDeleted value) videoDeleted,
    required TResult Function(VideoInfoUpdated value) videoInfoUpdated,
    required TResult Function(None value) none,
  }) {
    return videoReplaced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
  }) {
    return videoReplaced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (videoReplaced != null) {
      return videoReplaced(this);
    }
    return orElse();
  }
}

abstract class VideoReplaced implements Success {
  const factory VideoReplaced() = _$VideoReplaced;
}

/// @nodoc
abstract class _$$VideoDeletedCopyWith<$Res> {
  factory _$$VideoDeletedCopyWith(
          _$VideoDeleted value, $Res Function(_$VideoDeleted) then) =
      __$$VideoDeletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoDeletedCopyWithImpl<$Res> extends _$SuccessCopyWithImpl<$Res>
    implements _$$VideoDeletedCopyWith<$Res> {
  __$$VideoDeletedCopyWithImpl(
      _$VideoDeleted _value, $Res Function(_$VideoDeleted) _then)
      : super(_value, (v) => _then(v as _$VideoDeleted));

  @override
  _$VideoDeleted get _value => super._value as _$VideoDeleted;
}

/// @nodoc

class _$VideoDeleted implements VideoDeleted {
  const _$VideoDeleted();

  @override
  String toString() {
    return 'Success.videoDeleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? uploadFileID) videoUploaded,
    required TResult Function() videoReplaced,
    required TResult Function() videoDeleted,
    required TResult Function() videoInfoUpdated,
    required TResult Function() none,
  }) {
    return videoDeleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
  }) {
    return videoDeleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (videoDeleted != null) {
      return videoDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoUploaded value) videoUploaded,
    required TResult Function(VideoReplaced value) videoReplaced,
    required TResult Function(VideoDeleted value) videoDeleted,
    required TResult Function(VideoInfoUpdated value) videoInfoUpdated,
    required TResult Function(None value) none,
  }) {
    return videoDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
  }) {
    return videoDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (videoDeleted != null) {
      return videoDeleted(this);
    }
    return orElse();
  }
}

abstract class VideoDeleted implements Success {
  const factory VideoDeleted() = _$VideoDeleted;
}

/// @nodoc
abstract class _$$VideoInfoUpdatedCopyWith<$Res> {
  factory _$$VideoInfoUpdatedCopyWith(
          _$VideoInfoUpdated value, $Res Function(_$VideoInfoUpdated) then) =
      __$$VideoInfoUpdatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VideoInfoUpdatedCopyWithImpl<$Res> extends _$SuccessCopyWithImpl<$Res>
    implements _$$VideoInfoUpdatedCopyWith<$Res> {
  __$$VideoInfoUpdatedCopyWithImpl(
      _$VideoInfoUpdated _value, $Res Function(_$VideoInfoUpdated) _then)
      : super(_value, (v) => _then(v as _$VideoInfoUpdated));

  @override
  _$VideoInfoUpdated get _value => super._value as _$VideoInfoUpdated;
}

/// @nodoc

class _$VideoInfoUpdated implements VideoInfoUpdated {
  const _$VideoInfoUpdated();

  @override
  String toString() {
    return 'Success.videoInfoUpdated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VideoInfoUpdated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? uploadFileID) videoUploaded,
    required TResult Function() videoReplaced,
    required TResult Function() videoDeleted,
    required TResult Function() videoInfoUpdated,
    required TResult Function() none,
  }) {
    return videoInfoUpdated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
  }) {
    return videoInfoUpdated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (videoInfoUpdated != null) {
      return videoInfoUpdated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoUploaded value) videoUploaded,
    required TResult Function(VideoReplaced value) videoReplaced,
    required TResult Function(VideoDeleted value) videoDeleted,
    required TResult Function(VideoInfoUpdated value) videoInfoUpdated,
    required TResult Function(None value) none,
  }) {
    return videoInfoUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
  }) {
    return videoInfoUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (videoInfoUpdated != null) {
      return videoInfoUpdated(this);
    }
    return orElse();
  }
}

abstract class VideoInfoUpdated implements Success {
  const factory VideoInfoUpdated() = _$VideoInfoUpdated;
}

/// @nodoc
abstract class _$$NoneCopyWith<$Res> {
  factory _$$NoneCopyWith(_$None value, $Res Function(_$None) then) =
      __$$NoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoneCopyWithImpl<$Res> extends _$SuccessCopyWithImpl<$Res>
    implements _$$NoneCopyWith<$Res> {
  __$$NoneCopyWithImpl(_$None _value, $Res Function(_$None) _then)
      : super(_value, (v) => _then(v as _$None));

  @override
  _$None get _value => super._value as _$None;
}

/// @nodoc

class _$None implements None {
  const _$None();

  @override
  String toString() {
    return 'Success.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$None);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? uploadFileID) videoUploaded,
    required TResult Function() videoReplaced,
    required TResult Function() videoDeleted,
    required TResult Function() videoInfoUpdated,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? uploadFileID)? videoUploaded,
    TResult Function()? videoReplaced,
    TResult Function()? videoDeleted,
    TResult Function()? videoInfoUpdated,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VideoUploaded value) videoUploaded,
    required TResult Function(VideoReplaced value) videoReplaced,
    required TResult Function(VideoDeleted value) videoDeleted,
    required TResult Function(VideoInfoUpdated value) videoInfoUpdated,
    required TResult Function(None value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VideoUploaded value)? videoUploaded,
    TResult Function(VideoReplaced value)? videoReplaced,
    TResult Function(VideoDeleted value)? videoDeleted,
    TResult Function(VideoInfoUpdated value)? videoInfoUpdated,
    TResult Function(None value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class None implements Success {
  const factory None() = _$None;
}
