// flutter
import 'package:flutter/material.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class MyApp extends ConsumerWidget {
  // StatelessWidgetは状態変更なしのウィジェット

  // Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider); // Providerを監視
    return MaterialApp(
      debugShowCheckedModeBanner: false, // デバッグバナーを非表示にする
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainModel.currentUser == null
          ? LoginPage(mainModel: mainModel)
          : MyHomePage(title: 'Flutter Demo Home Page', mainModel: mainModel)
    );
  }
}

class MyHomePage extends StatelessWidget {
  // ConsumerWidgetはStateFulWidgetを継承している
  const MyHomePage({super.key, required this.title, required this.mainModel });

  final MainModel mainModel;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // 縦方向に均等に配置
        children: [
           ElevatedButton(
            onPressed: () => routes.toSignupPage(context: context),
            child: const Text("Signup Page")
          ),
           ElevatedButton(
            onPressed: () => routes.toLoginPage(context: context, mainModel: mainModel),
            child: const Text("Login Page")
          ),
        ],
      ),
    );
  }
}
