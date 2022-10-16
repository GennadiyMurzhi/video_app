import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/likes_cubit/likes_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';
import 'package:video_app/ui/likes/likes_body_widget.dart';

///screen to display appuser likes
class LikesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LikesCubit>(
      create: (BuildContext context) => getIt<LikesCubit>()..init(),
      child: BlocConsumer<LikesCubit, LikesState>(
        builder: (BuildContext context, LikesState state) {
          return Layout(
            title: 'Likes list',
            functionOnPop: () => Navigator.of(context).pop(),
            child: LikesBodyWidget(),
          );
        },
        listener: (BuildContext context, LikesState state) {
          state.likesFailureOrSuccessOption.fold(
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
        },
      ),
    );
  }
}
