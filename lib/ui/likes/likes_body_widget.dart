import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/likes_cubit/likes_cubit.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/likes/like.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/widgets/base_loading_widget.dart';
import 'package:video_app/ui/likes/like_item_widget.dart';

///body widget for likes list screen
class LikesBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String appUserName = getIt<UserCubit>().state.name;

    return BlocProvider.of<LikesCubit>(context).state.loading
        ? BaseLoadingWidget()
        : StreamBuilder<Likes>(
            stream: getIt<DataListReceiver<Likes>>().dataListStream,
            builder: (BuildContext context, AsyncSnapshot<Likes> snapshot) {
              if (snapshot.data != null) {
                return ListView(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Liked videos',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: const Color(0xFF3F3FA2),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.lock,
                            size: 12,
                            color: Color(0xFFA1A1A1),
                          )
                        ],
                      ),
                    ),
                    Text(
                      appUserName,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xFF3F3FA2),
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${snapshot.data!.total} videos',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    ...List<Widget>.generate(
                      snapshot.data!.likes.length,
                      (int index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(top: 30, bottom: 15)
                            : const EdgeInsets.symmetric(vertical: 15),
                        child: LikeItemWidget(
                          videoName: snapshot.data!.likes[index].videoName,
                          userName: snapshot.data!.likes[index].userName,
                          videoId: snapshot.data!.likes[index].videoId,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          );
  }
}
