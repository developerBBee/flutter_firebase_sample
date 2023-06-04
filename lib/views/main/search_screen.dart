import 'package:flutter/material.dart';
import 'package:flutter_application_test/domain/firestore_user/firestore_user.dart';
import 'package:flutter_application_test/models/main/search_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_test/constants/routes.dart' as routes;

class SearchScreen extends ConsumerWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchModel searchModel = ref.watch(searchProvider);
    final List<String> uids = searchModel.users.map((e) => e.uid).toList();
    return ListView.builder(
      itemCount: uids.length,
      itemBuilder: (context, index) {
        final FirestoreUser firestoreUser = searchModel.users[index];
        return ListTile(
          title: Text(firestoreUser.uid),
          onTap: () => routes.toPassiveUserProfilePage(
            context: context,
            passiveUser: firestoreUser,
          ),
        );
      },
    );
  }
}