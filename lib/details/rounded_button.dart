import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.widthRate,
    required this.color,
    required this.buttonText,
  }) : super(key: key);
  final void Function()? onPressed;
  final double widthRate; // 0.0 - 1.0
  final Color color;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width; // 画面サイズを取得

    return
    Container(
      width: maxWidth * widthRate,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(buttonText),
          )
        ),
      )
    );
  }
}