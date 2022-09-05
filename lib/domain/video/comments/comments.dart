import 'package:appwrite/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments.freezed.dart';

///Comments model contains comment list
@freezed
class Comments with _$Comments {
  ///gets a list of comments
  const factory Comments({
    required List<Comment> comments,
  }) = _Comments;

  ///constructor to create a comments model from a list of appwrite documents
  factory Comments.fromDocumentList(List<Document> documentList) => Comments(
        comments: List<Comment>.generate(
          documentList.length,
          (int index) => Comment.fromDocument(documentList[index]),
        ),
      );

  ///constructor to create a comments model with an empty comment list
  factory Comments.empty() => Comments(
        comments: List<Comment>.empty(growable: true),
      );
}

///Sub Comments model contains sub comment list
@freezed
class SubComments with _$SubComments {
  ///gets a list of sub comments
  const factory SubComments({
    required List<SubComment> subComments,
  }) = _SubComments;

  ///constructor to create a sub comments model from a list of appwrite documents
  factory SubComments.fromDocumentList(List<Document> documentList) => SubComments(
        subComments: List<SubComment>.generate(
          documentList.length,
          (int index) => SubComment.fromDocument(documentList[index]),
        ),
      );

  ///constructor to create a sub comments model with an empty comment list
  factory SubComments.empty() => SubComments(
        subComments: List<SubComment>.empty(growable: true),
      );
}

///Comment model
@freezed
class Comment with _$Comment {
  ///gets the general information of the commentary
  const factory Comment({
    required String commentId,
    required String userId,
    required String userName,
    required String comment,
    required int subCommentCount,
    required int date,
  }) = _Comment;

  ///constructor to create a comment model from a appwrite document
  factory Comment.fromDocument(Document document) => Comment(
        commentId: document.$id,
        userName: document.data['user_name'] as String,
        userId: document.data['user_id'] as String,
        comment: document.data['comment'] as String,
        subCommentCount: document.data['sub_comment_count'] as int,
        date: document.data['date'] as int,
      );
}

///sub comments model
@freezed
class SubComment with _$SubComment {
  ///gets the general information of the commentary
  const factory SubComment({
    required String userName,
    required String userId,
    required String subComment,
    required int date,
  }) = _SubComment;

  ///constructor to create a sub comment model from a appwrite document
  factory SubComment.fromDocument(Document document) => SubComment(
        userName: document.data['user_name'] as String,
        userId: document.data['user_id'] as String,
        subComment: document.data['sub_comment'] as String,
        date: document.data['date'] as int,
      );
}
