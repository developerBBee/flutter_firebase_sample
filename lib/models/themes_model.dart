import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemesModel()); 
class ThemesModel extends ChangeNotifier {
  bool isDarkTheme = true;
  late SharedPreferences preferences; // SharaedPreferencesは設定値などを端末に保存するためのもの

  ThemesModel() {
    init();
  }
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
    isDarkTheme = preferences.getBool(isDarkThemeKey) ?? isDarkTheme;
    notifyListeners();
  }

  Future<void> setIsDarkTheme({ required bool value }) async {
    isDarkTheme = value;
    await preferences.setBool(isDarkThemeKey, value);
    notifyListeners();
  }
}
