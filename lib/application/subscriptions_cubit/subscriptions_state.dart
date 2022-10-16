part of 'subscriptions_cubit.dart';

@freezed
abstract class SubscriptionsState with _$SubscriptionsState {
  const factory SubscriptionsState({
    required bool loading,
    required Option<Either<Failure, Unit>> subscriptionFailureOrSuccessOption,
  }) = _SubscriptionsState;

  factory SubscriptionsState.init() => SubscriptionsState(
    loading: true,
    subscriptionFailureOrSuccessOption: none(),
  );
}

