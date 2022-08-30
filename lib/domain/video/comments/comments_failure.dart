import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_failure.freezed.dart';

@freezed
abstract class CommentsFailure with _$CommentsFailure {
  const factory CommentsFailure.serverError() = ServerError;
}
