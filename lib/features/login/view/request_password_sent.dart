import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

class RequestPasswordSentView extends StatefulWidget {
  const RequestPasswordSentView({super.key});

  @override
  State<RequestPasswordSentView> createState() => _RequestPasswordSentViewState();
}

class _RequestPasswordSentViewState extends State<RequestPasswordSentView> {

  // TODO: implement 30s wait before resending email and get email from previous screen
  requestPasswordReset(String email) {
    try {
      context.read<AuthAPI>().requestPasswordReset(email: email, url: AppWriteConstants.resetPasswordUrl);
    } on AppwriteException catch (e) {
      Utils.logDebug(
          message: "RequestPasswordSentViewState: error while requesting password reset ",
          error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Request password reset sent'),
          ElevatedButton(
            onPressed: () {
              // resend email
            },
            child: const Text('send email again (30s)'),
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
