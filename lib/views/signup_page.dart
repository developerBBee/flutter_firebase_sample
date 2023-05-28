// flutter
import 'package:flutter/material.dart';
import 'package:flutter_application_test/details/rounded_password_field.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// models
import 'package:flutter_application_test/models/signup_model.dart';
// components
import 'package:flutter_application_test/details/rounded_text_field.dart';

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
        title: const Text("Signup"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => signupModel.email = text,
            controller: emailController,
            color: Colors.white,
            borderColor: Colors.red,
            shadowColor: Colors.purple,
            hintText: "Input your email for signup",
          ),
          RoundedPasswordField(
            onChanged: (text) => signupModel.password = text,
            controller: passwordController,
            obscureText: signupModel.isObscure,
            toggleObsureText: () => signupModel.toggleObscure(),
            color: Colors.white,
            borderColor: Colors.red,
            shadowColor: Colors.orange,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await signupModel.createUser(context: context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
