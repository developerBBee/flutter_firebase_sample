import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/routes.dart' as routes;
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_application_test/models/main_model.dart';

class SNSDrawer extends StatelessWidget {
  const SNSDrawer({
    Key? key,
    required this.mainModel,
  }) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text(accountTitle),
            onTap: () => routes.toAccountPage(context: context, mainModel: mainModel),
          )
        ],
      ),
    );
  }
}