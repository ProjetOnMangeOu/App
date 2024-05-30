import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  // Il manque dans ce controller des retours pour informations incorrecte ou password non identique

  registerAccount(
      String username, String email, String password, String passwordConfirm) {
    try {
      context.read<AuthAPI>().registerAccount(
          email: email, password: password, username: username);
    } on AppwriteException catch (e) {
      Utils.logDebug(
          message: "LoginViewState: error while signing with password ",
          error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'username',
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'email',
            ),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'password',
            ),
          ),
          TextField(
            controller: passwordConfirmController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'confirm password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              registerAccount(usernameController.text, emailController.text,
                  passwordController.text, passwordConfirmController.text);
            },
            child: const Text('register'),
          ),
        ]));
  }
}
