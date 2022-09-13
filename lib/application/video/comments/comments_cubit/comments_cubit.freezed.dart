// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comments_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentsState {
  bool get loading => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  String get videoFileId => throw _privateConstructorUsedError;
  CommentObject get comment => throw _privateConstructorUsedError;
  Option<Either<CommentsFailure, dynamic>> get commentsFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsStateCopyWith<CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsStateCopyWith<$Res> {
  factory $CommentsStateCopyWith(
          CommentsState value, $Res Function(CommentsState) then) =
      _$CommentsStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      bool showErrorMessage,
      String videoFileId,
      CommentObject comment,
      Option<Either<CommentsFailure, dynamic>> commentsFailureOrSuccessOption});
}

/// @nodoc
class _$CommentsStateCopyWithImpl<$Res>
    implements $CommentsStateCopyWith<$Res> {
  _$CommentsStateCopyWithImpl(this._value, this._then);

  final CommentsState _value;
  // ignore: unused_field
  final $Res Function(CommentsState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? showErrorMessage = freezed,
    Object? videoFileId = freezed,
    Object? comment = freezed,
    Object? commentsFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      videoFileId: videoFileId == freezed
          ? _value.videoFileId
          : videoFileId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentObject,
      commentsFailureOrSuccessOption: commentsFailureOrSuccessOption == freezed
          ? _value.commentsFailureOrSuccessOption
          : commentsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CommentsFailure, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_CommentsStateCopyWith<$Res>
    implements $CommentsStateCopyWith<$Res> {
  factory _$$_CommentsStateCopyWith(
          _$_CommentsState value, $Res Function(_$_CommentsState) then) =
      __$$_CommentsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      bool showErrorMessage,
      String videoFileId,
      CommentObject comment,
      Option<Either<CommentsFailure, dynamic>> commentsFailureOrSuccessOption});
}

/// @nodoc
class __$$_CommentsStateCopyWithImpl<$Res>
    extends _$CommentsStateCopyWithImpl<$Res>
    implements _$$_CommentsStateCopyWith<$Res> {
  __$$_CommentsStateCopyWithImpl(
      _$_CommentsState _value, $Res Function(_$_CommentsState) _then)
      : super(_value, (v) => _then(v as _$_CommentsState));

  @override
  _$_CommentsState get _value => super._value as _$_CommentsState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? showErrorMessage = freezed,
    Object? videoFileId = freezed,
    Object? comment = freezed,
    Object? commentsFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_CommentsState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      videoFileId: videoFileId == freezed
          ? _value.videoFileId
          : videoFileId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentObject,
      commentsFailureOrSuccessOption: commentsFailureOrSuccessOption == freezed
          ? _value.commentsFailureOrSuccessOption
          : commentsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CommentsFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_CommentsState implements _CommentsState {
  const _$_CommentsState(
      {required this.loading,
      required this.showErrorMessage,
      required this.videoFileId,
      required this.comment,
      required this.commentsFailureOrSuccessOption});

  @override
  final bool loading;
  @override
  final bool showErrorMessage;
  @override
  final String videoFileId;
  @override
  final CommentObject comment;
  @override
  final Option<Either<CommentsFailure, dynamic>> commentsFailureOrSuccessOption;

  @override
  String toString() {
    return 'CommentsState(loading: $loading, showErrorMessage: $showErrorMessage, videoFileId: $videoFileId, comment: $comment, commentsFailureOrSuccessOption: $commentsFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentsState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessage, showErrorMessage) &&
            const DeepCollectionEquality()
                .equals(other.videoFileId, videoFileId) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(
                other.commentsFailureOrSuccessOption,
                commentsFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(showErrorMessage),
      const DeepCollectionEquality().hash(videoFileId),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(commentsFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      __$$_CommentsStateCopyWithImpl<_$_CommentsState>(this, _$identity);
}

abstract class _CommentsState implements CommentsState {
  const factory _CommentsState(
      {required final bool loading,
      required final bool showErrorMessage,
      required final String videoFileId,
      required final CommentObject comment,
      required final Option<Either<CommentsFailure, dynamic>>
          commentsFailureOrSuccessOption}) = _$_CommentsState;

  @override
  bool get loading;
  @override
  bool get showErrorMessage;
  @override
  String get videoFileId;
  @override
  CommentObject get comment;
  @override
  Option<Either<CommentsFailure, dynamic>> get commentsFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_CommentsStateCopyWith<_$_CommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
