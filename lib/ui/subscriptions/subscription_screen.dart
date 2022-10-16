import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/subscriptions_cubit/subscriptions_cubit.dart';
import 'package:video_app/domain/core/failures.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/core/snackbar_custom.dart';
import 'package:video_app/ui/subscriptions/subscription_body_widget.dart';

class SubscriptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubscriptionsCubit>(
      create: (BuildContext context) => getIt<SubscriptionsCubit>()..init(),
      child: BlocConsumer<SubscriptionsCubit, SubscriptionsState>(
        builder: (BuildContext context, SubscriptionsState state) {
          return Layout(
            title: 'Subscriptions',
            functionOnPop: () => Navigator.of(context).pop(),
            child: SubscriptionsBodyWidget(),
          );
        },
        listener: (BuildContext context, SubscriptionsState state) {
          state.subscriptionFailureOrSuccessOption.fold(
            () => null,
            (Either<Failure, Unit> either) {
              either.fold(
                (Failure failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBarCustom(
                      text: failure.maybeWhen(
                        serverError: () => 'Server error',
                        orElse: () => '',
                      ),
                    ),
                  );
                },
                (Unit r) => null,
              );
            },
          );
        },
      ),
    );
  }
}
