// flutter
import 'package:flutter/material.dart';

// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// models
import 'package:flutter_application_test/models/main_model.dart';

// constants
import 'package:flutter_application_test/constants/routes.dart' as routes;

final loginProvider = ChangeNotifierProvider((_) => LoginModel());

class LoginModel extends ChangeNotifier {
  // auth
  String email = '';
  String password = '';
  bool isObscure = true; // true: passwordを隠す

  Future<void> login({required BuildContext context, required MainModel mainModel}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      routes.toMyApp(context: context);
      mainModel.setCurrentUser();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}