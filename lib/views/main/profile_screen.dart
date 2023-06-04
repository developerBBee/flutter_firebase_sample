import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_application_test/details/rounded_button.dart';
import 'package:flutter_application_test/details/user_image.dart';
import 'package:flutter_application_test/domain/firestore_user/firestore_user.dart';
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
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final int followersCount = firestoreUser.followersCount;
    final int plusOneCount = followersCount + 1;
    final bool isFollowed = mainModel.followingUids.contains(firestoreUser.uid);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileModel.croppedFile == null ?
        UserImage(length: 100.0, userImageUrl: firestoreUser.userImageURL,) 
        : ClipRRect(
          borderRadius: BorderRadius.circular(160.0),
          child: Image.file(profileModel.croppedFile!),
        ),

        // フォロー数
        Text(
          "フォロー中 ${firestoreUser.followingsCount}",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        // フォロワー数
        Text(
          isFollowed
              ? "フォロワー $plusOneCount"
              : "フォロワー ${firestoreUser.followersCount}",
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        // アップロードボタン
        RoundedButton(
          onPressed: () async => await profileModel.uploadUserImage(currentUserDoc: mainModel.currentUserDoc),
          widthRate: 0.85,
          color: Colors.green,
          buttonText: uploadText,
        ),

        // フォロー/アンフォローボタン
        isFollowed
            ? RoundedButton(
              onPressed: () => profileModel.unFollow(mainModel: mainModel, passiveFirestoreUser: firestoreUser),
              widthRate: 0.85,
              color: Colors.deepOrange,
              buttonText: unFollowText,
            )
            : RoundedButton(
              onPressed: () => profileModel.follow(mainModel: mainModel, passiveFirestoreUser: firestoreUser),
              widthRate: 0.85,
              color: Colors.green,
              buttonText: followText,
            ),
      ],
    );
  }
}