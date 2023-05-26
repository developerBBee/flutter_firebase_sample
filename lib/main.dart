// flutter
import 'package:flutter/material.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
// models
import 'package:flutter_application_test/main_model.dart';
// options
import 'firebase_options.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false, // デバッグバナーを非表示にする
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  // ConsumerWidgetはStateFulWidgetを継承している
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MainModel mainModel = ref.watch(mainProvider); // Providerを監視
    final TextEditingController emailController =
        TextEditingController(text: mainModel.email);
    final TextEditingController passwordController =
        TextEditingController(text: mainModel.password);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => mainModel.email = text,
            controller: emailController,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => mainModel.password = text,
            controller: passwordController,
            obscureText: mainModel.isObscure,
            decoration: InputDecoration(
              suffix: InkWell(
                child: mainModel.isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                onTap: () => mainModel.toggleObscure(),
              )),
          ),
          Center(
              child: mainModel.currentUser == null
                  ? Text("is Null")
                  : Text("is Not Null")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await mainModel.createUser(context: context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
