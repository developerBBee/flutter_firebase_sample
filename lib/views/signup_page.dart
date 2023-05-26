// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// models
import 'package:flutter_application_test/models/signup_model.dart';

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
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => signupModel.email = text,
            controller: emailController,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => signupModel.password = text,
            controller: passwordController,
            obscureText: signupModel.isObscure,
            decoration: InputDecoration(
              suffix: InkWell(
                child: signupModel.isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                onTap: () => signupModel.toggleObscure(),
              )),
          ),
          Center(
              child: signupModel.currentUser == null
                  ? Text("is Null")
                  : Text("is Not Null")),
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
