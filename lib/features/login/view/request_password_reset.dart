import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

class RequestPasswordResetView extends StatefulWidget {
  const RequestPasswordResetView({super.key});

  @override
  State<RequestPasswordResetView> createState() => _RequestPasswordResetViewState();
}

class _RequestPasswordResetViewState extends State<RequestPasswordResetView> {
  final TextEditingController emailController = TextEditingController();

  requestPasswordReset(String email) {
    try {
      context.read<AuthAPI>().requestPasswordReset(email: email, url: AppWriteConstants.resetPasswordUrl);
    } on AppwriteException catch (e) {
      Utils.logDebug(
          message: "RequestPasswordResetViewState: error while requesting password reset ",
          error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Request password reset'),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'email',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Send email to reset password
            },
            child: const Text('send email'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('cancel'),
          ),
        ],
      ),
    );
  }
}
