// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthFormState {
  ///Value object for storing name input
  Name get name => throw _privateConstructorUsedError;

  ///Value object for storing email address input
  EmailAddress get emailAddress => throw _privateConstructorUsedError;

  ///Value object for storing password input
  Password get password => throw _privateConstructorUsedError;

  ///variable to indicate loading
  bool get isLoading => throw _privateConstructorUsedError;

  ///variable indicating that the form is needed for registration/authorization
  bool get isSignUp => throw _privateConstructorUsedError;

  ///variable displaying validate errors in texfields
  bool get showErrorMessage => throw _privateConstructorUsedError;

  ///option necessary to indicate the further action as a result of the registration/authorization
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthFormStateCopyWith<AuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFormStateCopyWith<$Res> {
  factory $AuthFormStateCopyWith(
          AuthFormState value, $Res Function(AuthFormState) then) =
      _$AuthFormStateCopyWithImpl<$Res>;
  $Res call(
      {Name name,
      EmailAddress emailAddress,
      Password password,
      bool isLoading,
      bool isSignUp,
      bool showErrorMessage,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$AuthFormStateCopyWithImpl<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  _$AuthFormStateCopyWithImpl(this._value, this._then);

  final AuthFormState _value;
  // ignore: unused_field
  final $Res Function(AuthFormState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? isLoading = freezed,
    Object? isSignUp = freezed,
    Object? showErrorMessage = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignUp: isSignUp == freezed
          ? _value.isSignUp
          : isSignUp // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthFormStateCopyWith<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  factory _$$_AuthFormStateCopyWith(
          _$_AuthFormState value, $Res Function(_$_AuthFormState) then) =
      __$$_AuthFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Name name,
      EmailAddress emailAddress,
      Password password,
      bool isLoading,
      bool isSignUp,
      bool showErrorMessage,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$_AuthFormStateCopyWithImpl<$Res>
    extends _$AuthFormStateCopyWithImpl<$Res>
    implements _$$_AuthFormStateCopyWith<$Res> {
  __$$_AuthFormStateCopyWithImpl(
      _$_AuthFormState _value, $Res Function(_$_AuthFormState) _then)
      : super(_value, (v) => _then(v as _$_AuthFormState));

  @override
  _$_AuthFormState get _value => super._value as _$_AuthFormState;

  @override
  $Res call({
    Object? name = freezed,
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? isLoading = freezed,
    Object? isSignUp = freezed,
    Object? showErrorMessage = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_AuthFormState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignUp: isSignUp == freezed
          ? _value.isSignUp
          : isSignUp // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AuthFormState implements _AuthFormState {
  const _$_AuthFormState(
      {required this.name,
      required this.emailAddress,
      required this.password,
      required this.isLoading,
      required this.isSignUp,
      required this.showErrorMessage,
      required this.authFailureOrSuccessOption});

  ///Value object for storing name input
  @override
  final Name name;

  ///Value object for storing email address input
  @override
  final EmailAddress emailAddress;

  ///Value object for storing password input
  @override
  final Password password;

  ///variable to indicate loading
  @override
  final bool isLoading;

  ///variable indicating that the form is needed for registration/authorization
  @override
  final bool isSignUp;

  ///variable displaying validate errors in texfields
  @override
  final bool showErrorMessage;

  ///option necessary to indicate the further action as a result of the registration/authorization
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'AuthFormState(name: $name, emailAddress: $emailAddress, password: $password, isLoading: $isLoading, isSignUp: $isSignUp, showErrorMessage: $showErrorMessage, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthFormState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isSignUp, isSignUp) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessage, showErrorMessage) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSignUp),
      const DeepCollectionEquality().hash(showErrorMessage),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_AuthFormStateCopyWith<_$_AuthFormState> get copyWith =>
      __$$_AuthFormStateCopyWithImpl<_$_AuthFormState>(this, _$identity);
}

abstract class _AuthFormState implements AuthFormState {
  const factory _AuthFormState(
      {required final Name name,
      required final EmailAddress emailAddress,
      required final Password password,
      required final bool isLoading,
      required final bool isSignUp,
      required final bool showErrorMessage,
      required final Option<Either<AuthFailure, Unit>>
          authFailureOrSuccessOption}) = _$_AuthFormState;

  @override

  ///Value object for storing name input
  Name get name;
  @override

  ///Value object for storing email address input
  EmailAddress get emailAddress;
  @override

  ///Value object for storing password input
  Password get password;
  @override

  ///variable to indicate loading
  bool get isLoading;
  @override

  ///variable indicating that the form is needed for registration/authorization
  bool get isSignUp;
  @override

  ///variable displaying validate errors in texfields
  bool get showErrorMessage;
  @override

  ///option necessary to indicate the further action as a result of the registration/authorization
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AuthFormStateCopyWith<_$_AuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
