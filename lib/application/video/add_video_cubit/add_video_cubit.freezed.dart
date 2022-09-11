// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_video_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddVideoState {
  VideoName get name => throw _privateConstructorUsedError;
  VideoDescription get description => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  VideoFilePickerResult get filePickerResult =>
      throw _privateConstructorUsedError;
  Option<Either<Failure, Unit>> get addVideoFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddVideoStateCopyWith<AddVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddVideoStateCopyWith<$Res> {
  factory $AddVideoStateCopyWith(
          AddVideoState value, $Res Function(AddVideoState) then) =
      _$AddVideoStateCopyWithImpl<$Res>;
  $Res call(
      {VideoName name,
      VideoDescription description,
      bool loading,
      bool showErrorMessage,
      VideoFilePickerResult filePickerResult,
      Option<Either<Failure, Unit>> addVideoFailureOrSuccessOption});
}

/// @nodoc
class _$AddVideoStateCopyWithImpl<$Res>
    implements $AddVideoStateCopyWith<$Res> {
  _$AddVideoStateCopyWithImpl(this._value, this._then);

  final AddVideoState _value;
  // ignore: unused_field
  final $Res Function(AddVideoState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? loading = freezed,
    Object? showErrorMessage = freezed,
    Object? filePickerResult = freezed,
    Object? addVideoFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as VideoName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as VideoDescription,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      filePickerResult: filePickerResult == freezed
          ? _value.filePickerResult
          : filePickerResult // ignore: cast_nullable_to_non_nullable
              as VideoFilePickerResult,
      addVideoFailureOrSuccessOption: addVideoFailureOrSuccessOption == freezed
          ? _value.addVideoFailureOrSuccessOption
          : addVideoFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$$_AddVideoStateCopyWith<$Res>
    implements $AddVideoStateCopyWith<$Res> {
  factory _$$_AddVideoStateCopyWith(
          _$_AddVideoState value, $Res Function(_$_AddVideoState) then) =
      __$$_AddVideoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {VideoName name,
      VideoDescription description,
      bool loading,
      bool showErrorMessage,
      VideoFilePickerResult filePickerResult,
      Option<Either<Failure, Unit>> addVideoFailureOrSuccessOption});
}

/// @nodoc
class __$$_AddVideoStateCopyWithImpl<$Res>
    extends _$AddVideoStateCopyWithImpl<$Res>
    implements _$$_AddVideoStateCopyWith<$Res> {
  __$$_AddVideoStateCopyWithImpl(
      _$_AddVideoState _value, $Res Function(_$_AddVideoState) _then)
      : super(_value, (v) => _then(v as _$_AddVideoState));

  @override
  _$_AddVideoState get _value => super._value as _$_AddVideoState;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? loading = freezed,
    Object? showErrorMessage = freezed,
    Object? filePickerResult = freezed,
    Object? addVideoFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_AddVideoState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as VideoName,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as VideoDescription,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      filePickerResult: filePickerResult == freezed
          ? _value.filePickerResult
          : filePickerResult // ignore: cast_nullable_to_non_nullable
              as VideoFilePickerResult,
      addVideoFailureOrSuccessOption: addVideoFailureOrSuccessOption == freezed
          ? _value.addVideoFailureOrSuccessOption
          : addVideoFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AddVideoState implements _AddVideoState {
  const _$_AddVideoState(
      {required this.name,
      required this.description,
      required this.loading,
      required this.showErrorMessage,
      required this.filePickerResult,
      required this.addVideoFailureOrSuccessOption});

  @override
  final VideoName name;
  @override
  final VideoDescription description;
  @override
  final bool loading;
  @override
  final bool showErrorMessage;
  @override
  final VideoFilePickerResult filePickerResult;
  @override
  final Option<Either<Failure, Unit>> addVideoFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddVideoState(name: $name, description: $description, loading: $loading, showErrorMessage: $showErrorMessage, filePickerResult: $filePickerResult, addVideoFailureOrSuccessOption: $addVideoFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddVideoState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessage, showErrorMessage) &&
            const DeepCollectionEquality()
                .equals(other.filePickerResult, filePickerResult) &&
            const DeepCollectionEquality().equals(
                other.addVideoFailureOrSuccessOption,
                addVideoFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(showErrorMessage),
      const DeepCollectionEquality().hash(filePickerResult),
      const DeepCollectionEquality().hash(addVideoFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_AddVideoStateCopyWith<_$_AddVideoState> get copyWith =>
      __$$_AddVideoStateCopyWithImpl<_$_AddVideoState>(this, _$identity);
}

abstract class _AddVideoState implements AddVideoState {
  const factory _AddVideoState(
      {required final VideoName name,
      required final VideoDescription description,
      required final bool loading,
      required final bool showErrorMessage,
      required final VideoFilePickerResult filePickerResult,
      required final Option<Either<Failure, Unit>>
          addVideoFailureOrSuccessOption}) = _$_AddVideoState;

  @override
  VideoName get name;
  @override
  VideoDescription get description;
  @override
  bool get loading;
  @override
  bool get showErrorMessage;
  @override
  VideoFilePickerResult get filePickerResult;
  @override
  Option<Either<Failure, Unit>> get addVideoFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddVideoStateCopyWith<_$_AddVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}
