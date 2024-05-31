import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/infrastructure/auth_api.dart';
import '../../../shared/utils.dart';

class RegisterEmailVerificationView extends StatefulWidget {

  final String userId;
  final String secret;

  const RegisterEmailVerificationView({super.key, required this.userId, required this.secret});

  @override
  RegisterEmailVerificationViewState createState() =>
      RegisterEmailVerificationViewState();
}

class RegisterEmailVerificationViewState extends State<RegisterEmailVerificationView>{

    resendEmail(){
      try{
        context.read<AuthAPI>().sendEmailVerification();
      } on AppwriteException catch (e) {
        Utils.logDebug(
            message: "LoginViewState: error while signing with password ",
            error: e);
      }

    }

    registerAccount(
        String username, String email, String password, String passwordConfirm) {
      try {
        context.read<AuthAPI>().registerAccount(
            email: email, password: password, username: username).then((success) {
          if (success) {
            context.push('/register/email-verification');
          }
        });
      } on AppwriteException catch (e) {
        Utils.logDebug(
            message: "LoginViewState: error while signing with password ",
            error: e);
      }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          children: [
            const Text('We send you a verification'),
            ElevatedButton(
              onPressed: () {
                // TODO : resend email
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