import 'package:flutter/material.dart';
import 'package:flutter_application_test/details/text_field_container.dart';

class RoundedTextField extends StatelessWidget{
  const RoundedTextField({
    Key? key,
    required this.keyboardType,
    required this.onChanged,
    required this.controller,
    required this.color,
    required this.borderColor,
    required this.shadowColor,
  }) : super(key: key);
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final Color color;
  final Color borderColor;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      borderColor: borderColor,
      shadowColor: shadowColor,
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        controller: controller,
      )
    );
  }
}