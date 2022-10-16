import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/widgets/base_loading_widget.dart';
import 'package:video_app/ui/upload_video_list/upload_video_list_item_widget.dart';
import 'package:video_app/ui/video_list/widgets/video_list_item_widget.dart';

///body for video_list_screen
class UploadedVideoListBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<VideoListCubit>(context).state.loading
        ? BaseLoadingWidget()
        : StreamBuilder<VideoDataList>(
            stream: getIt<VideoDataListReceiver>().videoDataListStream,
            builder: (BuildContext context, AsyncSnapshot<VideoDataList> snapshot) {
              if (snapshot.data != null) {
                return ListView(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        'Upload videos',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xFF3F3FA2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Upload ${snapshot.data!.total} videos',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    ...List<Widget>.generate(
                      snapshot.data!.documents.length,
                      (int index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(top: 30, bottom: 15)
                            : const EdgeInsets.symmetric(vertical: 15),
                        child: UploadVideoListItemWidget(
                          videoName: snapshot.data!.documents[index].name,
                          videoId: snapshot.data!.documents[index].videoId,
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
