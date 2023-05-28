// flutter
import 'package:flutter/material.dart';

// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// route
import 'package:flutter_application_test/constants/routes.dart' as routes;

// ViewとModelの橋渡しとなるProvider
final mainProvider = ChangeNotifierProvider((_) => MainModel());

class MainModel extends ChangeNotifier {
  int counter = 0; // 変数の先頭に_はprivateなので、つけないようにする
  User? currentUser = null;

  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> logout({required BuildContext context, required MainModel mainModel}) async {
    await FirebaseAuth.instance.signOut();
    setCurrentUser();
    routes.toLoginPage(context: context, mainModel: mainModel);
  }
}
