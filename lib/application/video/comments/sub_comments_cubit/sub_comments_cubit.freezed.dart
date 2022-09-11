// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sub_comments_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubCommentsState {
  bool get isOpen => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  CommentObject get subComment => throw _privateConstructorUsedError;
  String get commentId => throw _privateConstructorUsedError;
  String get subCommentsCollectionId => throw _privateConstructorUsedError;
  Option<Either<CommentsFailure, dynamic>>
      get subCommentsFailureOrSuccessOption =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubCommentsStateCopyWith<SubCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCommentsStateCopyWith<$Res> {
  factory $SubCommentsStateCopyWith(
          SubCommentsState value, $Res Function(SubCommentsState) then) =
      _$SubCommentsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isOpen,
      bool loading,
      bool showErrorMessage,
      CommentObject subComment,
      String commentId,
      String subCommentsCollectionId,
      Option<Either<CommentsFailure, dynamic>>
          subCommentsFailureOrSuccessOption});
}

/// @nodoc
class _$SubCommentsStateCopyWithImpl<$Res>
    implements $SubCommentsStateCopyWith<$Res> {
  _$SubCommentsStateCopyWithImpl(this._value, this._then);

  final SubCommentsState _value;
  // ignore: unused_field
  final $Res Function(SubCommentsState) _then;

  @override
  $Res call({
    Object? isOpen = freezed,
    Object? loading = freezed,
    Object? showErrorMessage = freezed,
    Object? subComment = freezed,
    Object? commentId = freezed,
    Object? subCommentsCollectionId = freezed,
    Object? subCommentsFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      subComment: subComment == freezed
          ? _value.subComment
          : subComment // ignore: cast_nullable_to_non_nullable
              as CommentObject,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      subCommentsCollectionId: subCommentsCollectionId == freezed
          ? _value.subCommentsCollectionId
          : subCommentsCollectionId // ignore: cast_nullable_to_non_nullable
              as String,
      subCommentsFailureOrSuccessOption: subCommentsFailureOrSuccessOption ==
              freezed
          ? _value.subCommentsFailureOrSuccessOption
          : subCommentsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CommentsFailure, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_SubCommentsStateCopyWith<$Res>
    implements $SubCommentsStateCopyWith<$Res> {
  factory _$$_SubCommentsStateCopyWith(
          _$_SubCommentsState value, $Res Function(_$_SubCommentsState) then) =
      __$$_SubCommentsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isOpen,
      bool loading,
      bool showErrorMessage,
      CommentObject subComment,
      String commentId,
      String subCommentsCollectionId,
      Option<Either<CommentsFailure, dynamic>>
          subCommentsFailureOrSuccessOption});
}

/// @nodoc
class __$$_SubCommentsStateCopyWithImpl<$Res>
    extends _$SubCommentsStateCopyWithImpl<$Res>
    implements _$$_SubCommentsStateCopyWith<$Res> {
  __$$_SubCommentsStateCopyWithImpl(
      _$_SubCommentsState _value, $Res Function(_$_SubCommentsState) _then)
      : super(_value, (v) => _then(v as _$_SubCommentsState));

  @override
  _$_SubCommentsState get _value => super._value as _$_SubCommentsState;

  @override
  $Res call({
    Object? isOpen = freezed,
    Object? loading = freezed,
    Object? showErrorMessage = freezed,
    Object? subComment = freezed,
    Object? commentId = freezed,
    Object? subCommentsCollectionId = freezed,
    Object? subCommentsFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_SubCommentsState(
      isOpen: isOpen == freezed
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      subComment: subComment == freezed
          ? _value.subComment
          : subComment // ignore: cast_nullable_to_non_nullable
              as CommentObject,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String,
      subCommentsCollectionId: subCommentsCollectionId == freezed
          ? _value.subCommentsCollectionId
          : subCommentsCollectionId // ignore: cast_nullable_to_non_nullable
              as String,
      subCommentsFailureOrSuccessOption: subCommentsFailureOrSuccessOption ==
              freezed
          ? _value.subCommentsFailureOrSuccessOption
          : subCommentsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<CommentsFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_SubCommentsState implements _SubCommentsState {
  const _$_SubCommentsState(
      {required this.isOpen,
      required this.loading,
      required this.showErrorMessage,
      required this.subComment,
      required this.commentId,
      required this.subCommentsCollectionId,
      required this.subCommentsFailureOrSuccessOption});

  @override
  final bool isOpen;
  @override
  final bool loading;
  @override
  final bool showErrorMessage;
  @override
  final CommentObject subComment;
  @override
  final String commentId;
  @override
  final String subCommentsCollectionId;
  @override
  final Option<Either<CommentsFailure, dynamic>>
      subCommentsFailureOrSuccessOption;

  @override
  String toString() {
    return 'SubCommentsState(isOpen: $isOpen, loading: $loading, showErrorMessage: $showErrorMessage, subComment: $subComment, commentId: $commentId, subCommentsCollectionId: $subCommentsCollectionId, subCommentsFailureOrSuccessOption: $subCommentsFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubCommentsState &&
            const DeepCollectionEquality().equals(other.isOpen, isOpen) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessage, showErrorMessage) &&
            const DeepCollectionEquality()
                .equals(other.subComment, subComment) &&
            const DeepCollectionEquality().equals(other.commentId, commentId) &&
            const DeepCollectionEquality().equals(
                other.subCommentsCollectionId, subCommentsCollectionId) &&
            const DeepCollectionEquality().equals(
                other.subCommentsFailureOrSuccessOption,
                subCommentsFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isOpen),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(showErrorMessage),
      const DeepCollectionEquality().hash(subComment),
      const DeepCollectionEquality().hash(commentId),
      const DeepCollectionEquality().hash(subCommentsCollectionId),
      const DeepCollectionEquality().hash(subCommentsFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_SubCommentsStateCopyWith<_$_SubCommentsState> get copyWith =>
      __$$_SubCommentsStateCopyWithImpl<_$_SubCommentsState>(this, _$identity);
}

abstract class _SubCommentsState implements SubCommentsState {
  const factory _SubCommentsState(
      {required final bool isOpen,
      required final bool loading,
      required final bool showErrorMessage,
      required final CommentObject subComment,
      required final String commentId,
      required final String subCommentsCollectionId,
      required final Option<Either<CommentsFailure, dynamic>>
          subCommentsFailureOrSuccessOption}) = _$_SubCommentsState;

  @override
  bool get isOpen;
  @override
  bool get loading;
  @override
  bool get showErrorMessage;
  @override
  CommentObject get subComment;
  @override
  String get commentId;
  @override
  String get subCommentsCollectionId;
  @override
  Option<Either<CommentsFailure, dynamic>>
      get subCommentsFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_SubCommentsStateCopyWith<_$_SubCommentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
