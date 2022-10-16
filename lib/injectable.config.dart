// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_cubit/auth_cubit.dart' as _i26;
import 'application/auth/auth_form_cubit/auth_form_cubit.dart' as _i27;
import 'application/likes_cubit/likes_cubit.dart' as _i18;
import 'application/subscriptions_cubit/subscriptions_cubit.dart' as _i20;
import 'application/user_cubit/user_cubit.dart' as _i21;
import 'application/video/add_video_cubit/add_video_cubit.dart' as _i25;
import 'application/video/comments/comments_cubit/comments_cubit.dart' as _i28;
import 'application/video/comments/edit_old_comments_cubit/edit_old_comment_cubit.dart'
    as _i29;
import 'application/video/comments/sub_comments_cubit/sub_comments_cubit.dart'
    as _i19;
import 'application/video/edit_video_cubit/edit_video_cubit.dart' as _i30;
import 'application/video/video_cubit/video_cubit.dart' as _i22;
import 'application/video_data_list_receiver.dart' as _i24;
import 'application/video_list_cubit/video_list_cubit.dart' as _i23;
import 'data/auth/auth_facade.dart' as _i4;
import 'data/likes/like_repository.dart' as _i9;
import 'data/photo/photo_repository.dart' as _i11;
import 'data/subscriptions/subscription_repository.dart' as _i13;
import 'data/user/user_repository.dart' as _i15;
import 'data/video/comments/comments_repository.dart' as _i7;
import 'data/video/video_repository.dart' as _i17;
import 'domain/auth/i_auth_facade.dart' as _i3;
import 'domain/likes/i_like_repository.dart' as _i8;
import 'domain/photo/i_photo_repository.dart' as _i10;
import 'domain/subscriptions/i_subscription_reposytory.dart' as _i12;
import 'domain/user/i_user_repository.dart' as _i14;
import 'domain/video/comments/i_comments_repository.dart' as _i6;
import 'domain/video/i_video_repository.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IAuthFacade>(() => _i4.AuthFacade(get<_i5.Account>()));
  gh.factory<_i6.ICommentsRepository>(
      () => _i7.CommentsRepository(get<_i5.Client>()));
  gh.factory<_i8.ILikeRepository>(() => _i9.LikeRepository(
        get<_i5.Functions>(),
        get<_i5.Client>(),
      ));
  gh.factory<_i10.IPhotoRepository>(
      () => _i11.PhotoRepository(get<_i5.Storage>()));
  gh.factory<_i12.ISubscriptionRepository>(
      () => _i13.SubscriptionRepository(get<_i5.Client>()));
  gh.factory<_i14.IUserRepository>(
      () => _i15.UserRepository(get<_i5.Storage>()));
  gh.factory<_i16.IVideoRepository>(() => _i17.VideoRepository(
        get<_i5.Storage>(),
        get<_i5.Client>(),
      ));
  gh.factory<_i18.LikesCubit>(() => _i18.LikesCubit(
        get<_i8.ILikeRepository>(),
        get<_i16.IVideoRepository>(),
        get<_i5.Realtime>(),
      ));
  gh.factory<_i19.SubCommentsCubit>(
      () => _i19.SubCommentsCubit(get<_i6.ICommentsRepository>()));
  gh.factory<_i20.SubscriptionsCubit>(() => _i20.SubscriptionsCubit(
        get<_i12.ISubscriptionRepository>(),
        get<_i10.IPhotoRepository>(),
        get<_i5.Realtime>(),
      ));
  gh.lazySingleton<_i21.UserCubit>(() => _i21.UserCubit(
        get<_i3.IAuthFacade>(),
        get<_i14.IUserRepository>(),
      ));
  gh.factory<_i22.VideoCubit>(() => _i22.VideoCubit(
        get<_i16.IVideoRepository>(),
        get<_i10.IPhotoRepository>(),
        get<_i8.ILikeRepository>(),
        get<_i12.ISubscriptionRepository>(),
      ));
  gh.factory<_i23.VideoListCubit>(() => _i23.VideoListCubit(
        get<_i16.IVideoRepository>(),
        get<_i24.VideoDataListReceiver>(),
        get<_i5.Realtime>(),
      ));
  gh.factory<_i25.AddVideoCubit>(
      () => _i25.AddVideoCubit(get<_i16.IVideoRepository>()));
  gh.lazySingleton<_i26.AuthCubit>(
      () => _i26.AuthCubit(get<_i3.IAuthFacade>()));
  gh.factory<_i27.AuthFormCubit>(
      () => _i27.AuthFormCubit(get<_i3.IAuthFacade>()));
  gh.factory<_i28.CommentsCubit>(() => _i28.CommentsCubit(
        get<_i6.ICommentsRepository>(),
        get<_i10.IPhotoRepository>(),
      ));
  gh.factory<_i29.EditOldCommentCubit>(
      () => _i29.EditOldCommentCubit(get<_i6.ICommentsRepository>()));
  gh.factory<_i30.EditVideoCubit>(
      () => _i30.EditVideoCubit(get<_i16.IVideoRepository>()));
  return get;
}
