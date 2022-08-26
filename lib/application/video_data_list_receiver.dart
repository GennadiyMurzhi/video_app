import 'package:rxdart/rxdart.dart';
import 'package:video_app/domain/video/video.dart';

///This receiver is needed for convenient VideoDataList to VideoListScreen transfer
class VideoDataListReceiver {
  ///When initializing the VideoDataListReceiver object, pass an empty VideoDataList in the constructor parameters
  VideoDataListReceiver(this._videoDataList) : videoDataListStream = BehaviorSubject<VideoDataList>.seeded(_videoDataList);

  VideoDataList _videoDataList;

  ///Stream through which updated VideoDataList will arrive
  final BehaviorSubject<VideoDataList> videoDataListStream;

  ///add new VideoDataList in stream
  Future<void> getVideoDataList(VideoDataList newVideoDataList) async {
    videoDataListStream.add(_videoDataList = newVideoDataList);
  }
}
