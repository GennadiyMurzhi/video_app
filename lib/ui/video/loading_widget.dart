import 'package:flutter/material.dart';

///Widget which should be used during loading/replacing process
class LoadingWidget extends StatelessWidget {
  ///pass text for display process name
  const LoadingWidget({
    super.key,
    required this.text,
  });

  ///text for display process name
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.height / 4,
            height: MediaQuery.of(context).size.height / 4,
            child: const CircularProgressIndicator(),
          ),
          const SizedBox(height: 20),
          Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
