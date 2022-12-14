import 'package:appwrite/models.dart';
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
    required List<VideoData> documents,
  }) = _VideoDataList;

  ///Empty VideoDataList
  factory VideoDataList.empty () => const VideoDataList(total: 0, documents: <VideoData>[]);

  ///standard serialization method
  factory VideoDataList.fromJson(Map<String, Object?> json) => _$VideoDataListFromJson(json);

  factory VideoDataList.fromDocumentList(List<Document> documentList) => VideoDataList(
    total: documentList.length,
    documents: List<VideoData>.generate(
      documentList.length,
          (int index) => VideoData.fromDocument(documentList[index]),
    ),
  );
}

///VideoData is needed to represent video data
@freezed
class VideoData with _$VideoData{
  ///name variable is video name on the server
  ///
  ///id variable is file id on the server. Needed for receives video file from the server
  const factory VideoData ({
    required String videoDataId,
    required String name,
    required String videoId,
    required String userId,
    required String userName,
    required String description,
  }) = _VideoData;

  factory VideoData.fromDocument(Document document) => VideoData(
    videoDataId: document.$id,
    name: document.data['name'] as String,
    videoId: document.data['video_file_id'] as String,
    userId: document.data['user_id'] as String,
    userName: document.data['userName'] as String,
    description: document.data['description'] as String,
  );

  ///standard serialization method
  factory VideoData.fromJson(Map<String, Object?> json) => _$VideoDataFromJson(json);
}
