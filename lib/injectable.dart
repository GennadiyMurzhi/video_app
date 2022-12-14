import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/likes/like.dart';
import 'package:video_app/domain/subscriptions/subscription.dart';
import 'package:video_app/domain/video/comments/comments.dart';
import 'package:video_app/domain/video/uploaded_video.dart';
import 'package:video_app/domain/video/video.dart';
import 'package:video_app/injectable.config.dart';

///instance of GetIt
final GetIt getIt = GetIt.instance;

///This method needed for configure GetIt
@injectableInit
Future<void> configureInjection(String env) async {
  $initGetIt(getIt, environment: env);

  getIt.registerLazySingleton<Client>(
    () => Client()
      ..setProject('62e3e3500061cd4fb81d')
      ..setSelfSigned(),
  );

  getIt.registerLazySingleton<Storage>(() => Storage(getIt<Client>()));

  getIt.registerLazySingleton<Functions>(() => Functions(getIt<Client>()));

  final Account account = Account(getIt<Client>());
  getIt.registerLazySingleton<Account>(() => account);

  if (kIsWeb) {
    getIt<Client>().setEndpoint('https://localhost/v1');

    account.createOAuth2Session(provider: 'auth0', success: 'http://localhost:33677/auth.html');

    getIt.registerLazySingleton<Realtime>(() => Realtime(getIt<Client>()));
  } else {
    getIt<Client>().setEndpoint('http://192.168.1.154/v1');

    //await account.createAnonymousSession();
    getIt.registerLazySingleton<Realtime>(() => Realtime(getIt<Client>()));
    //await account.deleteSessions();
  }

  getIt.registerLazySingleton<VideoDataListReceiver>(() => VideoDataListReceiver(VideoDataList.empty()));
  getIt.registerLazySingleton<DataListReceiver<Comments>>(() => DataListReceiver<Comments>(Comments.empty()));
  getIt.registerLazySingleton<DataListReceiver<SubComments>>(() => DataListReceiver<SubComments>(SubComments.empty()));
  getIt.registerLazySingleton<DataListReceiver<Likes>>(() => DataListReceiver<Likes>(Likes.empty()));
  getIt.registerLazySingleton<DataListReceiver<Subscriptions>>(() => DataListReceiver<Subscriptions>(Subscriptions.empty()));
  getIt.registerLazySingleton<DataListReceiver<UploadedVideoDataList>>(() => DataListReceiver<UploadedVideoDataList>(UploadedVideoDataList.empty()));
}
