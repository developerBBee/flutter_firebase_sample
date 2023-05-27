// flutter
import 'package:flutter/material.dart';
import 'package:flutter_application_test/main.dart';
import 'package:flutter_application_test/models/main_model.dart';

// pages
import 'package:flutter_application_test/views/signup_page.dart';
import 'package:flutter_application_test/views/login_page.dart';

void toMyApp({ required BuildContext context }) => {
  Navigator.push(
    context,
    MaterialPageRoute( // 画面遷移
      builder: (context) => const MyApp(),
    ),
  )
};

void toSignupPage({ required BuildContext context }) => {
  Navigator.push(
    context,
    MaterialPageRoute( // 画面遷移
      builder: (context) => const SignupPage(),
    ),
  )
};

void toLoginPage({ required BuildContext context, required MainModel mainModel }) => {
  Navigator.push(
    context,
    MaterialPageRoute( // 画面遷移
      builder: (context) => LoginPage(mainModel: mainModel),
    ),
  )
};