import 'package:dartz/dartz.dart';
import 'package:video_app/domain/auth/auth_failure.dart';
import 'package:video_app/domain/auth/user.dart';
import 'package:video_app/domain/auth/value_objects.dart';

abstract class IAuthFacade{
  Future<Option<User>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> register({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<void> signOut();
}
