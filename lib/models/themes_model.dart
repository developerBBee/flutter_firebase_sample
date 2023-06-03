import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemesModel()); 
class ThemesModel extends ChangeNotifier {
  bool isDarkTheme = true;

  void setIsDarkTheme({ required bool value }) {
    isDarkTheme = value;
    notifyListeners();
  }
}
