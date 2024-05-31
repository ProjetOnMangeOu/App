import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatefulWidget {
  final String userId;
  final String secret;
  const ResetPasswordView({super.key, required this.userId, required this.secret});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  resetPassword(String password, String confirmPassword, String userId, String secret) {
    try {
      context.read<AuthAPI>().confirmPasswordReset(userId: userId, secret: secret, password: password, passwordAgain: confirmPassword).then((_) {
        context.go('/login');
      });
    } on AppwriteException catch (e) {
      Utils.logDebug(
          message: "ResetPasswordViewState: error while resetting password ",
          error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Reset password'),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'password',
            ),
          ),
          TextField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'confirm password',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              resetPassword(passwordController.text, confirmPasswordController.text, widget.userId, widget.secret);
            },
            child: const Text('reset password'),
          ),
        ],
      ),
    );
  }
}
