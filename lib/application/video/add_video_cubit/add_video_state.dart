part of 'add_video_cubit.dart';

///State for add video cubit
@freezed
abstract class AddVideoState with _$AddVideoState {
  ///used value objects, variable for indicates loading
  const factory AddVideoState({
    required VideoName name,
    required VideoDescription description,
    required bool loading,
    required bool showErrorMessage,
    required VideoFilePickerResult filePickerResult,
    required Option<Either<Failure, Success>> addVideoFailureOrSuccessOption,
    bool? editingVideoName,
    bool? editingVideoDescription,
    String? videoId,

    ///function for deleting video
    void Function()? deleteVideo,

    ///function for updating\displaying video
    void Function()? updateVideo,
  }) = _AddVideoState;

  factory AddVideoState.initial() => AddVideoState(
        name: VideoName(''),
        description: VideoDescription(''),
        loading: false,
        showErrorMessage: false,
        filePickerResult: VideoFilePickerResult(null),
        addVideoFailureOrSuccessOption: none(),
      );
}
