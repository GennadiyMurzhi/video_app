import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

///VideoDataList is needed to display the video list on the screen
@freezed
class VideoDataList with _$VideoDataList {
  ///total variable is total number of files
  ///
  ///files variable is list of files presented in the form of VideoData
  const factory VideoDataList ({
    required int total,
    required List<VideoData> files,
  }) = _VideoDataList;

  ///Empty VideoDataList
  factory VideoDataList.empty () => const VideoDataList(total: 0, files: <VideoData>[]);

  ///standard serialization method
  factory VideoDataList.fromJson(Map<String, Object?> json) => _$VideoDataListFromJson(json);
}

///VideoData is needed to represent video data
@freezed
class VideoData with _$VideoData{
  ///name variable is video name on the server
  ///
  ///id variable is file id on the server. Needed for receives video file from the server
  const factory VideoData ({
    required String name,
    @JsonKey(name: '\$id') required String id,
  }) = _VideoData;

  ///standard serialization method
  factory VideoData.fromJson(Map<String, Object?> json) => _$VideoDataFromJson(json);
}
