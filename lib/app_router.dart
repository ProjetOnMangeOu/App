import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/features/home/view/home_view.dart';
import 'package:onmangeou/features/login/view/login_view.dart';
import 'package:onmangeou/shared/utils.dart';

class AppRouter {
  static GoRouter createRouter(BuildContext context, AuthAPI authAPI) {
    final authStatus = authAPI.status;
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => const HomeView(),
            redirect: (BuildContext context, GoRouterState state) {
              final insideLoginPath =
                  state.fullPath.toString().startsWith('/login');
              if (authStatus == AuthStatus.unauthenticated &&
                  !insideLoginPath) {
                Utils.logDebug(message: "unAuthenticated");
                return "/login";
              } else {
                return null;
              }
            },
            routes: [
              GoRoute(
                  path: 'login',
                  builder: (context, state) => const LoginView(),
                  redirect: (_, __) {
                    if (authStatus == AuthStatus.authenticated) {
                      Utils.logDebug(message: "message");
                      return '/';
                    } else {
                      return null;
                    }
                  })
            ]),
      ],
    );
  }
}
