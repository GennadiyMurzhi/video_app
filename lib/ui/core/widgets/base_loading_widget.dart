import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///widget to display that the download is now in progress
class BaseLoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }

}
