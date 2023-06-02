import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    required this.length,
    required this.image
  }) : super(key: key);
  final double length;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    // UserImageが空の場合は、デフォルトのアイコンを表示する
    return Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
        image: DecorationImage(image: image),
        border: Border.all(color: Colors.green),
        shape: BoxShape.circle
      ),
    );
  }
}