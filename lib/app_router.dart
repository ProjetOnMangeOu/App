import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/domain/entities/user.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/features/home/view/home_view.dart';
import 'package:onmangeou/features/login/view/login.dart';
import 'package:onmangeou/features/register/view/register.dart';
import 'package:onmangeou/features/register/view/register_email_verification.dart';
import 'package:onmangeou/shared/utils.dart';

class AppRouter {
  static GoRouter createRouter(BuildContext context, AuthAPI authAPI, User? user) {
    final authStatus = authAPI.status;
    final isVerified = user?.isVerified ?? false;
    Utils.logDebug(message: 'Auth status: $authStatus');

    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => const HomeView(),
            redirect: (BuildContext context, GoRouterState state) {
              final insideLoginPath =
                  state.fullPath.toString().startsWith('/login') ||
                      state.fullPath.toString().startsWith('/register');
              if (authStatus == AuthStatus.unauthenticated && !insideLoginPath ) {
                return "/login";
              }
              else if (authStatus == AuthStatus.authenticated && !insideLoginPath && !isVerified){
                return "/register/email-verification";
              }
              else {
                return null;
              }

            },
            routes: [
              GoRoute(
                path: 'login',
                builder: (context, state) => const LoginView(),
                redirect: (_, __) {
                  if (authStatus == AuthStatus.authenticated) {
                    return '/';
                  } else {
                    return null;
                  }
                },
                // J'ai préparé les routes pour la réinitialisation du mot de passe
                // routes: [
                //   GoRoute(
                //       path: 'request-password',
                //       builder: (context, state) => const RequestPasswordResetView()
                //   ),
                //   GoRoute(
                //       path: 'request-password-sent',
                //       builder: (context, state) => const RequestPasswordSentView()
                //   ),
                //   GoRoute(
                //       path: 'reset-password/:token',
                //       builder: (context, state) => const ResetPasswordView()
                //   ),
                // ]
              ),
              GoRoute(
                path: 'register',
                builder: (context, state) => const RegisterView(),
                redirect: (_, __) {
                  if (authStatus == AuthStatus.authenticated) {
                    return '/';
                  } else {
                    return null;
                  }
                },
                 routes: [
                     GoRoute(
                         path: 'email-verification',
                         redirect: (_, state) {
                           if(!state.uri.queryParameters.containsKey('userId') && !state.uri.queryParameters.containsKey('secret')) {
                             return '/register';
                           }
                           else {
                             return null;
                           }
                         },
                         builder: (context, state) => RegisterEmailVerificationView(userId: state.uri.queryParameters['userId']!, secret: state.uri.queryParameters['secret']!),
                     ),
                 ]
              )]),
      ],
    );
  }
}
