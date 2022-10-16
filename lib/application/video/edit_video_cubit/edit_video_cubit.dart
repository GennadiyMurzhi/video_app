import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/application/video/add_video_cubit/add_video_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/domain/video/success.dart';
import 'package:video_app/domain/video/value_objects.dart';

///Cubit for edit video information
@Injectable()
class EditVideoCubit extends AddVideoCubit {
  ///pass the video repository to use video upload functionality
  EditVideoCubit(this._videoRepository) : super(_videoRepository);

  final IVideoRepository _videoRepository;

  ///init cubit
  void init({
    required String name,
    required String description,
    required String videoId,
    required void Function()? deleteVideo,
    required void Function()? updateVideo,
  }) {
    emit(
      state.copyWith(
        name: VideoName(name),
        description: VideoDescription(description),
        videoId: videoId,
        deleteVideo: deleteVideo,
        updateVideo: updateVideo,
      ),
    );
  }

  ///method to so start edit Video Name
  void startEditName() {
    emit(
      state.copyWith(
        editingVideoName: true,
      ),
    );
  }

  ///method to so start edit Video Description
  void startEditingDescription() {
    emit(
      state.copyWith(editingVideoDescription: true),
    );
  }

  ///method to so start edit Video Name
  void endEditName() {
    emit(
      state.copyWith(
        editingVideoName: false,
      ),
    );
  }

  ///method to so start edit Video Description
  void endEditingDescription() {
    emit(
      state.copyWith(editingVideoDescription: false),
    );
  }

  ///method to update video information
  Future<void> updateInformation(String videoId) async {
    emit(
      state.copyWith(
        loading: true,
      ),
    );
    final Either<Failure, Success> succecassOfFailure = await _videoRepository.updateVideoInformation(
      videoId: videoId,
      name: state.editingVideoName != null ? state.name.getOrCrash() : null,
      description: state.editingVideoDescription != null ? state.description.getOrCrash() : null,
    );
    succecassOfFailure.fold(
      (Failure l) => emit(
        state.copyWith(
          loading: false,
        ),
      ),
      (Success r) => emit(
        state.copyWith(
          loading: false,
          addVideoFailureOrSuccessOption: optionOf(succecassOfFailure),
          editingVideoName: null,
          editingVideoDescription: null,
        ),
      ),
    );
  }
}
