import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_application_test/models/main_model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
    required this.mainModel,
  }) : super(key: key);
  final MainModel mainModel;

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
            onTap: () async => await mainModel.logout(context: context)
          ),
        ],
      ),
    );
  }
}