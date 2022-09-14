import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_event.freezed.dart';

///options on successful video manipulations
@freezed
abstract class VideoEvent with _$VideoEvent {
  ///is intended to indicate an event about a new video download
  const factory VideoEvent.newVideo() = NewVideo;

  ///is intended to indicate the event about the removal of the video
  const factory VideoEvent.deleted() = Deleted;

  ///is intended to indicate the event about the removal of the video
  const factory VideoEvent.updated() = Updated;
}
