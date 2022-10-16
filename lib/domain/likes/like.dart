import 'package:appwrite/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';

///Likes List
@freezed
class Likes with _$Likes {
  ///total variable is total number of files
  ///
  ///files variable is list of files presented in the form of likes
  const factory Likes ({
    required int total,
    required List<Like> likes,
  }) = _Likes;

  ///Empty Likes
  factory Likes.empty () => const Likes(total: 0, likes: <Like>[]);

  ///method to make Likes from documents
  factory Likes.fromDocumentList(List<Document> documentList) => Likes(
    total: documentList.length,
    likes: List<Like>.generate(
      documentList.length,
          (int index) => Like.fromDocument(documentList[index]),
    ),
  );
}

///Like contain information about like on the server
@freezed
class Like with _$Like{
  ///pass the variables to the appropriate model
  const factory Like ({
    required String likeId,
    required String videoId,
    required String videoName,
    required String userName,
  }) = _Like;

  ///method to make Like from documents
  factory Like.fromDocument(Document document) => Like(
    likeId: document.$id,
    videoId: document.data['video_id'] as String,
    videoName: document.data['videoName'] as String,
    userName: document.data['videoUserName'] as String,
  );
}
