import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_application_test/domain/firestore_user/firestore_user.dart';
import 'package:flutter_application_test/domain/following_token/following_token.dart';
import 'package:flutter_application_test/models/main_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passiveUserProfileProvider = ChangeNotifierProvider((_) => PassiveUserProfileModel());

class PassiveUserProfileModel extends ChangeNotifier {

  Future<void> follow({
    required MainModel mainModel,
    required FirestoreUser passiveUser,
  }) async {
    mainModel.followingUids.add(passiveUser.uid);
    notifyListeners();
    // Firestoreにフォロー情報を保存
    final FollowingToken followingToken = FollowingToken(
      createdAt: Timestamp.now(),
      passiveUid: passiveUser.uid,
      tokenId: getUUID(),
    );
    final FirestoreUser activeUser = mainModel.firestoreUser;
    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(activeUser.uid)
        .collection(tokensFieldKey)
        .doc(followingToken.tokenId)
        .set(followingToken.toJson());
  }

  Future<void> unFollow({
    required MainModel mainModel,
    required FirestoreUser passiveUser,
  }) async {
    mainModel.followingUids.remove(passiveUser.uid);
    notifyListeners();
    // Firestoreからフォロー情報を取得して、削除する
    final FirestoreUser activeUser = mainModel.firestoreUser;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection(usersFieldKey)
            .doc(activeUser.uid)
            .collection(tokensFieldKey)
            .where("passiveUid", isEqualTo: passiveUser.uid)
            .get();
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    final QueryDocumentSnapshot<Map<String, dynamic>> doc = docs[0];
    await doc.reference.delete();
  }
}

