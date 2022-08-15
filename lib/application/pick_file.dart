import 'package:file_picker/file_picker.dart';

///the wrap of pickFiles method from FilePicker
Future<FilePickerResult?> pickFile() async {
  final FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: <String>['mp4'],
  );
  return filePickerResult;
}
