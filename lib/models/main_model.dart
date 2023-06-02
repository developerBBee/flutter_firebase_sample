// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_application_test/domain/firestore_user/firestore_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// route
import 'package:flutter_application_test/constants/routes.dart' as routes;

// ViewとModelの橋渡しとなるProvider
final mainProvider = ChangeNotifierProvider((_) => MainModel());

class MainModel extends ChangeNotifier {
  bool isLoading = false;
  int counter = 0; // 変数の先頭に_はprivateなので、つけないようにする
  User? currentUser = null;
  late DocumentSnapshot<Map<String, dynamic>> currentUserDoc;
  late FirestoreUser firestoreUser;

  // Constructor
  MainModel() {
    init();
  }

  Future<void> init() async {
    startLoading();
    currentUser = FirebaseAuth.instance.currentUser;
    // OVU4cR6IiROm42BEC3nwscTC1OM2
    currentUserDoc = await FirebaseFirestore.instance.collection(usersFieldKey)
        .doc(currentUser!.uid).get();
    firestoreUser = FirestoreUser.fromJson(currentUserDoc.data()!);
    endLoading();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> logout({required BuildContext context, required MainModel mainModel}) async {
    await FirebaseAuth.instance.signOut();
    setCurrentUser();
    routes.toLoginPage(context: context);
  }
}
