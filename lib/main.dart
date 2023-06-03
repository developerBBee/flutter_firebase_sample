// flutter
import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/themes.dart';
import 'package:flutter_application_test/details/sns_bottom_navigation_bar.dart';
import 'package:flutter_application_test/details/sns_drawer.dart';
import 'package:flutter_application_test/models/themes_model.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// models
import 'package:flutter_application_test/models/main_model.dart';
import 'package:flutter_application_test/models/sns_bottom_navigation_bar_model.dart';
// options
import 'firebase_options.dart';
// constants
import 'package:flutter_application_test/constants/strings.dart';
// pages
import 'package:flutter_application_test/views/login_page.dart';
import 'package:flutter_application_test/views/main/home_screen.dart';
import 'package:flutter_application_test/views/main/search_screen.dart';
import 'package:flutter_application_test/views/main/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // StatelessWidgetは状態変更なしのウィジェット

  // Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? onceUser = FirebaseAuth.instance.currentUser; // MyApp起動時にログインしているかどうかを確認
    final ThemesModel themesModel = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false, // デバッグバナーを非表示にする
      title: 'Flutter Demo',
      theme: themesModel.isDarkTheme
          ? darkThemeData(context: context)
          : lightThemeData(context: context),
      home: onceUser == null
          ? const LoginPage()
          : MyHomePage(title: appTitle, themesModel: themesModel)
    );
  }
}

class MyHomePage extends ConsumerWidget {
  // ConsumerWidgetはStateFulWidgetを継承している
  const MyHomePage({
    super.key,
    required this.title,
    required this.themesModel,
  });
  final String title;
  final ThemesModel themesModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider); // mainModel.init()が実行される
    final SNSBottomNavigationBarModel snsBottomNavigationBarModel = ref.watch(snsBottomNavigationBarProvider);
    final createdTimestamp = mainModel.currentUserDoc["createdAt"] as Timestamp;
    final createdDateTime = createdTimestamp.toDate();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: SNSDrawer(mainModel: mainModel, themesModel: themesModel,),
      body: mainModel.isLoading? const Center(child: CircularProgressIndicator()) :
      PageView(
        controller: snsBottomNavigationBarModel.pageController,
        onPageChanged: (index) => snsBottomNavigationBarModel.onPageChanged(index: index),
        children: [
          HomeScreen(),
          SearchScreen(),
          ProfileScreen(mainModel: mainModel,),
        ],
      ),
      bottomNavigationBar: SNSBottomNavigationBar(
        snsBottomNavigationBarModel: snsBottomNavigationBarModel
      ),
    );
  }
}
