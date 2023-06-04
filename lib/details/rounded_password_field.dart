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
    required this.textColor,
    required this.borderColor,
    required this.shadowColor,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final bool obscureText;
  final void Function()? toggleObsureText;
  final Color color, textColor, borderColor, shadowColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      borderColor: borderColor,
      shadowColor: shadowColor,
      child: TextFormField(
        style: TextStyle(color: textColor),
        keyboardType: TextInputType.visiblePassword,
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          hintText: "Password",
          hintStyle: TextStyle(
            color: Color(textColor.value - 0x80000000),
            fontWeight: FontWeight.bold
          ),
          suffix: InkWell(
            child: obscureText
                ? Icon(Icons.visibility_off, color: textColor)
                : Icon(Icons.visibility, color: textColor),
            onTap: toggleObsureText,
          )),
      )
    );
  }
}