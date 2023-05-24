import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ViewとModelの橋渡しとなるProvider
final mainProvider = ChangeNotifierProvider((_) => MainModel());

class MainModel extends ChangeNotifier {
  int counter = 0; // 変数の先頭に_はprivateなので、つけないようにする

  void incrementCounter() {
    counter++;
    // setState()はStatefulWidgetでのみ使えるのでここでは使えない
    // 代わりにnotifyListeners()を使う
    notifyListeners(); // これを呼ぶと、変更を検知して再描画してくれる
  }
}
