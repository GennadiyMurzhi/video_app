// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Likes {
  int get total => throw _privateConstructorUsedError;
  List<Like> get likes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikesCopyWith<Likes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikesCopyWith<$Res> {
  factory $LikesCopyWith(Likes value, $Res Function(Likes) then) =
      _$LikesCopyWithImpl<$Res>;
  $Res call({int total, List<Like> likes});
}

/// @nodoc
class _$LikesCopyWithImpl<$Res> implements $LikesCopyWith<$Res> {
  _$LikesCopyWithImpl(this._value, this._then);

  final Likes _value;
  // ignore: unused_field
  final $Res Function(Likes) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? likes = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>,
    ));
  }
}

/// @nodoc
abstract class _$$_LikesCopyWith<$Res> implements $LikesCopyWith<$Res> {
  factory _$$_LikesCopyWith(_$_Likes value, $Res Function(_$_Likes) then) =
      __$$_LikesCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<Like> likes});
}

/// @nodoc
class __$$_LikesCopyWithImpl<$Res> extends _$LikesCopyWithImpl<$Res>
    implements _$$_LikesCopyWith<$Res> {
  __$$_LikesCopyWithImpl(_$_Likes _value, $Res Function(_$_Likes) _then)
      : super(_value, (v) => _then(v as _$_Likes));

  @override
  _$_Likes get _value => super._value as _$_Likes;

  @override
  $Res call({
    Object? total = freezed,
    Object? likes = freezed,
  }) {
    return _then(_$_Likes(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>,
    ));
  }
}

/// @nodoc

class _$_Likes implements _Likes {
  const _$_Likes({required this.total, required final List<Like> likes})
      : _likes = likes;

  @override
  final int total;
  final List<Like> _likes;
  @override
  List<Like> get likes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  String toString() {
    return 'Likes(total: $total, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Likes &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other._likes, _likes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(_likes));

  @JsonKey(ignore: true)
  @override
  _$$_LikesCopyWith<_$_Likes> get copyWith =>
      __$$_LikesCopyWithImpl<_$_Likes>(this, _$identity);
}

abstract class _Likes implements Likes {
  const factory _Likes(
      {required final int total, required final List<Like> likes}) = _$_Likes;

  @override
  int get total;
  @override
  List<Like> get likes;
  @override
  @JsonKey(ignore: true)
  _$$_LikesCopyWith<_$_Likes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Like {
  String get likeId => throw _privateConstructorUsedError;
  String get videoId => throw _privateConstructorUsedError;
  String get videoName => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeCopyWith<Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) then) =
      _$LikeCopyWithImpl<$Res>;
  $Res call({String likeId, String videoId, String videoName, String userName});
}

/// @nodoc
class _$LikeCopyWithImpl<$Res> implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._value, this._then);

  final Like _value;
  // ignore: unused_field
  final $Res Function(Like) _then;

  @override
  $Res call({
    Object? likeId = freezed,
    Object? videoId = freezed,
    Object? videoName = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      likeId: likeId == freezed
          ? _value.likeId
          : likeId // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      videoName: videoName == freezed
          ? _value.videoName
          : videoName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_LikeCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$$_LikeCopyWith(_$_Like value, $Res Function(_$_Like) then) =
      __$$_LikeCopyWithImpl<$Res>;
  @override
  $Res call({String likeId, String videoId, String videoName, String userName});
}

/// @nodoc
class __$$_LikeCopyWithImpl<$Res> extends _$LikeCopyWithImpl<$Res>
    implements _$$_LikeCopyWith<$Res> {
  __$$_LikeCopyWithImpl(_$_Like _value, $Res Function(_$_Like) _then)
      : super(_value, (v) => _then(v as _$_Like));

  @override
  _$_Like get _value => super._value as _$_Like;

  @override
  $Res call({
    Object? likeId = freezed,
    Object? videoId = freezed,
    Object? videoName = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$_Like(
      likeId: likeId == freezed
          ? _value.likeId
          : likeId // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      videoName: videoName == freezed
          ? _value.videoName
          : videoName // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Like implements _Like {
  const _$_Like(
      {required this.likeId,
      required this.videoId,
      required this.videoName,
      required this.userName});

  @override
  final String likeId;
  @override
  final String videoId;
  @override
  final String videoName;
  @override
  final String userName;

  @override
  String toString() {
    return 'Like(likeId: $likeId, videoId: $videoId, videoName: $videoName, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Like &&
            const DeepCollectionEquality().equals(other.likeId, likeId) &&
            const DeepCollectionEquality().equals(other.videoId, videoId) &&
            const DeepCollectionEquality().equals(other.videoName, videoName) &&
            const DeepCollectionEquality().equals(other.userName, userName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(likeId),
      const DeepCollectionEquality().hash(videoId),
      const DeepCollectionEquality().hash(videoName),
      const DeepCollectionEquality().hash(userName));

  @JsonKey(ignore: true)
  @override
  _$$_LikeCopyWith<_$_Like> get copyWith =>
      __$$_LikeCopyWithImpl<_$_Like>(this, _$identity);
}

abstract class _Like implements Like {
  const factory _Like(
      {required final String likeId,
      required final String videoId,
      required final String videoName,
      required final String userName}) = _$_Like;

  @override
  String get likeId;
  @override
  String get videoId;
  @override
  String get videoName;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$_LikeCopyWith<_$_Like> get copyWith => throw _privateConstructorUsedError;
}
