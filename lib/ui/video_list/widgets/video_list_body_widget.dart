import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/video_list/widgets/video_list_item_widget.dart';

///body for video_list_screen
class VideoListBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<VideoListCubit>(context).state.loading
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (kIsWeb)
                  const SizedBox(
                    width: 300,
                    height: 300,
                    child: CircularProgressIndicator(),
                  )
                else
                  const SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(),
                  ),
                const SizedBox(height: 20),
                Text(
                  'Loading...',
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          )
        : StreamBuilder<VideoDataList>(
            stream: getIt<VideoDataListReceiver>().videoDataListStream,
            builder: (BuildContext context, AsyncSnapshot<VideoDataList> snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.documents.length,
                  itemBuilder: (BuildContext context, int index) => VideoListItemWidget(
                    name: snapshot.data!.documents[index].name,
                    id: snapshot.data!.documents[index].videoId,
                    userId: snapshot.data!.documents[index].userId,
                    description: snapshot.data!.documents[index].description,
                  ),
                );
              } else {
                return Container();
              }
            },
          );
  }
}