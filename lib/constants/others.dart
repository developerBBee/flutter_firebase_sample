import 'package:image_picker/image_picker.dart';

Future<XFile> returnXfile() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image.
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image!;
}