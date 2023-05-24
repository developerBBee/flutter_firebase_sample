import 'package:flutter/material.dart';
import 'package:flutter_application_test/main_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  const String title = 'Flutter Demo';
  runApp(const ProviderScope(
      child: MyApp(
    title: title,
  )));
}

class MyApp extends StatelessWidget {
  // StatelessWidgetは状態変更なしのウィジェット

  // Constructor
  const MyApp({super.key, required this.title}); // requiredは必須引数
  final String title; // コンストラクタで受け取る用のプロパティ

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // デバッグバナーを非表示にする
      title: title,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${mainModel.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: mainModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
