// flutter
import 'package:flutter/material.dart';

// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider((_) => LoginModel());

class LoginModel extends ChangeNotifier {
  User? currentUser = null;
  // auth
  String email = '';
  String password = '';
  bool isObscure = true; // true: passwordを隠す

  Future<void> login() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      currentUser = FirebaseAuth.instance.currentUser;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}