import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/constants/strings.dart';
import 'package:flutter_application_test/domain/firestore_user/firestore_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = ChangeNotifierProvider((_) => SearchModel());
class SearchModel extends ChangeNotifier {
  List<FirestoreUser> users = []; 

  SearchModel() {
    init();
  }
  Future<void> init() async {
    // 全ユーザーを取得
    final qShot = await FirebaseFirestore.instance.collection(usersFieldKey).get();
    final docs = qShot.docs;
    users = docs.map((e) => FirestoreUser.fromJson(e.data())).toList();
    notifyListeners();
  }

}