import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile> returnXfile() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image.
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image!;
}

Future<File?> returnCroppedFile({ required XFile? xfile }) async {
  final cropper = ImageCropper();
  final File? result = await cropper.cropImage(
    sourcePath: xfile!.path,
    aspectRatioPresets: Platform.isAndroid
     ? [CropAspectRatioPreset.square]
     : [CropAspectRatioPreset.original],
    androidUiSettings: const AndroidUiSettings(
      toolbarTitle: cropperTitle,
      toolbarColor: Colors.green,
      initAspectRatio: CropAspectRatioPreset.square,
      lockAspectRatio: true
    ),
    iosUiSettings: const IOSUiSettings(
      title: cropperTitle,
    )
  );
  return result;
}