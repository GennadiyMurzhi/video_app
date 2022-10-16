import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/likes_cubit/likes_cubit.dart';
import 'package:video_app/application/subscriptions_cubit/subscriptions_cubit.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/application/video_data_list_receiver.dart';
import 'package:video_app/domain/likes/like.dart';
import 'package:video_app/domain/subscriptions/subscription.dart';
import 'package:video_app/injectable.dart';
import 'package:video_app/ui/likes/like_item_widget.dart';
import 'package:video_app/ui/subscriptions/subscription_item_widget.dart';

///body widget for likes list screen
class SubscriptionsBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String appUserName = getIt<UserCubit>().state.name;

    return BlocProvider.of<SubscriptionsCubit>(context).state.loading
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (kIsWeb)
                  const SizedBox(
                    width: 300,
                    height: 300,
                    child: CircularProgressIndicator(),
                  )
                else
                  const SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(),
                  ),
                const SizedBox(height: 20),
                Text(
                  'Loading...',
                  style: Theme.of(context).textTheme.headline2,
                )
              ],
            ),
          )
        : StreamBuilder<Subscriptions>(
            stream: getIt<DataListReceiver<Subscriptions>>().dataListStream,
            builder: (BuildContext context, AsyncSnapshot<Subscriptions> snapshot) {
              if (snapshot.data != null) {
                return ListView(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        'Subscriptions',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xFF3F3FA2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      appUserName,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: const Color(0xFF3F3FA2),
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${snapshot.data!.total} subscriptions',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    ...List<Widget>.generate(
                      snapshot.data!.subscriptions.length,
                      (int index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(top: 30, bottom: 15)
                            : const EdgeInsets.symmetric(vertical: 15),
                        child: SubscriptionsItemWidget(
                          userName: snapshot.data!.subscriptions[index].subscriptionUserName,
                          userId: snapshot.data!.subscriptions[index].subscriptionUserId,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          );
  }
}
