// flutter
import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';

final List<BottomNavigationBarItem> bottomNavigationBarElements = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: homeTitle
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: searchTitle
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: profileTitle
  )
];