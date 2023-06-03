import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(accountTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text(logoutText),
          ),
        ],
      ),
    );
  }
}