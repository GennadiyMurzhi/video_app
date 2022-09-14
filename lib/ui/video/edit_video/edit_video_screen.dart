import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video/add_video_cubit/add_video_cubit.dart';
import 'package:video_app/application/video/edit_video_cubit/edit_video_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/failures.dart';
import 'package:video_app/domain/video/success.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';
import 'package:video_app/ui/video/edit_video/widgets/while_editing_widgets.dart';

///screen for editing video information, deleting and replace video file
class EditVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditVideoParams videoParams = ModalRoute.of(context)!.settings.arguments as EditVideoParams;

    return BlocProvider<EditVideoCubit>(
      create: (BuildContext context) => getIt<EditVideoCubit>()
        ..init(
          name: videoParams.name,
          description: videoParams.description,
          videoId: videoParams.videoId,
          deleteVideo: videoParams.deleteVideo,
          updateVideo: videoParams.updateVideo,
        ),
      child: BlocConsumer<EditVideoCubit, AddVideoState>(
        builder: (BuildContext context, AddVideoState state) {
          return Layout(
            name: BlocProvider.of<UserCubit>(context).state.name,
            userId: BlocProvider.of<UserCubit>(context).state.id,
            emailAddress: BlocProvider.of<UserCubit>(context).state.emailAddress,
            functionOnPop: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              Navigator.of(context).pop();
            },
            addAction: state.editingVideoName != null || state.editingVideoDescription != null
                ? () => BlocProvider.of<EditVideoCubit>(context).updateInformation(videoParams.videoId)
                : null,
            title: 'Edit video',
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: <Widget>[
                if (state.editingVideoName != null)
                  state.editingVideoName!
                      ? WhileEditing(
                          initialValue: state.name.isValid() ? state.name.getOrCrash() : '',
                          hintText: 'name',
                          editValueFunction: BlocProvider.of<EditVideoCubit>(context).editVideoName,
                          validator: () => BlocProvider.of<EditVideoCubit>(context).state.name.value.fold(
                            (AddVideoValueFailure<String> l) => l.maybeMap(
                              emptyStringName: (_) {
                                return 'Enter name video';
                              },
                              longStringName: (_) {
                                return 'Max lenth 120';
                              },
                              orElse: () => null,
                            ),
                            (String r) {
                              return null;
                            },
                          ),
                          endEditing: BlocProvider.of<EditVideoCubit>(context).endEditName,
                        )
                      : WhileNotEditing(
                          fieldString: state.name.getOrCrash(),
                          startEditing: BlocProvider.of<EditVideoCubit>(context).startEditName,
                        )
                else
                  WhileNotEditing(
                    fieldString: state.name.getOrCrash(),
                    startEditing: BlocProvider.of<EditVideoCubit>(context).startEditName,
                  ),
                if (state.editingVideoDescription != null)
                  state.editingVideoDescription!
                      ? WhileEditing(
                          initialValue: state.description.isValid() ? state.description.getOrCrash() : '',
                          hintText: 'description',
                          editValueFunction: BlocProvider.of<EditVideoCubit>(context).editVideoDescription,
                          validator: () => BlocProvider.of<EditVideoCubit>(context).state.description.value.fold(
                            (AddVideoValueFailure<String> l) => l.maybeMap(
                              emptyStringDescription: (_) {
                                return 'Enter description video';
                              },
                              longStringDescription: (_) {
                                return 'Max lenth 1024';
                              },
                              orElse: () => null,
                            ),
                            (String r) {
                              return null;
                            },
                          ),
                          endEditing: BlocProvider.of<EditVideoCubit>(context).endEditingDescription,
                        )
                      : WhileNotEditing(
                          fieldString: state.description.getOrCrash(),
                          startEditing: BlocProvider.of<EditVideoCubit>(context).startEditingDescription,
                        )
                else
                  WhileNotEditing(
                    fieldString: state.description.getOrCrash(),
                    startEditing: BlocProvider.of<EditVideoCubit>(context).startEditingDescription,
                  ),
                ElevatedButton(
                  onPressed: () => videoParams.updateVideo(), //updateVideo(),
                  child: Text(
                    'Replace video',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                if (kIsWeb) const SizedBox(height: 20) else const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    videoParams.deleteVideo();
                    Navigator.popUntil(context, ModalRoute.withName('/video_list_screen'));
                  }, //deleteVideo(),
                  child: Text(
                    'Delete video',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, AddVideoState state) {
          state.addVideoFailureOrSuccessOption.fold(
            () => null,
            (Either<Failure, Success> a) {
              a.fold(
                (Failure failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarCustom(
                      text: failure.when(serverError: () => 'Server error', fileNotChoose: () => 'File not choosen'),
                    ),
                  );
                },
                (Success success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarCustom(
                      text: success.maybeWhen(
                        videoInfoUpdated: () => 'Video Info Updated',
                        videoReplaced: () => 'Video Replaced',
                        videoDeleted: () => 'Video Deleted',
                        orElse: () => '',
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

///class for transferring data in pushNamed
class EditVideoParams {
  ///id need to get file. directoryPath need for create path
  const EditVideoParams({
    required this.name,
    required this.description,
    required this.videoId,
    required this.deleteVideo,
    required this.updateVideo,
  });

  ///File name on the server
  final String name;

  ///File ID in bucket
  final String videoId;

  ///video description
  final String description;

  ///function for deleting video
  final void Function() deleteVideo;

  ///function for updating\displaying video
  final void Function() updateVideo;
}
