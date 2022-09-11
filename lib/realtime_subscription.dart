import 'package:appwrite/appwrite.dart';
import 'package:video_app/application/video_list_cubit/video_list_cubit.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';

///method for subscription on file create and delete on server
void realtimeSubscriptionToVideoEvent() {
  final RealtimeSubscription subscription =
      getIt<Realtime>().subscribe(['databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents']);

  subscription.stream.listen(
    (RealtimeMessage response) {
      if (response.events.contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.create')) {
        showSnackWithText('Realtime: create file in the bucket');
        getIt<VideoListCubit>().updateList();
      }

      if (response.events.contains('databases.62e3faba8623b7647567.collections.631b4f2663f40f701b38.documents.*.delete')) {
        showSnackWithText('Realtime: delete file in the bucket');
        getIt<VideoListCubit>().updateList();
      }
    },
  );
}
