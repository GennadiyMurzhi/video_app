import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_app/application/pick_file.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/i_video_repository.dart';
import 'package:video_app/domain/video/success.dart';
import 'package:video_app/domain/video/value_objects.dart';
import 'package:video_app/injectable.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'add_video_cubit.freezed.dart';

part 'add_video_state.dart';

///cubit manage the uploading video with name and description
@Injectable()
class AddVideoCubit extends Cubit<AddVideoState> {
  ///pass the video repository to use video upload functionality
  AddVideoCubit(this._videoRepository) : super(AddVideoState.initial());

  final IVideoRepository _videoRepository;

  ///method for editing the video name of the input time
  void editVideoName(String name) {
    emit(
      state.copyWith(
        name: VideoName(name),
        addVideoFailureOrSuccessOption: none(),
      ),
    );
  }

  ///method for editing the video description of the input time
  void editVideoDescription(String description) {
    emit(
      state.copyWith(
        description: VideoDescription(description),
        addVideoFailureOrSuccessOption: none(),
      ),
    );
  }

  ///method to pick video file
  Future<void> pickVideoFile() async {
    final FilePickerResult? filePickerResult = await pickFile();
    emit(
      state.copyWith(
        filePickerResult: VideoFilePickerResult(filePickerResult),
      ),
    );
  }

  ///method to upload video on the server with name and description
  Future<void> uploadVideo(String userId) async {
    if (_isValid()) {
      emit(
        state.copyWith(
          loading: true,
        ),
      );

      final String? thumb = await VideoThumbnail.thumbnailFile(
        video: state.filePickerResult.getOrCrash()!.paths[0]!,
        thumbnailPath: (await getTemporaryDirectory()).path,
        quality: 100,
      );

      final Either<Failure, Success> resultOrFailure = await _videoRepository.uploadVideoOnServer(
        filePickerResult: state.filePickerResult.getOrCrash()!,
        previewPath: thumb!,
        userId: userId,
        name: state.name.getOrCrash(),
        description: state.description.getOrCrash(),
      );
      resultOrFailure.fold(
        (Failure failure) => failure.maybeWhen(
          serverError: () => emit(
            state.copyWith(
              loading: false,
              showErrorMessage: false,
            ),
          ),
          orElse: () => '',
        ),
        (Success r) => null,
      );

      emit(
        state.copyWith(
          addVideoFailureOrSuccessOption: optionOf(resultOrFailure),
        ),
      );
    } else {
      emit(
        state.copyWith(
          showErrorMessage: true,
        ),
      );
    }
  }

  bool _isValid() {
    return state.name.isValid() && state.description.isValid() && state.filePickerResult.isValid();
  }
}
