import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';
import 'package:video_app/ui/core/layout.dart';
import 'package:video_app/ui/user/user_photo_chose_widget.dart';

///screen to edit user info
class EditUserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (BuildContext buildContext, UserState state) => Layout(
        functionOnPop: () => Navigator.of(context).pop(),
        title: 'Edit user data',
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              InkWell(
                onTap: () => BlocProvider.of<UserCubit>(context).pickPhotoFile(),
                child: UserPhotoChoseWidget(
                  state: state,
                  sizePhoto: 150,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    state.filePickerResult.isValid() ? const Color(0xFF7C3F8A) : const Color(0xFF867F7F),
                  ),
                ),
                onPressed: state.filePickerResult.isValid() ? () => BlocProvider.of<UserCubit>(context).uploadUserPhoto() : null,
                child: const Text('Upload new photo'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
