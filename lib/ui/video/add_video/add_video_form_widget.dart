import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/video/add_video_cubit/add_video_cubit.dart';
import 'package:video_app/domain/core/failures.dart';

///form for add video
class AddVideoFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode:
          BlocProvider.of<AddVideoCubit>(context).state.showErrorMessage ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              onChanged: (String value) => BlocProvider.of<AddVideoCubit>(context).editVideoName(value),
              validator: (String? value) => BlocProvider.of<AddVideoCubit>(context).state.name.value.fold(
                (AddVideoValueFailure<String> l) => l.maybeMap(
                  emptyStringName: (_) {
                    return 'Enter name video';
                  },
                  longStringName: (_) {
                    return 'Max lenth 120';
                  },
                  orElse: () => null,
                ),
                (String r) {
                  return null;
                },
              ),
              decoration: const InputDecoration(hintText: 'name'),
            ),
            TextFormField(
              onChanged: (String value) => BlocProvider.of<AddVideoCubit>(context).editVideoDescription(value),
              validator: (String? value) => BlocProvider.of<AddVideoCubit>(context).state.description.value.fold(
                (AddVideoValueFailure<String> l) => l.maybeMap(
                  emptyStringDescription: (_) {
                    return 'Enter description video';
                  },
                  longStringDescription: (_) {
                    return 'Max lenth 1024';
                  },
                  orElse: () => null,
                ),
                (String r) {
                  return null;
                },
              ),
              decoration: const InputDecoration(hintText: 'description'),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    BlocProvider.of<AddVideoCubit>(context).pickVideoFile();
                  },
                  child: Text(
                    'Pick video',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                if (BlocProvider.of<AddVideoCubit>(context).state.filePickerResult.isValid())
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      BlocProvider.of<AddVideoCubit>(context).state.filePickerResult.getOrCrash()!.names[0]!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
              ],
            ),
            if (BlocProvider.of<AddVideoCubit>(context).state.showErrorMessage &&
                BlocProvider.of<AddVideoCubit>(context).state.filePickerResult.isValid() == false)
              Text(
                'Select the file',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color(0xFFFF0000),
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
