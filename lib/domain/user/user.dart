import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

///User madel
@freezed
abstract class User with _$User {
  ///pass information for user
  const factory User({
    required String id,
    required String name,
    required String email,
  }) = _User;
}
