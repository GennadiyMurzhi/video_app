import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/likes_cubit/likes_cubit.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';
import 'package:video_app/ui/likes/likes_body_widget.dart';
import 'package:video_app/ui/upload_video_list/upload_video_list_body_widget.dart';

///screen to display appuser likes
class UploadVideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<VideoListCubit>(
      create: (BuildContext context) => getIt<VideoListCubit>()..initialUploadList(),
      child: BlocConsumer<VideoListCubit, VideoListState>(
        builder: (BuildContext context, VideoListState state) {
          return Layout(
            title: 'Uploaded video',
            functionOnPop: () {
              BlocProvider.of<VideoListCubit>(context).initialUploadList();
              Navigator.of(context).pop();
            },
            functionFab: (_) => Navigator.of(context).pushNamed('/add_video_screen'),
            child: UploadedVideoListBodyWidget(),
          );
        },
        listener: (BuildContext context, VideoListState state) {
          state.videoListFailureOrSuccessOption.fold(
            () => null,
            (Either<Failure, VideoDataList> either) {
              either.fold(
                (Failure failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarCustom(
                      text: failure.maybeWhen(
                        serverError: () => 'Server error',
                        orElse: () => '',
                      ),
                    ),
                  );
                },
                (VideoDataList r) => null,
              );
            },
          );
        },
      ),
    );
  }
}
