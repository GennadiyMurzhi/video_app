// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoDataList _$VideoDataListFromJson(Map<String, dynamic> json) {
  return _VideoDataList.fromJson(json);
}

/// @nodoc
mixin _$VideoDataList {
  int get total => throw _privateConstructorUsedError;
  List<VideoData> get documents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoDataListCopyWith<VideoDataList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoDataListCopyWith<$Res> {
  factory $VideoDataListCopyWith(
          VideoDataList value, $Res Function(VideoDataList) then) =
      _$VideoDataListCopyWithImpl<$Res>;
  $Res call({int total, List<VideoData> documents});
}

/// @nodoc
class _$VideoDataListCopyWithImpl<$Res>
    implements $VideoDataListCopyWith<$Res> {
  _$VideoDataListCopyWithImpl(this._value, this._then);

  final VideoDataList _value;
  // ignore: unused_field
  final $Res Function(VideoDataList) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? documents = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      documents: documents == freezed
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<VideoData>,
    ));
  }
}

/// @nodoc
abstract class _$$_VideoDataListCopyWith<$Res>
    implements $VideoDataListCopyWith<$Res> {
  factory _$$_VideoDataListCopyWith(
          _$_VideoDataList value, $Res Function(_$_VideoDataList) then) =
      __$$_VideoDataListCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<VideoData> documents});
}

/// @nodoc
class __$$_VideoDataListCopyWithImpl<$Res>
    extends _$VideoDataListCopyWithImpl<$Res>
    implements _$$_VideoDataListCopyWith<$Res> {
  __$$_VideoDataListCopyWithImpl(
      _$_VideoDataList _value, $Res Function(_$_VideoDataList) _then)
      : super(_value, (v) => _then(v as _$_VideoDataList));

  @override
  _$_VideoDataList get _value => super._value as _$_VideoDataList;

  @override
  $Res call({
    Object? total = freezed,
    Object? documents = freezed,
  }) {
    return _then(_$_VideoDataList(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      documents: documents == freezed
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<VideoData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoDataList implements _VideoDataList {
  const _$_VideoDataList(
      {required this.total, required final List<VideoData> documents})
      : _documents = documents;

  factory _$_VideoDataList.fromJson(Map<String, dynamic> json) =>
      _$$_VideoDataListFromJson(json);

  @override
  final int total;
  final List<VideoData> _documents;
  @override
  List<VideoData> get documents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  String toString() {
    return 'VideoDataList(total: $total, documents: $documents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoDataList &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(_documents));

  @JsonKey(ignore: true)
  @override
  _$$_VideoDataListCopyWith<_$_VideoDataList> get copyWith =>
      __$$_VideoDataListCopyWithImpl<_$_VideoDataList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoDataListToJson(
      this,
    );
  }
}

abstract class _VideoDataList implements VideoDataList {
  const factory _VideoDataList(
      {required final int total,
      required final List<VideoData> documents}) = _$_VideoDataList;

  factory _VideoDataList.fromJson(Map<String, dynamic> json) =
      _$_VideoDataList.fromJson;

  @override
  int get total;
  @override
  List<VideoData> get documents;
  @override
  @JsonKey(ignore: true)
  _$$_VideoDataListCopyWith<_$_VideoDataList> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoData _$VideoDataFromJson(Map<String, dynamic> json) {
  return _VideoData.fromJson(json);
}

/// @nodoc
mixin _$VideoData {
  String get videoDataId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get videoId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoDataCopyWith<VideoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoDataCopyWith<$Res> {
  factory $VideoDataCopyWith(VideoData value, $Res Function(VideoData) then) =
      _$VideoDataCopyWithImpl<$Res>;
  $Res call(
      {String videoDataId,
      String name,
      String videoId,
      String userId,
      String userName,
      String description});
}

/// @nodoc
class _$VideoDataCopyWithImpl<$Res> implements $VideoDataCopyWith<$Res> {
  _$VideoDataCopyWithImpl(this._value, this._then);

  final VideoData _value;
  // ignore: unused_field
  final $Res Function(VideoData) _then;

  @override
  $Res call({
    Object? videoDataId = freezed,
    Object? name = freezed,
    Object? videoId = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      videoDataId: videoDataId == freezed
          ? _value.videoDataId
          : videoDataId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_VideoDataCopyWith<$Res> implements $VideoDataCopyWith<$Res> {
  factory _$$_VideoDataCopyWith(
          _$_VideoData value, $Res Function(_$_VideoData) then) =
      __$$_VideoDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String videoDataId,
      String name,
      String videoId,
      String userId,
      String userName,
      String description});
}

/// @nodoc
class __$$_VideoDataCopyWithImpl<$Res> extends _$VideoDataCopyWithImpl<$Res>
    implements _$$_VideoDataCopyWith<$Res> {
  __$$_VideoDataCopyWithImpl(
      _$_VideoData _value, $Res Function(_$_VideoData) _then)
      : super(_value, (v) => _then(v as _$_VideoData));

  @override
  _$_VideoData get _value => super._value as _$_VideoData;

  @override
  $Res call({
    Object? videoDataId = freezed,
    Object? name = freezed,
    Object? videoId = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_VideoData(
      videoDataId: videoDataId == freezed
          ? _value.videoDataId
          : videoDataId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoData implements _VideoData {
  const _$_VideoData(
      {required this.videoDataId,
      required this.name,
      required this.videoId,
      required this.userId,
      required this.userName,
      required this.description});

  factory _$_VideoData.fromJson(Map<String, dynamic> json) =>
      _$$_VideoDataFromJson(json);

  @override
  final String videoDataId;
  @override
  final String name;
  @override
  final String videoId;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String description;

  @override
  String toString() {
    return 'VideoData(videoDataId: $videoDataId, name: $name, videoId: $videoId, userId: $userId, userName: $userName, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoData &&
            const DeepCollectionEquality()
                .equals(other.videoDataId, videoDataId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.videoId, videoId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(videoDataId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(videoId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_VideoDataCopyWith<_$_VideoData> get copyWith =>
      __$$_VideoDataCopyWithImpl<_$_VideoData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoDataToJson(
      this,
    );
  }
}

abstract class _VideoData implements VideoData {
  const factory _VideoData(
      {required final String videoDataId,
      required final String name,
      required final String videoId,
      required final String userId,
      required final String userName,
      required final String description}) = _$_VideoData;

  factory _VideoData.fromJson(Map<String, dynamic> json) =
      _$_VideoData.fromJson;

  @override
  String get videoDataId;
  @override
  String get name;
  @override
  String get videoId;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_VideoDataCopyWith<_$_VideoData> get copyWith =>
      throw _privateConstructorUsedError;
}
