import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/shared/constants/app.dart';
import 'package:onmangeou/shared/constants/appwrite.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

class RequestPasswordSentView extends StatefulWidget {
  final String email;
  const RequestPasswordSentView({super.key, required this.email});

  @override
  State<RequestPasswordSentView> createState() => _RequestPasswordSentViewState();
}

class _RequestPasswordSentViewState extends State<RequestPasswordSentView> {
  Duration remainingTime = const Duration(seconds: AppConstants.resendEmailWaitTime);
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (remainingTime.inSeconds == 0) {
          t.cancel();
          remainingTime = const Duration(seconds: AppConstants.resendEmailWaitTime);
        } else {
          remainingTime = remainingTime - const Duration(seconds: 1);
        }
      });
    });
  }

  requestPasswordReset() {
    try {
      if(remainingTime.inSeconds > 0) return;

      setState(() {
        startTimer();
      });
      context.read<AuthAPI>().requestPasswordReset(email: widget.email, url: AppWriteConstants.resetPasswordUrl);
    } on AppwriteException catch (e) {
      Utils.logDebug(
          message: "RequestPasswordSentViewState: error while requesting password reset ",
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
          const Text('Request password reset sent'),
          ElevatedButton(
            onPressed: () {
              // resend email
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
