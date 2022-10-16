// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Subscriptions {
  int get total => throw _privateConstructorUsedError;
  List<Subscription> get subscriptions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionsCopyWith<Subscriptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionsCopyWith<$Res> {
  factory $SubscriptionsCopyWith(
          Subscriptions value, $Res Function(Subscriptions) then) =
      _$SubscriptionsCopyWithImpl<$Res>;
  $Res call({int total, List<Subscription> subscriptions});
}

/// @nodoc
class _$SubscriptionsCopyWithImpl<$Res>
    implements $SubscriptionsCopyWith<$Res> {
  _$SubscriptionsCopyWithImpl(this._value, this._then);

  final Subscriptions _value;
  // ignore: unused_field
  final $Res Function(Subscriptions) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? subscriptions = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptions: subscriptions == freezed
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<Subscription>,
    ));
  }
}

/// @nodoc
abstract class _$$_SubscriptionsCopyWith<$Res>
    implements $SubscriptionsCopyWith<$Res> {
  factory _$$_SubscriptionsCopyWith(
          _$_Subscriptions value, $Res Function(_$_Subscriptions) then) =
      __$$_SubscriptionsCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<Subscription> subscriptions});
}

/// @nodoc
class __$$_SubscriptionsCopyWithImpl<$Res>
    extends _$SubscriptionsCopyWithImpl<$Res>
    implements _$$_SubscriptionsCopyWith<$Res> {
  __$$_SubscriptionsCopyWithImpl(
      _$_Subscriptions _value, $Res Function(_$_Subscriptions) _then)
      : super(_value, (v) => _then(v as _$_Subscriptions));

  @override
  _$_Subscriptions get _value => super._value as _$_Subscriptions;

  @override
  $Res call({
    Object? total = freezed,
    Object? subscriptions = freezed,
  }) {
    return _then(_$_Subscriptions(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptions: subscriptions == freezed
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<Subscription>,
    ));
  }
}

/// @nodoc

class _$_Subscriptions implements _Subscriptions {
  const _$_Subscriptions(
      {required this.total, required final List<Subscription> subscriptions})
      : _subscriptions = subscriptions;

  @override
  final int total;
  final List<Subscription> _subscriptions;
  @override
  List<Subscription> get subscriptions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  @override
  String toString() {
    return 'Subscriptions(total: $total, subscriptions: $subscriptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subscriptions &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(_subscriptions));

  @JsonKey(ignore: true)
  @override
  _$$_SubscriptionsCopyWith<_$_Subscriptions> get copyWith =>
      __$$_SubscriptionsCopyWithImpl<_$_Subscriptions>(this, _$identity);
}

abstract class _Subscriptions implements Subscriptions {
  const factory _Subscriptions(
      {required final int total,
      required final List<Subscription> subscriptions}) = _$_Subscriptions;

  @override
  int get total;
  @override
  List<Subscription> get subscriptions;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionsCopyWith<_$_Subscriptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Subscription {
  String get subscriptionUserId => throw _privateConstructorUsedError;
  String get subscriptionUserName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
          Subscription value, $Res Function(Subscription) then) =
      _$SubscriptionCopyWithImpl<$Res>;
  $Res call({String subscriptionUserId, String subscriptionUserName});
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res> implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  final Subscription _value;
  // ignore: unused_field
  final $Res Function(Subscription) _then;

  @override
  $Res call({
    Object? subscriptionUserId = freezed,
    Object? subscriptionUserName = freezed,
  }) {
    return _then(_value.copyWith(
      subscriptionUserId: subscriptionUserId == freezed
          ? _value.subscriptionUserId
          : subscriptionUserId // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionUserName: subscriptionUserName == freezed
          ? _value.subscriptionUserName
          : subscriptionUserName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SubscriptionCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$_SubscriptionCopyWith(
          _$_Subscription value, $Res Function(_$_Subscription) then) =
      __$$_SubscriptionCopyWithImpl<$Res>;
  @override
  $Res call({String subscriptionUserId, String subscriptionUserName});
}

/// @nodoc
class __$$_SubscriptionCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res>
    implements _$$_SubscriptionCopyWith<$Res> {
  __$$_SubscriptionCopyWithImpl(
      _$_Subscription _value, $Res Function(_$_Subscription) _then)
      : super(_value, (v) => _then(v as _$_Subscription));

  @override
  _$_Subscription get _value => super._value as _$_Subscription;

  @override
  $Res call({
    Object? subscriptionUserId = freezed,
    Object? subscriptionUserName = freezed,
  }) {
    return _then(_$_Subscription(
      subscriptionUserId: subscriptionUserId == freezed
          ? _value.subscriptionUserId
          : subscriptionUserId // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionUserName: subscriptionUserName == freezed
          ? _value.subscriptionUserName
          : subscriptionUserName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Subscription implements _Subscription {
  const _$_Subscription(
      {required this.subscriptionUserId, required this.subscriptionUserName});

  @override
  final String subscriptionUserId;
  @override
  final String subscriptionUserName;

  @override
  String toString() {
    return 'Subscription(subscriptionUserId: $subscriptionUserId, subscriptionUserName: $subscriptionUserName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subscription &&
            const DeepCollectionEquality()
                .equals(other.subscriptionUserId, subscriptionUserId) &&
            const DeepCollectionEquality()
                .equals(other.subscriptionUserName, subscriptionUserName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(subscriptionUserId),
      const DeepCollectionEquality().hash(subscriptionUserName));

  @JsonKey(ignore: true)
  @override
  _$$_SubscriptionCopyWith<_$_Subscription> get copyWith =>
      __$$_SubscriptionCopyWithImpl<_$_Subscription>(this, _$identity);
}

abstract class _Subscription implements Subscription {
  const factory _Subscription(
      {required final String subscriptionUserId,
      required final String subscriptionUserName}) = _$_Subscription;

  @override
  String get subscriptionUserId;
  @override
  String get subscriptionUserName;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionCopyWith<_$_Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}
