import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/core/domain/entities/user.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/features/home/view/home.dart';
import 'package:onmangeou/features/login/view/login.dart';
import 'package:onmangeou/features/login/view/request_password_reset.dart';
import 'package:onmangeou/features/login/view/request_password_sent.dart';
import 'package:onmangeou/features/login/view/reset_password.dart';
import 'package:onmangeou/features/match/view/match.dart';
import 'package:onmangeou/features/match/view/match_like.dart';
import 'package:onmangeou/features/register/view/email_verification.dart';
import 'package:onmangeou/features/register/view/register.dart';
import 'package:onmangeou/features/welcome/view/welcome.dart';
import 'package:onmangeou/features/register/view/email_verification_sent.dart';
import 'package:onmangeou/shared/utils.dart';

class AppRouter {
  static GoRouter createRouter(
      BuildContext context, AuthAPI authAPI, User? user) {
    final authStatus = authAPI.status;
    final isVerified = user?.isVerified ?? false;
    Utils.logDebug(message: 'Auth status: $authStatus');

    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            if (authStatus == AuthStatus.authenticated && isVerified) {
              return const HomeView();
            } else {
              return const WelcomeView();
            }
          },
          redirect: (BuildContext context, GoRouterState state) {
            final insideLoginPath =
                state.fullPath.toString().startsWith('/login') ||
                    state.fullPath.toString().startsWith('/register');

            if (authStatus == AuthStatus.unauthenticated && !insideLoginPath) {
              return "/login";
            } else if (authStatus == AuthStatus.authenticated && !isVerified) {
              return "/register/email-verification-sent";
            } else {
              return null;
            }
          },
          routes: [
            GoRoute(
              path: 'match',
              redirect: (_, state) {
                if (!state.uri.queryParameters.containsKey('restaurantId')) {
                  return '/';
                } else {
                  return null;
                }
              },
              builder: (context, state) {
                return MatchView(restaurantId: state.uri.queryParameters['restaurantId']!);
              },
            ),
            GoRoute(
              path: 'match-like',
              redirect: (_, state) {
                if (!state.uri.queryParameters.containsKey('restaurantIds')) {
                  return '/';
                } else {
                  return null;
                }
              },
              builder: (context, state) {
                return MatchLikeView(restaurantIds: state.uri.queryParameters['restaurantIds']!.split(','));
              },
            )
          ],
        ),
        GoRoute(
            path: '/login',
            builder: (context, state) => const LoginView(),
            redirect: (_, __) {
              if (authStatus == AuthStatus.authenticated && isVerified) {
                return '/';
              } else if (authStatus == AuthStatus.authenticated &&
                  !isVerified) {
                return '/register/email-verification-sent';
              } else {
                return null;
              }
            },
            routes: [
              GoRoute(
                  path: 'request-password',
                  builder: (context, state) =>
                      const RequestPasswordResetView()),
              GoRoute(
                path: 'request-password-sent',
                redirect: (_, state) {
                  var email = (state.extra as Map<String, dynamic>?)?['email'];
                  return email == null ? '/login/request-password' : null;
                },
                builder: (context, state) {
                  var email = (state.extra as Map<String, dynamic>?)?['email']!;
                  return RequestPasswordSentView(email: email);
                },
              ),
              GoRoute(
                  path: 'reset-password',
                  redirect: (_, state) {
                    if (!state.uri.queryParameters.containsKey('userId') &&
                        !state.uri.queryParameters.containsKey('secret')) {
                      Utils.logDebug(
                          message: 'Reset password: missing userId or secret');
                      return '/login';
                    } else {
                      return null;
                    }
                  },
                  builder: (context, state) => ResetPasswordView(
                      userId: state.uri.queryParameters['userId']!,
                      secret: state.uri.queryParameters['secret']!)),
            ]),
        GoRoute(
            path: '/register',
            builder: (context, state) => const RegisterView(),
            redirect: (_, __) {
              if (authStatus == AuthStatus.authenticated && isVerified) {
                return '/';
              } else {
                return null;
              }
            },
            routes: [
              GoRoute(
                path: 'email-verification-sent',
                redirect: (_, state) {
                  if (authStatus != AuthStatus.authenticated) {
                    return '/login';
                  } else {
                    return null;
                  }
                },
                builder: (context, state) {
                  return const EmailVerificationSentView();
                },
              ),
              GoRoute(
                path: 'email-verification',
                redirect: (_, state) {
                  if (authStatus != AuthStatus.authenticated) {
                    return '/login';
                  } else if (!state.uri.queryParameters.containsKey('userId') &&
                      !state.uri.queryParameters.containsKey('secret')) {
                    return '/register';
                  } else {
                    return null;
                  }
                },
                builder: (context, state) => EmailVerificationView(
                    userId: state.uri.queryParameters['userId']!,
                    secret: state.uri.queryParameters['secret']!),
              ),
            ]),
      ],
    );
  }
}
