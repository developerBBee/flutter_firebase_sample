import 'package:flutter/material.dart';
import 'package:flutter_application_test/details/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget{
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.obscureText,
    required this.toggleObsureText,
    required this.color,
    required this.borderColor,
    required this.shadowColor,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final bool obscureText;
  final void Function()? toggleObsureText;
  final Color color, borderColor, shadowColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      borderColor: borderColor,
      shadowColor: shadowColor,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffix: InkWell(
            child: obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            onTap: toggleObsureText,
          )),
      )
    );
  }
}