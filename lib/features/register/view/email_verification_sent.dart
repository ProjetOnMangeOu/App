import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/domain/entities/user.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/shared/constants/app.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

class EmailVerificationSentView extends StatefulWidget {
  const EmailVerificationSentView({super.key});

  @override
  EmailVerificationSentViewState createState() =>
      EmailVerificationSentViewState();
}

class EmailVerificationSentViewState extends State<EmailVerificationSentView> {
  late Duration remainingTime;
  Timer? timer;

  startTimer() {
    remainingTime = const Duration(seconds: AppConstants.resendEmailWaitTime);
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (remainingTime.inSeconds == 0) {
          t.cancel();
        } else {
          remainingTime = remainingTime - const Duration(seconds: 1);
        }
      });
    });
  }

  resendEmail() {
    try {
      if (remainingTime.inSeconds > 0) return;

      startTimer();
      context
          .read<AuthAPI>()
          .sendEmailVerification(url: AppWriteConstants.emailVerificationUrl);
    } on AppwriteException catch (e) {
      Utils.logError(
          message:
              "RegisterEmailVerificationViewState: error while requesting email verification ",
          error: e);
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('We send you a verification'),
          ElevatedButton(
            onPressed: () {
              resendEmail();
            },
            child: Text('send email again (${remainingTime.inSeconds})'),
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
