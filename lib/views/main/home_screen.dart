import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(homeTitle));
  }
}