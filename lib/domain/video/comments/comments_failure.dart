import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_failure.freezed.dart';

///failures occurring during comments manipulation
@freezed
abstract class CommentsFailure with _$CommentsFailure {
  ///general server error
  const factory CommentsFailure.serverError() = ServerError;
}
