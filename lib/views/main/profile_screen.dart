import 'package:flutter/material.dart';
import 'package:flutter_application_test/models/main_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.mainModel,
  }) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            mainModel.firestoreUser.userName,
            style: const TextStyle(fontSize: 50),
          )
        )
      ]
    );
  }
}