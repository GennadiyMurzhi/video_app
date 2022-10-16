import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/video/video_event.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';
import 'package:video_app/ui/video_list/widgets/video_list_body_widget.dart';

///VideoListScreen is main screen our app. In addition to the list, it also contains FAB
class VideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (BuildContext context, UserState userState) {
        return BlocProvider<VideoListCubit>(
          create: (BuildContext context) => getIt<VideoListCubit>()..initialList(),
          child: BlocConsumer<VideoListCubit, VideoListState>(
            builder: (BuildContext context, VideoListState state) {
              return Layout(
                title: 'Video List',
                child: VideoListBodyWidget(),
              );
            },
            listener: (BuildContext context, VideoListState state) {
              state.videoListFailureOrSuccessOption.fold(
                () => null,
                (Either<Failure, Unit> either) {
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
                    (Unit r) => null,
                  );
                },
              );
              state.event.fold(
                () => null,
                (VideoEvent event) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarCustom(
                      text: event.when(
                        deleted: () => 'The video was deleted. List updated',
                        newVideo: () => 'A new video has been added. List updated',
                        updated: () => 'Some video has been updated. List updated',
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
