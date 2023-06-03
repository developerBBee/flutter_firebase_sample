import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/routes.dart' as routes;
import 'package:flutter_application_test/constants/strings.dart';

class SNSDrawer extends StatelessWidget {
  const SNSDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text(accountTitle),
            onTap: () => routes.toAccountPage(context: context),
          )
        ],
      ),
    );
  }
}