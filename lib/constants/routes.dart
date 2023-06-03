// flutter
import 'package:flutter/material.dart';

// pages
import 'package:flutter_application_test/main.dart';
import 'package:flutter_application_test/views/account_page.dart';
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

void toLoginPage({ required BuildContext context }) => {
  Navigator.push(
    context,
    MaterialPageRoute( // 画面遷移
      builder: (context) => const LoginPage(),
    ),
  )
};

void toAccountPage({ required BuildContext context }) => {
  Navigator.push(
    context,
    MaterialPageRoute( // 画面遷移
      builder: (context) => const AccountPage(),
    ),
  )
};