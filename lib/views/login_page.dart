// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// models
import 'package:flutter_application_test/models/login_model.dart';


class LoginPage extends ConsumerWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider); // Providerを監視
    final TextEditingController emailController =
        TextEditingController(text: loginModel.email);
    final TextEditingController passwordController =
        TextEditingController(text: loginModel.password);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = text,
            controller: emailController,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            onChanged: (text) => loginModel.password = text,
            controller: passwordController,
            obscureText: loginModel.isObscure,
            decoration: InputDecoration(
              suffix: InkWell(
                child: loginModel.isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                onTap: () => loginModel.toggleObscure(),
              )),
          ),
          Center(
              child: loginModel.currentUser == null
                  ? Text("is Null")
                  : Text("is Not Null")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await loginModel.login(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
