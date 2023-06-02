// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// constants
import 'package:flutter_application_test/constants/ints.dart';

final snsBottomNavigationBarProvider = ChangeNotifierProvider(
  (ref) => SNSBottomNavigationBarModel()
);
class SNSBottomNavigationBarModel extends ChangeNotifier {
  int currentIndex = 0;
  late PageController pageController;

  SNSBottomNavigationBarModel() {
    init();
  }

  void init() {
    pageController = PageController(initialPage: currentIndex);
    notifyListeners();
  }

  void onPageChanged({required int index}) {
    currentIndex = index;
    notifyListeners();
  }

  void onTabTapped({required int index}) {
    // Translate page with animation
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: pageAnimationDuration),
      curve: Curves.easeIn,
    );
  }

  void setPageController() {
    pageController = PageController(initialPage: currentIndex);
    notifyListeners();
  }
}