import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_application_test/details/rounded_button.dart';
import 'package:flutter_application_test/details/user_image.dart';
import 'package:flutter_application_test/domain/firestore_user/firestore_user.dart';
import 'package:flutter_application_test/models/main_model.dart';
import 'package:flutter_application_test/models/passive_user_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PassiveUserProfilePage extends ConsumerWidget {
  const PassiveUserProfilePage({
    Key? key,
    required this.passiveUser,
    required this.mainModel,
  }) : super(key: key);
  final FirestoreUser passiveUser;
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel profileModel = ref.watch(passiveUserProfileProvider);
    final bool isFollowed = mainModel.followingUids.contains(passiveUser.uid);
    final int followersCount = passiveUser.followersCount;
    final int plusOneCount = followersCount + 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text(profileTitle),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserImage(length: 100.0, userImageUrl: passiveUser.userImageURL,),
          Text(passiveUser.uid),
          Text(passiveUser.userName),
          Text(passiveUser.email),

          // フォロー数
          Padding(padding: EdgeInsets.symmetric(vertical: 16.0),
          child:
            Text(
              "フォロー中 ${passiveUser.followingsCount}",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // フォロワー数
          Padding(padding: EdgeInsets.symmetric(vertical: 16.0),
          child:
            Text(
              isFollowed
                  ? "フォロワー $plusOneCount"
                  : "フォロワー ${passiveUser.followersCount}",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // フォロー/アンフォローボタン
          isFollowed
              ? RoundedButton(
                onPressed: () => profileModel.unFollow(mainModel: mainModel, passiveUser: passiveUser),
                widthRate: 0.85,
                color: Colors.deepOrange,
                buttonText: unFollowText,
              )
              : RoundedButton(
                onPressed: () => profileModel.follow(mainModel: mainModel, passiveUser: passiveUser),
                widthRate: 0.85,
                color: Colors.green,
                buttonText: followText,
              ),
        ],
      )),
    );
  }
}