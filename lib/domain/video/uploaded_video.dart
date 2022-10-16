import 'package:appwrite/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploaded_video.freezed.dart';
part 'uploaded_video.g.dart';

///UploadedVideoDataList is needed to display the video list on the screen
@freezed
class UploadedVideoDataList with _$UploadedVideoDataList {
  ///total variable is total number of files
  ///
  ///files variable is list of files presented in the form of VideoData
  const factory UploadedVideoDataList ({
    required int total,
    required List<UploadedVideoData> documents,
  }) = _UploadedVideoDataList;

  ///Empty UploadedVideoDataList
  factory UploadedVideoDataList.empty () => const UploadedVideoDataList(total: 0, documents: <UploadedVideoData>[]);

  ///standard serialization method
  factory UploadedVideoDataList.fromJson(Map<String, Object?> json) => _$UploadedVideoDataListFromJson(json);

  factory UploadedVideoDataList.fromDocumentList(List<Document> documentList) => UploadedVideoDataList(
    total: documentList.length,
    documents: List<UploadedVideoData>.generate(
      documentList.length,
          (int index) => UploadedVideoData.fromDocument(documentList[index]),
    ),
  );
}

///UploadedVideoData is needed to represent video data
@freezed
class UploadedVideoData with _$UploadedVideoData{
  ///name variable is video name on the server
  ///
  ///id variable is file id on the server. Needed for receives video file from the server
  const factory UploadedVideoData ({
    required String uploadedVideoDataId,
    required String name,
    required String videoId,
    required int likesCount,
    required int commentsCount,
  }) = _UploadedVideoData;

  factory UploadedVideoData.fromDocument(Document document) => UploadedVideoData(
    uploadedVideoDataId: document.$id,
    name: document.data['name'] as String,
    videoId: document.data['video_file_id'] as String,
    likesCount: document.data['likes_count'] as int,
    commentsCount: document.data['comments_count'] as int,
  );

  ///standard serialization method
  factory UploadedVideoData.fromJson(Map<String, Object?> json) => _$UploadedVideoDataFromJson(json);
}
