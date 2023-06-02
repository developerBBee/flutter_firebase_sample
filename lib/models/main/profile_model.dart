// flutter
import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/others.dart';

// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final profileProvider = ChangeNotifierProvider((_) => ProfileModel());

class ProfileModel extends ChangeNotifier {
  XFile? xFile;

  Future<void> pickImage() async {
    xFile = await returnXfile();
  }
}