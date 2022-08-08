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
  List<VideoData> get files => throw _privateConstructorUsedError;

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
  $Res call({int total, List<VideoData> files});
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
    Object? files = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      files: files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
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
  $Res call({int total, List<VideoData> files});
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
    Object? files = freezed,
  }) {
    return _then(_$_VideoDataList(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      files: files == freezed
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<VideoData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoDataList implements _VideoDataList {
  const _$_VideoDataList(
      {required this.total, required final List<VideoData> files})
      : _files = files;

  factory _$_VideoDataList.fromJson(Map<String, dynamic> json) =>
      _$$_VideoDataListFromJson(json);

  @override
  final int total;
  final List<VideoData> _files;
  @override
  List<VideoData> get files {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString() {
    return 'VideoDataList(total: $total, files: $files)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoDataList &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(_files));

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
      required final List<VideoData> files}) = _$_VideoDataList;

  factory _VideoDataList.fromJson(Map<String, dynamic> json) =
      _$_VideoDataList.fromJson;

  @override
  int get total;
  @override
  List<VideoData> get files;
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
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: '\$id')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoDataCopyWith<VideoData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoDataCopyWith<$Res> {
  factory $VideoDataCopyWith(VideoData value, $Res Function(VideoData) then) =
      _$VideoDataCopyWithImpl<$Res>;
  $Res call({String name, @JsonKey(name: '\$id') String id});
}

/// @nodoc
class _$VideoDataCopyWithImpl<$Res> implements $VideoDataCopyWith<$Res> {
  _$VideoDataCopyWithImpl(this._value, this._then);

  final VideoData _value;
  // ignore: unused_field
  final $Res Function(VideoData) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
  $Res call({String name, @JsonKey(name: '\$id') String id});
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
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_VideoData(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoData implements _VideoData {
  const _$_VideoData(
      {required this.name, @JsonKey(name: '\$id') required this.id});

  factory _$_VideoData.fromJson(Map<String, dynamic> json) =>
      _$$_VideoDataFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: '\$id')
  final String id;

  @override
  String toString() {
    return 'VideoData(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoData &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id));

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
      {required final String name,
      @JsonKey(name: '\$id') required final String id}) = _$_VideoData;

  factory _VideoData.fromJson(Map<String, dynamic> json) =
      _$_VideoData.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: '\$id')
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_VideoDataCopyWith<_$_VideoData> get copyWith =>
      throw _privateConstructorUsedError;
}
