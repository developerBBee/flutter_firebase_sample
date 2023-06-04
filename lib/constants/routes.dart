// flutter
import 'package:flutter/material.dart';
import 'package:flutter_application_test/domain/firestore_user/firestore_user.dart';

// pages
import 'package:flutter_application_test/main.dart';
import 'package:flutter_application_test/views/account_page.dart';
import 'package:flutter_application_test/views/main/passive_user_profile_page.dart';
import 'package:flutter_application_test/views/signup_page.dart';
import 'package:flutter_application_test/views/login_page.dart';

// model
import 'package:flutter_application_test/models/main_model.dart';

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

void toAccountPage({ required BuildContext context, required MainModel mainModel }) => {
  Navigator.push(
    context,
    MaterialPageRoute( // 画面遷移
      builder: (context) => AccountPage(mainModel: mainModel),
    ),
  )
};

void toPassiveUserProfilePage({
  required BuildContext context,
  required FirestoreUser passiveUser
}) => {
  Navigator.push(
    context,
    MaterialPageRoute( // 画面遷移
      builder: (context) => PassiveUserProfilePage(passiveUser: passiveUser),
    ),
  )
};