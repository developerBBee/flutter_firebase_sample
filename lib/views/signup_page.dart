// flutter
import 'package:flutter/material.dart';
import 'package:flutter_application_test/details/rounded_password_field.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// models
import 'package:flutter_application_test/models/signup_model.dart';
// components
import 'package:flutter_application_test/details/rounded_text_field.dart';
import 'package:flutter_application_test/details/rounded_button.dart';
// constants
import 'package:flutter_application_test/constants/strings.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignupModel signupModel = ref.watch(signupProvider); // Providerを監視
    final TextEditingController emailController =
        TextEditingController(text: signupModel.email);
    final TextEditingController passwordController =
        TextEditingController(text: signupModel.password);
    return Scaffold(
      appBar: AppBar(
        title: const Text(signupTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => signupModel.email = text,
            controller: emailController,
            color: Colors.white,
            textColor: Colors.black,
            borderColor: Colors.red,
            shadowColor: Colors.purple,
            hintText: signupEmailHint,
          ),
          RoundedPasswordField(
            onChanged: (text) => signupModel.password = text,
            controller: passwordController,
            obscureText: signupModel.isObscure,
            toggleObsureText: () => signupModel.toggleObscure(),
            color: Colors.white,
            textColor: Colors.black,
            borderColor: Colors.red,
            shadowColor: Colors.orange,
          ),
          RoundedButton(
            onPressed: () async => await signupModel.createUser(context: context),
            widthRate: 0.8,
            color: Colors.pink,
            buttonText: signupText,
          ),
        ],
      ),
    );
  }
}
