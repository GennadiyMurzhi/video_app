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

/// @nodoc
mixin _$AddVideoValueFailure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emptyStringName,
    required TResult Function(String failedValue) longStringName,
    required TResult Function(String failedValue) emptyStringDescription,
    required TResult Function(String failedValue) longStringDescription,
    required TResult Function(FilePickerResult? failedValue)
        emptyFilePickerResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyStringName<T> value) emptyStringName,
    required TResult Function(LongStringName<T> value) longStringName,
    required TResult Function(EmptyStringDescription<T> value)
        emptyStringDescription,
    required TResult Function(LongStringDescription<T> value)
        longStringDescription,
    required TResult Function(EmptyFilePickerResult<T> value)
        emptyFilePickerResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddVideoValueFailureCopyWith<T, $Res> {
  factory $AddVideoValueFailureCopyWith(AddVideoValueFailure<T> value,
          $Res Function(AddVideoValueFailure<T>) then) =
      _$AddVideoValueFailureCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$AddVideoValueFailureCopyWithImpl<T, $Res>
    implements $AddVideoValueFailureCopyWith<T, $Res> {
  _$AddVideoValueFailureCopyWithImpl(this._value, this._then);

  final AddVideoValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(AddVideoValueFailure<T>) _then;
}

/// @nodoc
abstract class _$$EmptyStringNameCopyWith<T, $Res> {
  factory _$$EmptyStringNameCopyWith(_$EmptyStringName<T> value,
          $Res Function(_$EmptyStringName<T>) then) =
      __$$EmptyStringNameCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class __$$EmptyStringNameCopyWithImpl<T, $Res>
    extends _$AddVideoValueFailureCopyWithImpl<T, $Res>
    implements _$$EmptyStringNameCopyWith<T, $Res> {
  __$$EmptyStringNameCopyWithImpl(
      _$EmptyStringName<T> _value, $Res Function(_$EmptyStringName<T>) _then)
      : super(_value, (v) => _then(v as _$EmptyStringName<T>));

  @override
  _$EmptyStringName<T> get _value => super._value as _$EmptyStringName<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$EmptyStringName<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmptyStringName<T> implements EmptyStringName<T> {
  const _$EmptyStringName({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AddVideoValueFailure<$T>.emptyStringName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyStringName<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$EmptyStringNameCopyWith<T, _$EmptyStringName<T>> get copyWith =>
      __$$EmptyStringNameCopyWithImpl<T, _$EmptyStringName<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emptyStringName,
    required TResult Function(String failedValue) longStringName,
    required TResult Function(String failedValue) emptyStringDescription,
    required TResult Function(String failedValue) longStringDescription,
    required TResult Function(FilePickerResult? failedValue)
        emptyFilePickerResult,
  }) {
    return emptyStringName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
  }) {
    return emptyStringName?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (emptyStringName != null) {
      return emptyStringName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyStringName<T> value) emptyStringName,
    required TResult Function(LongStringName<T> value) longStringName,
    required TResult Function(EmptyStringDescription<T> value)
        emptyStringDescription,
    required TResult Function(LongStringDescription<T> value)
        longStringDescription,
    required TResult Function(EmptyFilePickerResult<T> value)
        emptyFilePickerResult,
  }) {
    return emptyStringName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
  }) {
    return emptyStringName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (emptyStringName != null) {
      return emptyStringName(this);
    }
    return orElse();
  }
}

abstract class EmptyStringName<T> implements AddVideoValueFailure<T> {
  const factory EmptyStringName({required final String failedValue}) =
      _$EmptyStringName<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$EmptyStringNameCopyWith<T, _$EmptyStringName<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LongStringNameCopyWith<T, $Res> {
  factory _$$LongStringNameCopyWith(
          _$LongStringName<T> value, $Res Function(_$LongStringName<T>) then) =
      __$$LongStringNameCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class __$$LongStringNameCopyWithImpl<T, $Res>
    extends _$AddVideoValueFailureCopyWithImpl<T, $Res>
    implements _$$LongStringNameCopyWith<T, $Res> {
  __$$LongStringNameCopyWithImpl(
      _$LongStringName<T> _value, $Res Function(_$LongStringName<T>) _then)
      : super(_value, (v) => _then(v as _$LongStringName<T>));

  @override
  _$LongStringName<T> get _value => super._value as _$LongStringName<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$LongStringName<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LongStringName<T> implements LongStringName<T> {
  const _$LongStringName({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AddVideoValueFailure<$T>.longStringName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LongStringName<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$LongStringNameCopyWith<T, _$LongStringName<T>> get copyWith =>
      __$$LongStringNameCopyWithImpl<T, _$LongStringName<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emptyStringName,
    required TResult Function(String failedValue) longStringName,
    required TResult Function(String failedValue) emptyStringDescription,
    required TResult Function(String failedValue) longStringDescription,
    required TResult Function(FilePickerResult? failedValue)
        emptyFilePickerResult,
  }) {
    return longStringName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
  }) {
    return longStringName?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (longStringName != null) {
      return longStringName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyStringName<T> value) emptyStringName,
    required TResult Function(LongStringName<T> value) longStringName,
    required TResult Function(EmptyStringDescription<T> value)
        emptyStringDescription,
    required TResult Function(LongStringDescription<T> value)
        longStringDescription,
    required TResult Function(EmptyFilePickerResult<T> value)
        emptyFilePickerResult,
  }) {
    return longStringName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
  }) {
    return longStringName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (longStringName != null) {
      return longStringName(this);
    }
    return orElse();
  }
}

abstract class LongStringName<T> implements AddVideoValueFailure<T> {
  const factory LongStringName({required final String failedValue}) =
      _$LongStringName<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$LongStringNameCopyWith<T, _$LongStringName<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyStringDescriptionCopyWith<T, $Res> {
  factory _$$EmptyStringDescriptionCopyWith(_$EmptyStringDescription<T> value,
          $Res Function(_$EmptyStringDescription<T>) then) =
      __$$EmptyStringDescriptionCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class __$$EmptyStringDescriptionCopyWithImpl<T, $Res>
    extends _$AddVideoValueFailureCopyWithImpl<T, $Res>
    implements _$$EmptyStringDescriptionCopyWith<T, $Res> {
  __$$EmptyStringDescriptionCopyWithImpl(_$EmptyStringDescription<T> _value,
      $Res Function(_$EmptyStringDescription<T>) _then)
      : super(_value, (v) => _then(v as _$EmptyStringDescription<T>));

  @override
  _$EmptyStringDescription<T> get _value =>
      super._value as _$EmptyStringDescription<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$EmptyStringDescription<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmptyStringDescription<T> implements EmptyStringDescription<T> {
  const _$EmptyStringDescription({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AddVideoValueFailure<$T>.emptyStringDescription(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyStringDescription<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$EmptyStringDescriptionCopyWith<T, _$EmptyStringDescription<T>>
      get copyWith => __$$EmptyStringDescriptionCopyWithImpl<T,
          _$EmptyStringDescription<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emptyStringName,
    required TResult Function(String failedValue) longStringName,
    required TResult Function(String failedValue) emptyStringDescription,
    required TResult Function(String failedValue) longStringDescription,
    required TResult Function(FilePickerResult? failedValue)
        emptyFilePickerResult,
  }) {
    return emptyStringDescription(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
  }) {
    return emptyStringDescription?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (emptyStringDescription != null) {
      return emptyStringDescription(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyStringName<T> value) emptyStringName,
    required TResult Function(LongStringName<T> value) longStringName,
    required TResult Function(EmptyStringDescription<T> value)
        emptyStringDescription,
    required TResult Function(LongStringDescription<T> value)
        longStringDescription,
    required TResult Function(EmptyFilePickerResult<T> value)
        emptyFilePickerResult,
  }) {
    return emptyStringDescription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
  }) {
    return emptyStringDescription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (emptyStringDescription != null) {
      return emptyStringDescription(this);
    }
    return orElse();
  }
}

abstract class EmptyStringDescription<T> implements AddVideoValueFailure<T> {
  const factory EmptyStringDescription({required final String failedValue}) =
      _$EmptyStringDescription<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$EmptyStringDescriptionCopyWith<T, _$EmptyStringDescription<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LongStringDescriptionCopyWith<T, $Res> {
  factory _$$LongStringDescriptionCopyWith(_$LongStringDescription<T> value,
          $Res Function(_$LongStringDescription<T>) then) =
      __$$LongStringDescriptionCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class __$$LongStringDescriptionCopyWithImpl<T, $Res>
    extends _$AddVideoValueFailureCopyWithImpl<T, $Res>
    implements _$$LongStringDescriptionCopyWith<T, $Res> {
  __$$LongStringDescriptionCopyWithImpl(_$LongStringDescription<T> _value,
      $Res Function(_$LongStringDescription<T>) _then)
      : super(_value, (v) => _then(v as _$LongStringDescription<T>));

  @override
  _$LongStringDescription<T> get _value =>
      super._value as _$LongStringDescription<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$LongStringDescription<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LongStringDescription<T> implements LongStringDescription<T> {
  const _$LongStringDescription({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'AddVideoValueFailure<$T>.longStringDescription(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LongStringDescription<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$LongStringDescriptionCopyWith<T, _$LongStringDescription<T>>
      get copyWith =>
          __$$LongStringDescriptionCopyWithImpl<T, _$LongStringDescription<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emptyStringName,
    required TResult Function(String failedValue) longStringName,
    required TResult Function(String failedValue) emptyStringDescription,
    required TResult Function(String failedValue) longStringDescription,
    required TResult Function(FilePickerResult? failedValue)
        emptyFilePickerResult,
  }) {
    return longStringDescription(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
  }) {
    return longStringDescription?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (longStringDescription != null) {
      return longStringDescription(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyStringName<T> value) emptyStringName,
    required TResult Function(LongStringName<T> value) longStringName,
    required TResult Function(EmptyStringDescription<T> value)
        emptyStringDescription,
    required TResult Function(LongStringDescription<T> value)
        longStringDescription,
    required TResult Function(EmptyFilePickerResult<T> value)
        emptyFilePickerResult,
  }) {
    return longStringDescription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
  }) {
    return longStringDescription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (longStringDescription != null) {
      return longStringDescription(this);
    }
    return orElse();
  }
}

abstract class LongStringDescription<T> implements AddVideoValueFailure<T> {
  const factory LongStringDescription({required final String failedValue}) =
      _$LongStringDescription<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$LongStringDescriptionCopyWith<T, _$LongStringDescription<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyFilePickerResultCopyWith<T, $Res> {
  factory _$$EmptyFilePickerResultCopyWith(_$EmptyFilePickerResult<T> value,
          $Res Function(_$EmptyFilePickerResult<T>) then) =
      __$$EmptyFilePickerResultCopyWithImpl<T, $Res>;
  $Res call({FilePickerResult? failedValue});
}

/// @nodoc
class __$$EmptyFilePickerResultCopyWithImpl<T, $Res>
    extends _$AddVideoValueFailureCopyWithImpl<T, $Res>
    implements _$$EmptyFilePickerResultCopyWith<T, $Res> {
  __$$EmptyFilePickerResultCopyWithImpl(_$EmptyFilePickerResult<T> _value,
      $Res Function(_$EmptyFilePickerResult<T>) _then)
      : super(_value, (v) => _then(v as _$EmptyFilePickerResult<T>));

  @override
  _$EmptyFilePickerResult<T> get _value =>
      super._value as _$EmptyFilePickerResult<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$EmptyFilePickerResult<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as FilePickerResult?,
    ));
  }
}

/// @nodoc

class _$EmptyFilePickerResult<T> implements EmptyFilePickerResult<T> {
  const _$EmptyFilePickerResult({required this.failedValue});

  @override
  final FilePickerResult? failedValue;

  @override
  String toString() {
    return 'AddVideoValueFailure<$T>.emptyFilePickerResult(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyFilePickerResult<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  _$$EmptyFilePickerResultCopyWith<T, _$EmptyFilePickerResult<T>>
      get copyWith =>
          __$$EmptyFilePickerResultCopyWithImpl<T, _$EmptyFilePickerResult<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) emptyStringName,
    required TResult Function(String failedValue) longStringName,
    required TResult Function(String failedValue) emptyStringDescription,
    required TResult Function(String failedValue) longStringDescription,
    required TResult Function(FilePickerResult? failedValue)
        emptyFilePickerResult,
  }) {
    return emptyFilePickerResult(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
  }) {
    return emptyFilePickerResult?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? emptyStringName,
    TResult Function(String failedValue)? longStringName,
    TResult Function(String failedValue)? emptyStringDescription,
    TResult Function(String failedValue)? longStringDescription,
    TResult Function(FilePickerResult? failedValue)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (emptyFilePickerResult != null) {
      return emptyFilePickerResult(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyStringName<T> value) emptyStringName,
    required TResult Function(LongStringName<T> value) longStringName,
    required TResult Function(EmptyStringDescription<T> value)
        emptyStringDescription,
    required TResult Function(LongStringDescription<T> value)
        longStringDescription,
    required TResult Function(EmptyFilePickerResult<T> value)
        emptyFilePickerResult,
  }) {
    return emptyFilePickerResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
  }) {
    return emptyFilePickerResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyStringName<T> value)? emptyStringName,
    TResult Function(LongStringName<T> value)? longStringName,
    TResult Function(EmptyStringDescription<T> value)? emptyStringDescription,
    TResult Function(LongStringDescription<T> value)? longStringDescription,
    TResult Function(EmptyFilePickerResult<T> value)? emptyFilePickerResult,
    required TResult orElse(),
  }) {
    if (emptyFilePickerResult != null) {
      return emptyFilePickerResult(this);
    }
    return orElse();
  }
}

abstract class EmptyFilePickerResult<T> implements AddVideoValueFailure<T> {
  const factory EmptyFilePickerResult(
          {required final FilePickerResult? failedValue}) =
      _$EmptyFilePickerResult<T>;

  FilePickerResult? get failedValue;
  @JsonKey(ignore: true)
  _$$EmptyFilePickerResultCopyWith<T, _$EmptyFilePickerResult<T>>
      get copyWith => throw _privateConstructorUsedError;
}
