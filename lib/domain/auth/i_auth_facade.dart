import 'package:dartz/dartz.dart';
import 'package:video_app/domain/auth/auth_failure.dart';
import 'package:video_app/domain/user/user.dart';
import 'package:video_app/domain/auth/value_objects.dart';

///contract to create an authorization class
abstract class IAuthFacade{
  ///method to get signed user data
  Future<Option<User>> getSignedInUser();

  ///method for register new user on the server
  Future<Either<AuthFailure, Unit>> register({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
  });

  ///method for authorize user with email and password on the server
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  ///method for unauthorized user on the server
  Future<void> signOut();
}
