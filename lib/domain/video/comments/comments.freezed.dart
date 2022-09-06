// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Comments {
  List<Comment> get comments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsCopyWith<Comments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsCopyWith<$Res> {
  factory $CommentsCopyWith(Comments value, $Res Function(Comments) then) =
      _$CommentsCopyWithImpl<$Res>;
  $Res call({List<Comment> comments});
}

/// @nodoc
class _$CommentsCopyWithImpl<$Res> implements $CommentsCopyWith<$Res> {
  _$CommentsCopyWithImpl(this._value, this._then);

  final Comments _value;
  // ignore: unused_field
  final $Res Function(Comments) _then;

  @override
  $Res call({
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentsCopyWith<$Res> implements $CommentsCopyWith<$Res> {
  factory _$$_CommentsCopyWith(
          _$_Comments value, $Res Function(_$_Comments) then) =
      __$$_CommentsCopyWithImpl<$Res>;
  @override
  $Res call({List<Comment> comments});
}

/// @nodoc
class __$$_CommentsCopyWithImpl<$Res> extends _$CommentsCopyWithImpl<$Res>
    implements _$$_CommentsCopyWith<$Res> {
  __$$_CommentsCopyWithImpl(
      _$_Comments _value, $Res Function(_$_Comments) _then)
      : super(_value, (v) => _then(v as _$_Comments));

  @override
  _$_Comments get _value => super._value as _$_Comments;

  @override
  $Res call({
    Object? comments = freezed,
  }) {
    return _then(_$_Comments(
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc

class _$_Comments implements _Comments {
  const _$_Comments({required final List<Comment> comments})
      : _comments = comments;

  final List<Comment> _comments;
  @override
  List<Comment> get comments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'Comments(comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comments &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  _$$_CommentsCopyWith<_$_Comments> get copyWith =>
      __$$_CommentsCopyWithImpl<_$_Comments>(this, _$identity);
}

abstract class _Comments implements Comments {
  const factory _Comments({required final List<Comment> comments}) =
      _$_Comments;

  @override
  List<Comment> get comments;
  @override
  @JsonKey(ignore: true)
  _$$_CommentsCopyWith<_$_Comments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubComments {
  List<SubComment> get subComments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubCommentsCopyWith<SubComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCommentsCopyWith<$Res> {
  factory $SubCommentsCopyWith(
          SubComments value, $Res Function(SubComments) then) =
      _$SubCommentsCopyWithImpl<$Res>;
  $Res call({List<SubComment> subComments});
}

/// @nodoc
class _$SubCommentsCopyWithImpl<$Res> implements $SubCommentsCopyWith<$Res> {
  _$SubCommentsCopyWithImpl(this._value, this._then);

  final SubComments _value;
  // ignore: unused_field
  final $Res Function(SubComments) _then;

  @override
  $Res call({
    Object? subComments = freezed,
  }) {
    return _then(_value.copyWith(
      subComments: subComments == freezed
          ? _value.subComments
          : subComments // ignore: cast_nullable_to_non_nullable
              as List<SubComment>,
    ));
  }
}

/// @nodoc
abstract class _$$_SubCommentsCopyWith<$Res>
    implements $SubCommentsCopyWith<$Res> {
  factory _$$_SubCommentsCopyWith(
          _$_SubComments value, $Res Function(_$_SubComments) then) =
      __$$_SubCommentsCopyWithImpl<$Res>;
  @override
  $Res call({List<SubComment> subComments});
}

/// @nodoc
class __$$_SubCommentsCopyWithImpl<$Res> extends _$SubCommentsCopyWithImpl<$Res>
    implements _$$_SubCommentsCopyWith<$Res> {
  __$$_SubCommentsCopyWithImpl(
      _$_SubComments _value, $Res Function(_$_SubComments) _then)
      : super(_value, (v) => _then(v as _$_SubComments));

  @override
  _$_SubComments get _value => super._value as _$_SubComments;

  @override
  $Res call({
    Object? subComments = freezed,
  }) {
    return _then(_$_SubComments(
      subComments: subComments == freezed
          ? _value._subComments
          : subComments // ignore: cast_nullable_to_non_nullable
              as List<SubComment>,
    ));
  }
}

/// @nodoc

class _$_SubComments implements _SubComments {
  const _$_SubComments({required final List<SubComment> subComments})
      : _subComments = subComments;

  final List<SubComment> _subComments;
  @override
  List<SubComment> get subComments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subComments);
  }

  @override
  String toString() {
    return 'SubComments(subComments: $subComments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubComments &&
            const DeepCollectionEquality()
                .equals(other._subComments, _subComments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_subComments));

  @JsonKey(ignore: true)
  @override
  _$$_SubCommentsCopyWith<_$_SubComments> get copyWith =>
      __$$_SubCommentsCopyWithImpl<_$_SubComments>(this, _$identity);
}

abstract class _SubComments implements SubComments {
  const factory _SubComments({required final List<SubComment> subComments}) =
      _$_SubComments;

  @override
  List<SubComment> get subComments;
  @override
  @JsonKey(ignore: true)
  _$$_SubCommentsCopyWith<_$_SubComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Comment {
  String get commentId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get subCommentCount => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {String commentId,
      String userId,
      String userName,
      String comment,
      int subCommentCount,
      int date});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? commentId = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? comment = freezed,
    Object? subCommentCount = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      subCommentCount: subCommentCount == freezed
          ? _value.subCommentCount
          : subCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String commentId,
      String userId,
      String userName,
      String comment,
      int subCommentCount,
      int date});
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, (v) => _then(v as _$_Comment));

  @override
  _$_Comment get _value => super._value as _$_Comment;

  @override
  $Res call({
    Object? commentId = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? comment = freezed,
    Object? subCommentCount = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_Comment(
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      subCommentCount: subCommentCount == freezed
          ? _value.subCommentCount
          : subCommentCount // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Comment implements _Comment {
  const _$_Comment(
      {required this.commentId,
      required this.userId,
      required this.userName,
      required this.comment,
      required this.subCommentCount,
      required this.date});

  @override
  final String commentId;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String comment;
  @override
  final int subCommentCount;
  @override
  final int date;

  @override
  String toString() {
    return 'Comment(commentId: $commentId, userId: $userId, userName: $userName, comment: $comment, subCommentCount: $subCommentCount, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            const DeepCollectionEquality().equals(other.commentId, commentId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.subCommentCount, subCommentCount) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(commentId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(subCommentCount),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final String commentId,
      required final String userId,
      required final String userName,
      required final String comment,
      required final int subCommentCount,
      required final int date}) = _$_Comment;

  @override
  String get commentId;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get comment;
  @override
  int get subCommentCount;
  @override
  int get date;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubComment {
  String get commentId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get subComment => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubCommentCopyWith<SubComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCommentCopyWith<$Res> {
  factory $SubCommentCopyWith(
          SubComment value, $Res Function(SubComment) then) =
      _$SubCommentCopyWithImpl<$Res>;
  $Res call(
      {String commentId,
      String userName,
      String userId,
      String subComment,
      int date});
}

/// @nodoc
class _$SubCommentCopyWithImpl<$Res> implements $SubCommentCopyWith<$Res> {
  _$SubCommentCopyWithImpl(this._value, this._then);

  final SubComment _value;
  // ignore: unused_field
  final $Res Function(SubComment) _then;

  @override
  $Res call({
    Object? commentId = freezed,
    Object? userName = freezed,
    Object? userId = freezed,
    Object? subComment = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      subComment: subComment == freezed
          ? _value.subComment
          : subComment // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SubCommentCopyWith<$Res>
    implements $SubCommentCopyWith<$Res> {
  factory _$$_SubCommentCopyWith(
          _$_SubComment value, $Res Function(_$_SubComment) then) =
      __$$_SubCommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String commentId,
      String userName,
      String userId,
      String subComment,
      int date});
}

/// @nodoc
class __$$_SubCommentCopyWithImpl<$Res> extends _$SubCommentCopyWithImpl<$Res>
    implements _$$_SubCommentCopyWith<$Res> {
  __$$_SubCommentCopyWithImpl(
      _$_SubComment _value, $Res Function(_$_SubComment) _then)
      : super(_value, (v) => _then(v as _$_SubComment));

  @override
  _$_SubComment get _value => super._value as _$_SubComment;

  @override
  $Res call({
    Object? commentId = freezed,
    Object? userName = freezed,
    Object? userId = freezed,
    Object? subComment = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_SubComment(
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      subComment: subComment == freezed
          ? _value.subComment
          : subComment // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SubComment implements _SubComment {
  const _$_SubComment(
      {required this.commentId,
      required this.userName,
      required this.userId,
      required this.subComment,
      required this.date});

  @override
  final String commentId;
  @override
  final String userName;
  @override
  final String userId;
  @override
  final String subComment;
  @override
  final int date;

  @override
  String toString() {
    return 'SubComment(commentId: $commentId, userName: $userName, userId: $userId, subComment: $subComment, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubComment &&
            const DeepCollectionEquality().equals(other.commentId, commentId) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.subComment, subComment) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(commentId),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(subComment),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_SubCommentCopyWith<_$_SubComment> get copyWith =>
      __$$_SubCommentCopyWithImpl<_$_SubComment>(this, _$identity);
}

abstract class _SubComment implements SubComment {
  const factory _SubComment(
      {required final String commentId,
      required final String userName,
      required final String userId,
      required final String subComment,
      required final int date}) = _$_SubComment;

  @override
  String get commentId;
  @override
  String get userName;
  @override
  String get userId;
  @override
  String get subComment;
  @override
  int get date;
  @override
  @JsonKey(ignore: true)
  _$$_SubCommentCopyWith<_$_SubComment> get copyWith =>
      throw _privateConstructorUsedError;
}
