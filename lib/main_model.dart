// flutter
import 'dart:math';

import 'package:flutter/material.dart';

// packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

// domain
import 'package:flutter_application_test/domain/firestore_user/firestore_user.dart';

// ViewとModelの橋渡しとなるProvider
final mainProvider = ChangeNotifierProvider((_) => MainModel());

class MainModel extends ChangeNotifier {
  int counter = 0; // 変数の先頭に_はprivateなので、つけないようにする
  User? currentUser = null;
  // auth
  String email = '';
  String password = '';

  Future<void> createFirestoreUser(
      {required BuildContext context, required String uid}) async {
    // final uuid = Uuid();
    // final String v4 = uuid.v4();
    // Firestoreに保存
    // final Map<String, dynamic> userData = {
    //   "userName": "Alice",
    //   "uid": v4,
    // };
    counter++;
    final Timestamp now = Timestamp.now();
    final FirestoreUser user = FirestoreUser(
      createdAt: now,
      email: email,
      updatedAt: now,
      userName: 'Alice',
      uid: uid,
    );
    final Map<String, dynamic> userData = user.toJson();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid) // ここでドキュメントIDを指定(指定しない場合は自動でIDが振られる)
        .set(userData);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('ユーザーが作成できました')));

    // setState()はStatefulWidgetでのみ使えるのでここでは使えない
    // 代わりにnotifyListeners()を使う
    notifyListeners(); // これを呼ぶと、変更を検知して再描画してくれる
  }

  Future<void> createUser({required BuildContext context}) async {
    // FirebaseAuth
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      final String uid = user!.uid;
      createFirestoreUser(context: context, uid: uid);
    } on FirebaseAuthException catch (e) {
      // error message
      print(e.toString());
    }
  }
}
