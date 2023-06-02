import 'package:flutter/material.dart';
import 'package:flutter_application_test/details/user_image.dart';
import 'package:flutter_application_test/models/main_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    Key? key,
    required this.mainModel,
  }) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      child: UserImage(length: 100.0, userImageUrl: mainModel.firestoreUser.userImageURL),
    );
  }
}