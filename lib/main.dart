// flutter
import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_application_test/details/rounded_button.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// models
import 'package:flutter_application_test/models/main_model.dart';
// options
import 'firebase_options.dart';
// constants
import 'package:flutter_application_test/constants/routes.dart' as routes;
// pages
import 'package:flutter_application_test/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // StatelessWidgetは状態変更なしのウィジェット

  // Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final User? onceUser = FirebaseAuth.instance.currentUser; // MyApp起動時にログインしているかどうかを確認
    return MaterialApp(
      debugShowCheckedModeBanner: false, // デバッグバナーを非表示にする
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onceUser == null
          ? const LoginPage()
          : const MyHomePage(title: appTitle)
    );
  }
}

class MyHomePage extends ConsumerWidget {
  // ConsumerWidgetはStateFulWidgetを継承している
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider); // mainModel.init()が実行される
    final createdTimestamp = mainModel.currentUserDoc["createdAt"] as Timestamp;
    final createdDateTime = createdTimestamp.toDate();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainModel.isLoading? const Center(child: CircularProgressIndicator()) :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // 縦方向に均等に配置
          children: [
            RoundedButton(
              onPressed: () => routes.toSignupPage(context: context),
              widthRate: 0.5,
              color: Colors.brown,
              buttonText: signupTitle,
            ),
            Center(
              // OVU4cR6IiROm42BEC3nwscTC1OM2
              //child: Text("Uidは${mainModel.currentUserDoc["uid"]}です"),
              //child: Text("Uidは${mainModel.currentUserDoc.id}です"),
              //child: Text("Uidは${mainModel.currentUser!.uid}です"),
              // Created datetime
              child: Text("作成日は$createdDateTimeです"),
            ),
            RoundedButton(
              onPressed: () => routes.toLoginPage(context: context),
              widthRate: 0.5,
              color: Colors.blueGrey,
              buttonText: loginTitle,
            ),
            RoundedButton(
              onPressed: () async => await mainModel.logout(context: context, mainModel: mainModel),
              widthRate: 0.5,
              color: Colors.deepOrange,
              buttonText: logoutTitle,
            ),
          ],
        ),
      )
    );
  }
}
