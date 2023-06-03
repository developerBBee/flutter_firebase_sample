// dart
import 'dart:io';

// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/others.dart';
import 'package:flutter_application_test/constants/strings.dart';

// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final profileProvider = ChangeNotifierProvider((_) => ProfileModel());

class ProfileModel extends ChangeNotifier {
  File? croppedFile;

  /// 非同期で画像をアップロードして、画像のURLを返す
  Future<String> uploadImageAndGetURL({
    required String uid,
    required File file,
  }) async {
    final String fileName = jpgUuidFileName;
    final Reference storageRef = FirebaseStorage.instance.ref()
        .child("users").child(uid).child(fileName);
    // users/uid/fileName にfileをアップロード
    await storageRef.putFile(file);
    // users/uid/fileName のURLを取得
    return await storageRef.getDownloadURL();
  }

  Future<void> uploadUserImage({
    required DocumentSnapshot<Map<String, dynamic>> currentUserDoc,
  }) async {
    final XFile xFile = await returnXfile();
    final File file = File(xFile.path);
    final String uid = currentUserDoc.id;
    croppedFile = await returnCroppedFile(xfile: xFile);
    final String url = await uploadImageAndGetURL(uid: uid, file: file);
    await currentUserDoc.reference.update({
      "userImageURL": url,
    });
    notifyListeners();
  }
}