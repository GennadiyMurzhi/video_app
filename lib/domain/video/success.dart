import 'package:freezed_annotation/freezed_annotation.dart';

part 'success.freezed.dart';

///options on successful video manipulations
@freezed
abstract class Success with _$Success {
  ///is used to indicate the successful uploading of the video to the server
  const factory Success.videoUploaded() = VideoUploaded;

  ///used to indicate that the video was replaced on the server successfully
  const factory Success.videoReplaced() = VideoReplaced;

  ///used to indicate that the video was deleted on the server successfully
  const factory Success.videoDeleted() = VideoDeleted;

  ///used to indicate that the video information has been successfully updated on the server
  const factory Success.videoInfoUpdated() = VideoInfoUpdated;
}
