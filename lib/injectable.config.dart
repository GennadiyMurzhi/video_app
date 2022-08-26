// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/video/sub_comments_cubit/sub_comments_cubit.dart' as _i8;
import 'application/video/video_cubit/video_cubit.dart' as _i9;
import 'application/video_data_list_receiver.dart' as _i11;
import 'application/video_list_cubit/video_list_cubit.dart' as _i10;
import 'data/auth_facade.dart' as _i4;
import 'data/video_repository.dart' as _i7;
import 'domain/auth/i_auth_facade.dart' as _i3;
import 'domain/video/i_video_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthFacade>(() => _i4.AuthFacade(get<_i5.Account>()));
  gh.factory<_i6.IVideoRepository>(
      () => _i7.VideoRepository(get<_i5.Storage>()));
  gh.factory<_i8.SubCommentsCubit>(() => _i8.SubCommentsCubit());
  gh.factory<_i9.VideoCubit>(
      () => _i9.VideoCubit(get<_i6.IVideoRepository>(), get<_i5.Account>()));
  gh.factory<_i10.VideoListCubit>(() => _i10.VideoListCubit(
      get<_i6.IVideoRepository>(),
      get<_i11.VideoDataListReceiver>(),
      get<_i5.Account>()));
  return get;
}
