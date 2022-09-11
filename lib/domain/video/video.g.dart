// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoDataList _$$_VideoDataListFromJson(Map<String, dynamic> json) =>
    _$_VideoDataList(
      total: json['total'] as int,
      documents: (json['documents'] as List<dynamic>)
          .map((e) => VideoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VideoDataListToJson(_$_VideoDataList instance) =>
    <String, dynamic>{
      'total': instance.total,
      'documents': instance.documents.map((e) => e.toJson()).toList(),
    };

_$_VideoData _$$_VideoDataFromJson(Map<String, dynamic> json) => _$_VideoData(
      name: json['name'] as String,
      videoId: json['videoId'] as String,
      userId: json['userId'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_VideoDataToJson(_$_VideoData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'videoId': instance.videoId,
      'userId': instance.userId,
      'description': instance.description,
    };
