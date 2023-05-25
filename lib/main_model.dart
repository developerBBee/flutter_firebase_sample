// flutter
import 'package:flutter/material.dart';

// packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ViewとModelの橋渡しとなるProvider
final mainProvider = ChangeNotifierProvider((_) => MainModel());

class MainModel extends ChangeNotifier {
  int counter = 0; // 変数の先頭に_はprivateなので、つけないようにする

  Future<void> createUser({required BuildContext context}) async {
    counter++;
    // Firestoreに保存
    final Map<String, dynamic> userData = {
      "userName": "Alice",
      "uid": "firstUser",
    };
    await FirebaseFirestore.instance
        .collection('users')
        .doc('firstUser')
        .set(userData);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('ユーザーが作成できました')));

    // setState()はStatefulWidgetでのみ使えるのでここでは使えない
    // 代わりにnotifyListeners()を使う
    notifyListeners(); // これを呼ぶと、変更を検知して再描画してくれる
  }
}
