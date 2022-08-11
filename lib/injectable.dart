import 'package:appwrite/appwrite.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/video.dart';
import 'package:video_app/injectable.config.dart';

///instance of GetIt
final GetIt getIt = GetIt.instance;

///This method needed for configure GetIt
@injectableInit
Future<void> configureInjection(String env) async {
  $initGetIt(getIt, environment: env);

  getIt.registerLazySingleton<Client>(
    () => Client()
      //..setEndpoint('https://localhost/v1')
      ..setEndpoint('https://10.0.2.2/v1')
      ..setProject('62e3e3500061cd4fb81d')
      ..setSelfSigned(),
  );

  final Account account = Account(getIt<Client>());
  getIt.registerLazySingleton<Account>(() => account);

  getIt.registerLazySingleton<Storage>(() => Storage(getIt<Client>()));

  await account.createAnonymousSession();
  getIt.registerLazySingleton<Realtime>(() => Realtime(getIt<Client>()));
  await account.deleteSessions();

  getIt.registerLazySingleton<VideoDataListReceiver>(() => VideoDataListReceiver(VideoDataList.empty()));
}
