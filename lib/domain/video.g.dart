// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoDataList _$$_VideoDataListFromJson(Map<String, dynamic> json) =>
    _$_VideoDataList(
      total: json['total'] as int,
      files: (json['files'] as List<dynamic>)
          .map((e) => VideoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VideoDataListToJson(_$_VideoDataList instance) =>
    <String, dynamic>{
      'total': instance.total,
      'files': instance.files.map((e) => e.toJson()).toList(),
    };

_$_VideoData _$$_VideoDataFromJson(Map<String, dynamic> json) => _$_VideoData(
      name: json['name'] as String,
      id: json[r'$id'] as String,
    );

Map<String, dynamic> _$$_VideoDataToJson(_$_VideoData instance) =>
    <String, dynamic>{
      'name': instance.name,
      r'$id': instance.id,
    };
