import 'package:appwrite/appwrite.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';

///method for subscription on file create and delete on server
void realtimeSubscription() {
  final RealtimeSubscription subscription = getIt<Realtime>().subscribe(['files']);

  subscription.stream.listen(
        (RealtimeMessage response) {
      if (response.events.contains('buckets.*.files.*.create')) {
        showSnackWithText('Realtime: create file in the bucket');
        getIt<VideoListCubit>().updateList();
      }

      if (response.events.contains('buckets.*.files.*.delete')) {
        showSnackWithText('Realtime: delete file in the bucket');
        getIt<VideoListCubit>().updateList();
      }
    },
  );
}
