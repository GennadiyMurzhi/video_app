import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/widgets/base_loading_widget.dart';
import 'package:video_app/ui/video_list/widgets/video_list_item_widget.dart';

///body for video_list_screen
class VideoListBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<VideoListCubit>(context).state.loading
        ? BaseLoadingWidget()
        : StreamBuilder<VideoDataList>(
            stream: getIt<VideoDataListReceiver>().videoDataListStream,
            builder: (BuildContext context, AsyncSnapshot<VideoDataList> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                  //padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.documents.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: index == 0 ? const EdgeInsets.only(bottom: 15) : const EdgeInsets.symmetric(vertical: 15),
                    child: VideoListItemWidget(
                      name: snapshot.data!.documents[index].name,
                      id: snapshot.data!.documents[index].videoId,
                      userId: snapshot.data!.documents[index].userId,
                      description: snapshot.data!.documents[index].description,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          );
  }
}
