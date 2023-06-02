import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(searchTitle));
  }
}