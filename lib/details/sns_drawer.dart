import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/routes.dart' as routes;
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_application_test/models/main_model.dart';
import 'package:flutter_application_test/models/themes_model.dart';

class SNSDrawer extends StatelessWidget {
  const SNSDrawer({
    Key? key,
    required this.mainModel,
    required this.themesModel,
  }) : super(key: key);
  final MainModel mainModel;
  final ThemesModel themesModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text(accountTitle),
            onTap: () => routes.toAccountPage(context: context, mainModel: mainModel),
          ),
          ListTile(
            title: const Text(themeTitle),
            trailing: CupertinoSwitch( // トグルスイッチ
              value: themesModel.isDarkTheme,
              onChanged: (bool value) => themesModel.setIsDarkTheme(value: value),
            ),
          ),
        ],
      ),
    );
  }
}