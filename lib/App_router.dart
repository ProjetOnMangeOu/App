import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';

class AppRouter{
  static GoRouter createRouter(BuildContext context){
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(title: 'On mange ou ?'),
          routes: [
            GoRoute(
              path: 'login',
              builder: (context, state) => const LoginScreen(),
            ),
          ],
        ),
      ],
    );
  }
}