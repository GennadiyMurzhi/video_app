import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/auth/auth_failure.dart';
import 'package:video_app/domain/auth/i_auth_facade.dart';
import 'package:video_app/domain/auth/user.dart' as video;
import 'package:video_app/domain/auth/valua_objects.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade extends IAuthFacade {
  AuthFacade(this._account);

  Account _account;

  @override
  Future<Either<AuthFailure, video.User>> getSignedInUser() async {
    try {
      final User user = await _account.get();
      return Right(
        video.User(
          id: user.$id,
          name: user.name,
          email: user.email,
        ),
      );
    } catch (e) {
      return Left(AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> register({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final String nameStr = name.getOrCrash();
    final String emailAddressStr = emailAddress.getOrCrash();
    final String passwordStr = password.getOrCrash();

    try {
      await _account.create(
        userId: 'unique()',
        name: nameStr,
        email: emailAddressStr,
        password: passwordStr,
      );

      return Right(unit);
    } on AppwriteException catch (e) {
      if (e.type! == 'user_email_already_exists') {
        return Left(AuthFailure.emailAlreadyInUsed());
      } else {
        return Left(AuthFailure.serverError());
      }
    }

  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({required EmailAddress emailAddress, required Password password,}) async {
    final String emailAddressStr = emailAddress.getOrCrash();
    final String passwordStr = password.getOrCrash();

    try {
      await _account.createEmailSession(email: emailAddressStr, password: passwordStr,);

      return Right(unit);
    } on AppwriteException catch (e) {
      if(e.type! == 'user_invalid_credentials') {
        return Left(AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return Left(AuthFailure.serverError());
      }
    }
  }

  @override
  Future<void> signOut() {
    return Future.wait([
      _account.deleteSessions()
    ]);
  }
}
