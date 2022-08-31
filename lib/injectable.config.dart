// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_cubit/auth_cubit.dart' as _i15;
import 'application/auth/auth_form_cubit/auth_form_cubit.dart' as _i16;
import 'application/user_cubit/user_cubit.dart' as _i11;
import 'application/video/comments_cubit/comments_cubit.dart' as _i17;
import 'application/video/sub_comments_cubit/sub_comments_cubit.dart' as _i10;
import 'application/video/video_cubit/video_cubit.dart' as _i12;
import 'application/video_data_list_receiver.dart' as _i14;
import 'application/video_list_cubit/video_list_cubit.dart' as _i13;
import 'data/auth/auth_facade.dart' as _i4;
import 'data/video/comments/comments_repository.dart' as _i7;
import 'data/video/video_repository.dart' as _i9;
import 'domain/auth/i_auth_facade.dart' as _i3;
import 'domain/video/comments/i_comments_repository.dart' as _i6;
import 'domain/video/i_video_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IAuthFacade>(() => _i4.AuthFacade(get<_i5.Account>()));
  gh.factory<_i6.ICommentsRepository>(
      () => _i7.CommentsRepository(get<_i5.Client>()));
  gh.factory<_i8.IVideoRepository>(
      () => _i9.VideoRepository(get<_i5.Storage>()));
  gh.factory<_i10.SubCommentsCubit>(
      () => _i10.SubCommentsCubit(get<_i6.ICommentsRepository>()));
  gh.factory<_i11.UserCubit>(() => _i11.UserCubit(get<_i3.IAuthFacade>()));
  gh.factory<_i12.VideoCubit>(
      () => _i12.VideoCubit(get<_i8.IVideoRepository>(), get<_i5.Account>()));
  gh.factory<_i13.VideoListCubit>(() => _i13.VideoListCubit(
      get<_i8.IVideoRepository>(),
      get<_i14.VideoDataListReceiver>(),
      get<_i5.Account>()));
  gh.factory<_i15.AuthCubit>(() => _i15.AuthCubit(get<_i3.IAuthFacade>()));
  gh.factory<_i16.AuthFormCubit>(
      () => _i16.AuthFormCubit(get<_i3.IAuthFacade>()));
  gh.factory<_i17.CommentsCubit>(
      () => _i17.CommentsCubit(get<_i6.ICommentsRepository>()));
  return get;
}
