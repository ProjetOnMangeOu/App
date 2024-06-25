import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

class ResetPasswordView extends StatefulWidget {
  final String userId;
  final String secret;
  const ResetPasswordView(
      {super.key, required this.userId, required this.secret});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  resetPassword(
      {required String password,
      required String confirmPassword,
      required String userId,
      required String secret}) {
    try {
      context
          .read<AuthAPI>()
          .confirmPasswordReset(
              userId: userId,
              secret: secret,
              password: password,
              passwordAgain: confirmPassword)
          .then((res) {
        if (res['success'] == true) {
          context.go('/login');
        } else {
          Utils.logDebug(message: 'ResetPasswordViewState: not successful');
          // TODO: show error message to user
        }
      });
    } on AppwriteException catch (e) {
      Utils.logError(
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
              resetPassword(
                  password: passwordController.text,
                  confirmPassword: confirmPasswordController.text,
                  userId: widget.userId,
                  secret: widget.secret);
            },
            child: const Text('reset password'),
          ),
        ],
      ),
    );
  }
}
