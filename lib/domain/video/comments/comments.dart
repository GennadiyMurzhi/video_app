import 'package:appwrite/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments.freezed.dart';

@freezed
class Comments with _$Comments {
  const factory Comments({
    required List<Comment> comments,
  }) = _Comments;

  factory Comments.fromDocumentList(List<Document> documentList) => Comments(
        comments: List<Comment>.generate(
          documentList.length,
          (index) => Comment.fromDocument(documentList[index]),
        ),
      );
  factory Comments.empty() => Comments(
    comments: List<Comment>.empty(growable: true),
  );
}

@freezed
class SubComments with _$SubComments {
  const factory SubComments({
    required List<SubComment> subComments,
  }) = _SubComments;

  factory SubComments.fromDocumentList(List<Document> documentList) => SubComments(
        subComments: List<SubComment>.generate(
          documentList.length,
          (index) => SubComment.fromDocument(documentList[index]),
        ),
      );
  factory SubComments.empty() => SubComments(
    subComments: List<SubComment>.empty(growable: true),
  );
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String commentId,
    required String userId,
    required String userName,
    required String comment,
    required int subCommentCount,
    required int date,
  }) = _Comment;

  factory Comment.fromDocument(Document document) => Comment(
        commentId: document.$id,
        userName: document.data['user_name'] as String,
        userId: document.data['user_id'] as String,
        comment: document.data['comment'] as String,
        subCommentCount: document.data['sub_comment_count'] as int,
        date: document.data['date'] as int,
      );
}

@freezed
class SubComment with _$SubComment {
  const factory SubComment({
    required String userName,
    required String userId,
    required String subComment,
    required int date,
  }) = _SubComment;

  factory SubComment.fromDocument(Document document) => SubComment(
        userName: document.data['user_name'] as String,
        userId: document.data['user_id'] as String,
        subComment: document.data['sub_comment'] as String,
        date: document.data['date'] as int,
      );
}
