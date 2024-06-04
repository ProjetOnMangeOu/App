import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

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
            ElevatedButton(
              onPressed: () {
                signInWithPassword(
                    emailController.text, passwordController.text);
              },
              child: const Text('login'),
            ),
            TextButton(
              onPressed: () {
                context.go(
                    '/register'); // Go to register page while replacing stack
              },
              child: const Text('REGISTER'),
            ),
            TextButton(
              onPressed: () {
                context.push('/login/request-password');
              },
              child: const Text('reset password'),
            )
          ]),
    );
  }
}
