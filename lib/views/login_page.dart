// flutter
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_test/details/rounded_button.dart';
import 'package:flutter_application_test/details/rounded_password_field.dart';
import 'package:flutter_application_test/details/rounded_text_field.dart';
import 'package:flutter_application_test/models/main_model.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// models
import 'package:flutter_application_test/models/login_model.dart';


class LoginPage extends ConsumerWidget {
  const LoginPage({
    Key? key,
    required MainModel this.mainModel
  }) : super(key: key);
  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider); // Providerを監視
    final TextEditingController emailController =
        TextEditingController(text: loginModel.email);
    final TextEditingController passwordController =
        TextEditingController(text: loginModel.password);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = text,
            controller: emailController,
            color: Colors.white,
            borderColor: Colors.red,
            shadowColor: Colors.green,
            hintText: "Input your email for login",
          ),
          RoundedPasswordField(
            onChanged: (text) => loginModel.password = text,
            controller: passwordController,
            obscureText: loginModel.isObscure,
            toggleObsureText: () => loginModel.toggleObscure(),
            color: Colors.white,
            borderColor: Colors.red,
            shadowColor: Colors.blue,
          ),
          RoundedButton(
            onPressed: () async => await loginModel.login(context: context, mainModel: mainModel),
            widthRate: 0.8,
            color: Colors.cyan,
          )
        ],
      ),
    );
  }
}
