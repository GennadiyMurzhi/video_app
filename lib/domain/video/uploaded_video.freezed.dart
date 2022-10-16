// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'uploaded_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadedVideoDataList _$UploadedVideoDataListFromJson(
    Map<String, dynamic> json) {
  return _UploadedVideoDataList.fromJson(json);
}

/// @nodoc
mixin _$UploadedVideoDataList {
  int get total => throw _privateConstructorUsedError;
  List<UploadedVideoData> get documents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadedVideoDataListCopyWith<UploadedVideoDataList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedVideoDataListCopyWith<$Res> {
  factory $UploadedVideoDataListCopyWith(UploadedVideoDataList value,
          $Res Function(UploadedVideoDataList) then) =
      _$UploadedVideoDataListCopyWithImpl<$Res>;
  $Res call({int total, List<UploadedVideoData> documents});
}

/// @nodoc
class _$UploadedVideoDataListCopyWithImpl<$Res>
    implements $UploadedVideoDataListCopyWith<$Res> {
  _$UploadedVideoDataListCopyWithImpl(this._value, this._then);

  final UploadedVideoDataList _value;
  // ignore: unused_field
  final $Res Function(UploadedVideoDataList) _then;

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
              as List<UploadedVideoData>,
    ));
  }
}

/// @nodoc
abstract class _$$_UploadedVideoDataListCopyWith<$Res>
    implements $UploadedVideoDataListCopyWith<$Res> {
  factory _$$_UploadedVideoDataListCopyWith(_$_UploadedVideoDataList value,
          $Res Function(_$_UploadedVideoDataList) then) =
      __$$_UploadedVideoDataListCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<UploadedVideoData> documents});
}

/// @nodoc
class __$$_UploadedVideoDataListCopyWithImpl<$Res>
    extends _$UploadedVideoDataListCopyWithImpl<$Res>
    implements _$$_UploadedVideoDataListCopyWith<$Res> {
  __$$_UploadedVideoDataListCopyWithImpl(_$_UploadedVideoDataList _value,
      $Res Function(_$_UploadedVideoDataList) _then)
      : super(_value, (v) => _then(v as _$_UploadedVideoDataList));

  @override
  _$_UploadedVideoDataList get _value =>
      super._value as _$_UploadedVideoDataList;

  @override
  $Res call({
    Object? total = freezed,
    Object? documents = freezed,
  }) {
    return _then(_$_UploadedVideoDataList(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      documents: documents == freezed
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<UploadedVideoData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadedVideoDataList implements _UploadedVideoDataList {
  const _$_UploadedVideoDataList(
      {required this.total, required final List<UploadedVideoData> documents})
      : _documents = documents;

  factory _$_UploadedVideoDataList.fromJson(Map<String, dynamic> json) =>
      _$$_UploadedVideoDataListFromJson(json);

  @override
  final int total;
  final List<UploadedVideoData> _documents;
  @override
  List<UploadedVideoData> get documents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  String toString() {
    return 'UploadedVideoDataList(total: $total, documents: $documents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadedVideoDataList &&
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
  _$$_UploadedVideoDataListCopyWith<_$_UploadedVideoDataList> get copyWith =>
      __$$_UploadedVideoDataListCopyWithImpl<_$_UploadedVideoDataList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadedVideoDataListToJson(
      this,
    );
  }
}

abstract class _UploadedVideoDataList implements UploadedVideoDataList {
  const factory _UploadedVideoDataList(
          {required final int total,
          required final List<UploadedVideoData> documents}) =
      _$_UploadedVideoDataList;

  factory _UploadedVideoDataList.fromJson(Map<String, dynamic> json) =
      _$_UploadedVideoDataList.fromJson;

  @override
  int get total;
  @override
  List<UploadedVideoData> get documents;
  @override
  @JsonKey(ignore: true)
  _$$_UploadedVideoDataListCopyWith<_$_UploadedVideoDataList> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadedVideoData _$UploadedVideoDataFromJson(Map<String, dynamic> json) {
  return _UploadedVideoData.fromJson(json);
}

/// @nodoc
mixin _$UploadedVideoData {
  String get uploadedVideoDataId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get videoId => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadedVideoDataCopyWith<UploadedVideoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedVideoDataCopyWith<$Res> {
  factory $UploadedVideoDataCopyWith(
          UploadedVideoData value, $Res Function(UploadedVideoData) then) =
      _$UploadedVideoDataCopyWithImpl<$Res>;
  $Res call(
      {String uploadedVideoDataId,
      String name,
      String videoId,
      int likesCount,
      int commentsCount});
}

/// @nodoc
class _$UploadedVideoDataCopyWithImpl<$Res>
    implements $UploadedVideoDataCopyWith<$Res> {
  _$UploadedVideoDataCopyWithImpl(this._value, this._then);

  final UploadedVideoData _value;
  // ignore: unused_field
  final $Res Function(UploadedVideoData) _then;

  @override
  $Res call({
    Object? uploadedVideoDataId = freezed,
    Object? name = freezed,
    Object? videoId = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
  }) {
    return _then(_value.copyWith(
      uploadedVideoDataId: uploadedVideoDataId == freezed
          ? _value.uploadedVideoDataId
          : uploadedVideoDataId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: likesCount == freezed
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: commentsCount == freezed
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_UploadedVideoDataCopyWith<$Res>
    implements $UploadedVideoDataCopyWith<$Res> {
  factory _$$_UploadedVideoDataCopyWith(_$_UploadedVideoData value,
          $Res Function(_$_UploadedVideoData) then) =
      __$$_UploadedVideoDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uploadedVideoDataId,
      String name,
      String videoId,
      int likesCount,
      int commentsCount});
}

/// @nodoc
class __$$_UploadedVideoDataCopyWithImpl<$Res>
    extends _$UploadedVideoDataCopyWithImpl<$Res>
    implements _$$_UploadedVideoDataCopyWith<$Res> {
  __$$_UploadedVideoDataCopyWithImpl(
      _$_UploadedVideoData _value, $Res Function(_$_UploadedVideoData) _then)
      : super(_value, (v) => _then(v as _$_UploadedVideoData));

  @override
  _$_UploadedVideoData get _value => super._value as _$_UploadedVideoData;

  @override
  $Res call({
    Object? uploadedVideoDataId = freezed,
    Object? name = freezed,
    Object? videoId = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
  }) {
    return _then(_$_UploadedVideoData(
      uploadedVideoDataId: uploadedVideoDataId == freezed
          ? _value.uploadedVideoDataId
          : uploadedVideoDataId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: likesCount == freezed
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: commentsCount == freezed
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadedVideoData implements _UploadedVideoData {
  const _$_UploadedVideoData(
      {required this.uploadedVideoDataId,
      required this.name,
      required this.videoId,
      required this.likesCount,
      required this.commentsCount});

  factory _$_UploadedVideoData.fromJson(Map<String, dynamic> json) =>
      _$$_UploadedVideoDataFromJson(json);

  @override
  final String uploadedVideoDataId;
  @override
  final String name;
  @override
  final String videoId;
  @override
  final int likesCount;
  @override
  final int commentsCount;

  @override
  String toString() {
    return 'UploadedVideoData(uploadedVideoDataId: $uploadedVideoDataId, name: $name, videoId: $videoId, likesCount: $likesCount, commentsCount: $commentsCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadedVideoData &&
            const DeepCollectionEquality()
                .equals(other.uploadedVideoDataId, uploadedVideoDataId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.videoId, videoId) &&
            const DeepCollectionEquality()
                .equals(other.likesCount, likesCount) &&
            const DeepCollectionEquality()
                .equals(other.commentsCount, commentsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uploadedVideoDataId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(videoId),
      const DeepCollectionEquality().hash(likesCount),
      const DeepCollectionEquality().hash(commentsCount));

  @JsonKey(ignore: true)
  @override
  _$$_UploadedVideoDataCopyWith<_$_UploadedVideoData> get copyWith =>
      __$$_UploadedVideoDataCopyWithImpl<_$_UploadedVideoData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadedVideoDataToJson(
      this,
    );
  }
}

abstract class _UploadedVideoData implements UploadedVideoData {
  const factory _UploadedVideoData(
      {required final String uploadedVideoDataId,
      required final String name,
      required final String videoId,
      required final int likesCount,
      required final int commentsCount}) = _$_UploadedVideoData;

  factory _UploadedVideoData.fromJson(Map<String, dynamic> json) =
      _$_UploadedVideoData.fromJson;

  @override
  String get uploadedVideoDataId;
  @override
  String get name;
  @override
  String get videoId;
  @override
  int get likesCount;
  @override
  int get commentsCount;
  @override
  @JsonKey(ignore: true)
  _$$_UploadedVideoDataCopyWith<_$_UploadedVideoData> get copyWith =>
      throw _privateConstructorUsedError;
}
