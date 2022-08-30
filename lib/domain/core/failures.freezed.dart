// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthValueFailure<T> {
  String get failedValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) wrongName,
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? wrongName,
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? wrongName,
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? shortPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WrongName<T> value) wrongName,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WrongName<T> value)? wrongName,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WrongName<T> value)? wrongName,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthValueFailureCopyWith<T, AuthValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthValueFailureCopyWith<T, $Res> {
  factory $AuthValueFailureCopyWith(
          AuthValueFailure<T> value, $Res Function(AuthValueFailure<T>) then) =
      _$AuthValueFailureCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$AuthValueFailureCopyWithImpl<T, $Res>
    implements $AuthValueFailureCopyWith<T, $Res> {
  _$AuthValueFailureCopyWithImpl(this._value, this._then);

  final AuthValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(AuthValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$WrongNameCopyWith<T, $Res>
    implements $AuthValueFailureCopyWith<T, $Res> {
  factory _$$WrongNameCopyWith(
          _$WrongName<T> value, $Res Function(_$WrongName<T>) then) =
      __$$WrongNameCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class __$$WrongNameCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res>
    implements _$$WrongNameCopyWith<T, $Res> {
  __$$WrongNameCopyWithImpl(
      _$WrongName<T> _value, $Res Function(_$WrongName<T>) _then)
      : super(_value, (v) => _then(v as _$WrongName<T>));

  @override
  _$WrongName<T> get _value => super._value as _$WrongName<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$WrongName<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WrongName<T> implements WrongName<T> {
  const _$WrongName({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.wrongName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WrongName<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$WrongNameCopyWith<T, _$WrongName<T>> get copyWith =>
      __$$WrongNameCopyWithImpl<T, _$WrongName<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) wrongName,
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) shortPassword,
  }) {
    return wrongName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? wrongName,
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? shortPassword,
  }) {
    return wrongName?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? wrongName,
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? shortPassword,
    required TResult orElse(),
  }) {
    if (wrongName != null) {
      return wrongName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WrongName<T> value) wrongName,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
  }) {
    return wrongName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WrongName<T> value)? wrongName,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
  }) {
    return wrongName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WrongName<T> value)? wrongName,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    required TResult orElse(),
  }) {
    if (wrongName != null) {
      return wrongName(this);
    }
    return orElse();
  }
}

abstract class WrongName<T> implements AuthValueFailure<T> {
  const factory WrongName({required final String failedValue}) = _$WrongName<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$WrongNameCopyWith<T, _$WrongName<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidEmailCopyWith<T, $Res>
    implements $AuthValueFailureCopyWith<T, $Res> {
  factory _$$InvalidEmailCopyWith(
          _$InvalidEmail<T> value, $Res Function(_$InvalidEmail<T>) then) =
      __$$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class __$$InvalidEmailCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res>
    implements _$$InvalidEmailCopyWith<T, $Res> {
  __$$InvalidEmailCopyWithImpl(
      _$InvalidEmail<T> _value, $Res Function(_$InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as _$InvalidEmail<T>));

  @override
  _$InvalidEmail<T> get _value => super._value as _$InvalidEmail<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$InvalidEmail<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmail<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      __$$InvalidEmailCopyWithImpl<T, _$InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) wrongName,
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) shortPassword,
  }) {
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? wrongName,
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? shortPassword,
  }) {
    return invalidEmail?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? wrongName,
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? shortPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WrongName<T> value) wrongName,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WrongName<T> value)? wrongName,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WrongName<T> value)? wrongName,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements AuthValueFailure<T> {
  const factory InvalidEmail({required final String failedValue}) =
      _$InvalidEmail<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShortPasswordCopyWith<T, $Res>
    implements $AuthValueFailureCopyWith<T, $Res> {
  factory _$$ShortPasswordCopyWith(
          _$ShortPassword<T> value, $Res Function(_$ShortPassword<T>) then) =
      __$$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class __$$ShortPasswordCopyWithImpl<T, $Res>
    extends _$AuthValueFailureCopyWithImpl<T, $Res>
    implements _$$ShortPasswordCopyWith<T, $Res> {
  __$$ShortPasswordCopyWithImpl(
      _$ShortPassword<T> _value, $Res Function(_$ShortPassword<T>) _then)
      : super(_value, (v) => _then(v as _$ShortPassword<T>));

  @override
  _$ShortPassword<T> get _value => super._value as _$ShortPassword<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$ShortPassword<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AuthValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortPassword<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      __$$ShortPasswordCopyWithImpl<T, _$ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) wrongName,
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function(String failedValue) shortPassword,
  }) {
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? wrongName,
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? shortPassword,
  }) {
    return shortPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? wrongName,
    TResult Function(String failedValue)? invalidEmail,
    TResult Function(String failedValue)? shortPassword,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WrongName<T> value) wrongName,
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WrongName<T> value)? wrongName,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WrongName<T> value)? wrongName,
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements AuthValueFailure<T> {
  const factory ShortPassword({required final String failedValue}) =
      _$ShortPassword<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommentValueFailure<T> {
  String get failedValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emptyStringComment,
    required TResult Function(String failedValue) longStringComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringComment,
    TResult Function(String failedValue)? longStringComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringComment,
    TResult Function(String failedValue)? longStringComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyStringComment<T> value) emptyStringComment,
    required TResult Function(LongStringComment<T> value) longStringComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyStringComment<T> value)? emptyStringComment,
    TResult Function(LongStringComment<T> value)? longStringComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyStringComment<T> value)? emptyStringComment,
    TResult Function(LongStringComment<T> value)? longStringComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentValueFailureCopyWith<T, CommentValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentValueFailureCopyWith<T, $Res> {
  factory $CommentValueFailureCopyWith(CommentValueFailure<T> value,
          $Res Function(CommentValueFailure<T>) then) =
      _$CommentValueFailureCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$CommentValueFailureCopyWithImpl<T, $Res>
    implements $CommentValueFailureCopyWith<T, $Res> {
  _$CommentValueFailureCopyWithImpl(this._value, this._then);

  final CommentValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(CommentValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$EmptyStringCommentCopyWith<T, $Res>
    implements $CommentValueFailureCopyWith<T, $Res> {
  factory _$$EmptyStringCommentCopyWith(_$EmptyStringComment<T> value,
          $Res Function(_$EmptyStringComment<T>) then) =
      __$$EmptyStringCommentCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class __$$EmptyStringCommentCopyWithImpl<T, $Res>
    extends _$CommentValueFailureCopyWithImpl<T, $Res>
    implements _$$EmptyStringCommentCopyWith<T, $Res> {
  __$$EmptyStringCommentCopyWithImpl(_$EmptyStringComment<T> _value,
      $Res Function(_$EmptyStringComment<T>) _then)
      : super(_value, (v) => _then(v as _$EmptyStringComment<T>));

  @override
  _$EmptyStringComment<T> get _value => super._value as _$EmptyStringComment<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$EmptyStringComment<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmptyStringComment<T> implements EmptyStringComment<T> {
  const _$EmptyStringComment({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'CommentValueFailure<$T>.emptyStringComment(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyStringComment<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$EmptyStringCommentCopyWith<T, _$EmptyStringComment<T>> get copyWith =>
      __$$EmptyStringCommentCopyWithImpl<T, _$EmptyStringComment<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emptyStringComment,
    required TResult Function(String failedValue) longStringComment,
  }) {
    return emptyStringComment(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringComment,
    TResult Function(String failedValue)? longStringComment,
  }) {
    return emptyStringComment?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringComment,
    TResult Function(String failedValue)? longStringComment,
    required TResult orElse(),
  }) {
    if (emptyStringComment != null) {
      return emptyStringComment(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyStringComment<T> value) emptyStringComment,
    required TResult Function(LongStringComment<T> value) longStringComment,
  }) {
    return emptyStringComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyStringComment<T> value)? emptyStringComment,
    TResult Function(LongStringComment<T> value)? longStringComment,
  }) {
    return emptyStringComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyStringComment<T> value)? emptyStringComment,
    TResult Function(LongStringComment<T> value)? longStringComment,
    required TResult orElse(),
  }) {
    if (emptyStringComment != null) {
      return emptyStringComment(this);
    }
    return orElse();
  }
}

abstract class EmptyStringComment<T> implements CommentValueFailure<T> {
  const factory EmptyStringComment({required final String failedValue}) =
      _$EmptyStringComment<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$EmptyStringCommentCopyWith<T, _$EmptyStringComment<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LongStringCommentCopyWith<T, $Res>
    implements $CommentValueFailureCopyWith<T, $Res> {
  factory _$$LongStringCommentCopyWith(_$LongStringComment<T> value,
          $Res Function(_$LongStringComment<T>) then) =
      __$$LongStringCommentCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

/// @nodoc
class __$$LongStringCommentCopyWithImpl<T, $Res>
    extends _$CommentValueFailureCopyWithImpl<T, $Res>
    implements _$$LongStringCommentCopyWith<T, $Res> {
  __$$LongStringCommentCopyWithImpl(_$LongStringComment<T> _value,
      $Res Function(_$LongStringComment<T>) _then)
      : super(_value, (v) => _then(v as _$LongStringComment<T>));

  @override
  _$LongStringComment<T> get _value => super._value as _$LongStringComment<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$LongStringComment<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LongStringComment<T> implements LongStringComment<T> {
  const _$LongStringComment({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'CommentValueFailure<$T>.longStringComment(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LongStringComment<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$LongStringCommentCopyWith<T, _$LongStringComment<T>> get copyWith =>
      __$$LongStringCommentCopyWithImpl<T, _$LongStringComment<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emptyStringComment,
    required TResult Function(String failedValue) longStringComment,
  }) {
    return longStringComment(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringComment,
    TResult Function(String failedValue)? longStringComment,
  }) {
    return longStringComment?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringComment,
    TResult Function(String failedValue)? longStringComment,
    required TResult orElse(),
  }) {
    if (longStringComment != null) {
      return longStringComment(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyStringComment<T> value) emptyStringComment,
    required TResult Function(LongStringComment<T> value) longStringComment,
  }) {
    return longStringComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyStringComment<T> value)? emptyStringComment,
    TResult Function(LongStringComment<T> value)? longStringComment,
  }) {
    return longStringComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyStringComment<T> value)? emptyStringComment,
    TResult Function(LongStringComment<T> value)? longStringComment,
    required TResult orElse(),
  }) {
    if (longStringComment != null) {
      return longStringComment(this);
    }
    return orElse();
  }
}

abstract class LongStringComment<T> implements CommentValueFailure<T> {
  const factory LongStringComment({required final String failedValue}) =
      _$LongStringComment<T>;

  @override
  String get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$LongStringCommentCopyWith<T, _$LongStringComment<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
