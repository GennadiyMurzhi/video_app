import 'dart:io';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_app/application/pick_file.dart';
import 'package:video_app/domain/auth/i_auth_facade.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/user/i_user_repository.dart';
import 'package:video_app/domain/user/user.dart';
import 'package:video_app/domain/user/value_objects.dart';
import 'package:video_app/injectable.dart';

part 'user_cubit.freezed.dart';

part 'user_state.dart';

///cubit for store information about authorized users
@lazySingleton
class UserCubit extends Cubit<UserState> {
  ///pass a facade to use the server's authorization functionality
  ///pass user repository to user data manipulation
  UserCubit(this._authFacade, this._userRepository) : super(UserState.initial());

  final IAuthFacade _authFacade;
  final IUserRepository _userRepository;
  late final RealtimeSubscription? _subscription;

  ///method to init user
  Future<void> init() async {
    await loadUserData();
    await getUserPhoto();
    subscribeOnUpdatePhoto();
  }

  ///method for load user information into the application
  Future<void> loadUserData() async {
    final Option<User> user = await _authFacade.getSignedInUser();
    user.fold(() => null, (User a) {
      emit(
        state.copyWith(
          id: a.id,
          name: a.name,
          emailAddress: a.email,
        ),
      );
    });
  }

  ///method to get user photo
  Future<void> getUserPhoto() async {
    final Option<Uint8List> photoOption = await _userRepository.getUserPhoto(userId);

    if (kIsWeb) {
      photoOption.fold(
        () => emit(
          state.copyWith(photoBits: null),
        ),
        (Uint8List photo) => emit(
          state.copyWith(
            photoBits: photo,
          ),
        ),
      );
    } else {
      final Directory directory = await getApplicationDocumentsDirectory();
      _crutchNameFile = '${_crutchNameFile}r';
      final File userPhotoFile = File('${directory.path}/$_crutchNameFile');
      final bool exist = await userPhotoFile.exists();
      if (exist) {
        await userPhotoFile.delete();
      }

      photoOption.fold(
        () {
          emit(
            state.copyWith(photoFile: null),
          );
        },
        (Uint8List photo) {
          userPhotoFile.writeAsBytesSync(photo);
          emit(
            state.copyWith(
              photoFile: userPhotoFile,
              filePickerResult: UserPhotoFilePickerResult(null),
            ),
          );
        },
      );
    }
  }

  ///method to upload new user photo
  Future<void> uploadUserPhoto() async {
    if (state.filePickerResult.isValid()) {
      if(state.photoFile != null) {
        state.photoFile!.delete();
      }
      emit(
        state.copyWith(photoFile: null),
      );

      final Either<Failure, Unit> resultOrFailure;
      if (state.photoFile == null) {
        resultOrFailure = await _userRepository.uploadUserPhoto(
          filePickerResult: state.filePickerResult.getOrCrash()!,
          userId: userId,
        );
      } else {
        resultOrFailure = await _userRepository.replaceUserPhoto(
          filePickerResult: state.filePickerResult.getOrCrash()!,
          userId: userId,
        );
      }

      resultOrFailure.fold(
        (Failure l) => emit(
          state.copyWith(
            userFailureOrSuccessOption: optionOf(resultOrFailure),
          ),
        ),
        (Unit r) => null,
      );
    }
  }

  ///method to pick photo file
  Future<void> pickPhotoFile() async {
    final FilePickerResult? filePickerResult = await pickPhoto();
    final File? choosenFile;
    if (filePickerResult != null) {
      choosenFile = File(filePickerResult.files.last.path!);
    } else {
      choosenFile = null;
    }
    emit(
      state.copyWith(
        filePickerResult: UserPhotoFilePickerResult(filePickerResult),
        chosenPhotoFile: choosenFile,
      ),
    );
  }

  ///method to subscribe update photo on appwrite storage
  void subscribeOnUpdatePhoto() {
    final String userPhotoId = 'photo_$userId';
    _subscription = getIt<Realtime>().subscribe(<String>[
      'buckets.6331920b37c4ada48ccd.files.$userPhotoId',
    ]);
    _subscription!.stream.listen(
      (RealtimeMessage response) async {
        if (kDebugMode) {
          print('subscribeOnUpdatePhoto');
        }
        if (response.events.contains('buckets.6331920b37c4ada48ccd.files.$userPhotoId.create')) {
          await getUserPhoto();
        }
      },
    );
  }

  ///application user id
  String get userId => state.id;
}

String _crutchNameFile = 'userPhoto';
