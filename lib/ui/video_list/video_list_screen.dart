import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/video_list/video_list_item_widget.dart';

///the key is needed in this case in order to get the layout Scaffold context for further call of ScaffoldMessenger
final GlobalKey<ScaffoldState> videoListScreenLayoutKey = GlobalKey<ScaffoldState>(debugLabel: 'videoListScreen global key');

///VideoListScreen is main screen our app. In addition to the list, it also contains FAB
class VideoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<VideoListCubit>(
      create: (BuildContext context) => getIt<VideoListCubit>()..initialList(),
      child: BlocBuilder<VideoListCubit, VideoListState>(
        builder: (BuildContext context, VideoListState state) {
          return Layout(
            layOutKey: videoListScreenLayoutKey,
            title: 'Video List',
            functionFab: BlocProvider.of<VideoListCubit>(context).pickAndUploadVideo,
            child: BlocProvider.of<VideoListCubit>(context).state.loading
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          child: const CircularProgressIndicator(),
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
                          itemCount: snapshot.data!.files.length,
                          itemBuilder: (BuildContext context, int index) => VideoListItemWidget(
                            name: snapshot.data!.files[index].name,
                            id: snapshot.data!.files[index].id,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
          );
        },
      ),
    );
  }
}
