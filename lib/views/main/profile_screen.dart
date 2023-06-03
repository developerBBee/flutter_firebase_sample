import 'package:flutter/material.dart';
import 'package:flutter_application_test/details/rounded_button.dart';
import 'package:flutter_application_test/details/user_image.dart';
import 'package:flutter_application_test/models/main/profile_model.dart';
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
    final ProfileModel profileModel = ref.watch(profileProvider);
    return Column(
      children: [
        // ユーザーアイコン
        profileModel.xFile == null ?
        // Nullの場合は、アイコンを表示する
        Container(
          alignment: Alignment.center,
          child: UserImage(length: 100.0, userImageUrl: mainModel.firestoreUser.userImageURL,),
        ) :
        // Nullでない場合は、Loadingを表示する
        const Text("Now Loading..."),

        // ボタン
        RoundedButton(
          onPressed: () async => await profileModel.uploadUserImage(currentUserDoc: mainModel.currentUserDoc),
          widthRate: 0.85,
          color: Colors.green,
          buttonText: "Upload"
        ),
      ],
    );
  }
}