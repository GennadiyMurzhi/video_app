// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UploadedVideoDataList _$$_UploadedVideoDataListFromJson(
        Map<String, dynamic> json) =>
    _$_UploadedVideoDataList(
      total: json['total'] as int,
      documents: (json['documents'] as List<dynamic>)
          .map((e) => UploadedVideoData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UploadedVideoDataListToJson(
        _$_UploadedVideoDataList instance) =>
    <String, dynamic>{
      'total': instance.total,
      'documents': instance.documents.map((e) => e.toJson()).toList(),
    };

_$_UploadedVideoData _$$_UploadedVideoDataFromJson(Map<String, dynamic> json) =>
    _$_UploadedVideoData(
      uploadedVideoDataId: json['uploadedVideoDataId'] as String,
      name: json['name'] as String,
      videoId: json['videoId'] as String,
      likesCount: json['likesCount'] as int,
      commentsCount: json['commentsCount'] as int,
    );

Map<String, dynamic> _$$_UploadedVideoDataToJson(
        _$_UploadedVideoData instance) =>
    <String, dynamic>{
      'uploadedVideoDataId': instance.uploadedVideoDataId,
      'name': instance.name,
      'videoId': instance.videoId,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
    };
