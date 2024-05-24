import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/shared/utils.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginViewState();
  }


}
class _LoginViewState extends State<LoginView> {

  signInWithPassword(String email,String password){
    try{
      context.read<AuthAPI>().loginWithPass(email: email,password:password);
    }
    on AppwriteException catch(e){
      Utils.logDebug(message: "login error",error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Hello Login!"),
    );
  }
}