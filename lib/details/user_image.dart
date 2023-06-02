// flutter
import 'package:flutter/material.dart';
import 'package:flutter_application_test/details/circle_image.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.length,
    required this.userImageUrl
  }) : super(key: key);
  final double length;
  final String userImageUrl;

  @override
  Widget build(BuildContext context) {
    // UserImageが空の場合は、デフォルトのアイコンを表示する
    return userImageUrl.isEmpty ?
    Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        shape: BoxShape.circle
      ),
      child: Icon(Icons.person, size: length,),
    )
    : CircleImage(length: length, image: NetworkImage(userImageUrl));
  }
}