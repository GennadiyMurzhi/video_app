
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_app/application/user_cubit/user_cubit.dart';

///Widget for start function to tap photo
class UserPhotoChoseWidget extends StatelessWidget {
  ///pass the user state to get access to additional variables
  const UserPhotoChoseWidget({
    super.key,
    required this.state,
    required this.sizePhoto,
  });

  ///user state need to easy get user photo
  final UserState state;

  ///radius photo
  final double sizePhoto;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      if (state.photoBits == null) {
        return Icon(
          Icons.person,
          size: sizePhoto,
        );
      } else {
        return ClipOval(
          child: Image.memory(
            state.photoBits!,
            width: sizePhoto,
            height: sizePhoto,
            fit: BoxFit.fill,
          ),
        );
      }
    } else {
      if (state.filePickerResult.isValid()) {
        return ClipOval(
          child: Image.file(
            state.chosenPhotoFile!,
            width: sizePhoto,
            height: sizePhoto,
            fit: BoxFit.fill,
          ),
        );
      } else if (state.photoFile == null) {
        return Icon(
          Icons.person,
          size: sizePhoto,
        );
      } else {
        return ClipOval(
          child: Image.file(
            state.photoFile!,
            width: sizePhoto,
            height: sizePhoto,
            fit: BoxFit.fill,
          ),
        );
      }
    }
  }
}
