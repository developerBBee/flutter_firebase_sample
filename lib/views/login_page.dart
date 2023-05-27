// flutter
import 'package:flutter/material.dart';
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await loginModel.login(context: context, mainModel: mainModel),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
