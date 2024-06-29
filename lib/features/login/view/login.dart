import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

import 'package:onmangeou/shared/widgets/buttons.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  signInWithPassword(String email, String password) {
    try {
      context.read<AuthAPI>().loginWithPass(email: email, password: password);
    } on AppwriteException catch (e) {
      Utils.logError(
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
            OMGUButtons(
              text: 'LOGIN',
              onPressed: () {
                signInWithPassword(
                    emailController.text, passwordController.text);
              },
              color: Colors.orangeAccent,
            ),
            OMGUButtons(
              text: 'register',
              onPressed: () {
                context.go(
                    '/register'); // Go to register page while replacing stack
              },
              color: Colors.grey,
            ),
            OMGUButtons(
              text: 'forgot password',
              onPressed: () {
                context.push('/login/request-password');
              },
              color: Colors.grey,
            ),
          ]),
    );
  }
}
