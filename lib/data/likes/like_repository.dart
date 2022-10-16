import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/domain/likes/i_like_repository.dart';
import 'package:video_app/domain/likes/like.dart';

const String _videoLikesCollectionId = '6342d4582b51c9e0d48c';

///repository to like manipulation
@Injectable(as: ILikeRepository)
class LikeRepository extends ILikeRepository {
  ///pass function ti manipulate on server
  LikeRepository(this._functions, Client client) {
    _likeDatabases = Databases(client, databaseId: '633db14289b33423a068');
    _videoDatabases = Databases(client, databaseId: '62e3faba8623b7647567');
  }

  final Functions _functions;
  late final Databases _likeDatabases;
  late final Databases _videoDatabases;

  @override
  Future<Either<Failure, Likes>> getListLikesForAppUser(String appUserId) async {
    try {
      final DocumentList documentList = await _likeDatabases.listDocuments(
        collectionId: 'likes_$appUserId',
      );
      return right(Likes.fromDocumentList(documentList.documents));
    } catch (e) {
      print('$e\n\n\n\n');
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> likeVideo({
    required bool isLike,
    required String videoId,
  }) async {
    final Map<String, dynamic> data = <String, dynamic>{
      'isLike': isLike,
      'video_file_id': videoId,
    };
    try {
      Execution execution = await _functions.createExecution(
        functionId: 'likeFunction',
        data: jsonEncode(data),
      );
      while (true) {
        execution = await _functions.getExecution(
          functionId: execution.functionId,
          executionId: execution.$id,
        );

        if (execution.status == 'completed') {
          break;
        }

        if (execution.status == 'failed') {
          break;
        }

        await Future<void>.delayed(const Duration(milliseconds: 150));
      }

      if (execution.status == 'completed') {
        return right(unit);
      } else {
        return left(const Failure.serverError());
      }
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, bool>> isUserLiked(String userId, String videoId) async {
    try {
      final DocumentList likesDocument = await _likeDatabases.listDocuments(
        collectionId: 'likes_$userId',
        queries: <dynamic>[
          Query.equal('video_id', videoId),
        ],
      );
      if (likesDocument.total != 0) {
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, bool>> isUserDisliked(String userId, String videoId) async {
    try {
      final DocumentList likesDocument = await _likeDatabases.listDocuments(
        collectionId: 'dislikes_$userId',
        queries: <dynamic>[
          Query.equal('video_id', videoId),
        ],
      );
      if (likesDocument.total != 0) {
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return left(const Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Map<String, int>>> getLikesDislikesCount(String videoId) async {
    try {
      final Document videoLikesDocument =
          await _videoDatabases.getDocument(collectionId: _videoLikesCollectionId, documentId: 'likes_$videoId');
      return right(<String, int>{
        'likes_count': videoLikesDocument.data['likes_count'] as int,
        'dislikes_count': videoLikesDocument.data['dislikes_count'] as int,
      });
    } catch (e) {
      return left(const Failure.serverError());
    }
  }
}
