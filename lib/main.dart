import 'package:flutter/material.dart';
import 'package:onmangeou/app_router.dart';
import 'package:onmangeou/core/infrastructure/auth_api.dart';
import 'package:onmangeou/core/infrastructure/restaurant_api.dart';
import 'package:provider/provider.dart';
import 'package:onmangeou/core/domain/entities/user.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthAPI(),
      ),
      ChangeNotifierProxyProvider<AuthAPI, User?>(
        create: (_) => null,
        update: (_, auth, previousUser) {
          if (auth.status == AuthStatus.authenticated && previousUser == null) {
            return User(user: auth.currentUser);
          }
          return previousUser;
        },
      ),
      ChangeNotifierProxyProvider<AuthAPI, RestaurantAPI?>(
        create: (_) => null,
        update: (_, auth, previousRestaurantAPI) {
          if (auth.status == AuthStatus.authenticated && previousRestaurantAPI == null) {
            return RestaurantAPI();
          }
          return previousRestaurantAPI;
        },
      ),
    ],
    child: const AppRoot(),
  ));
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = AppRouter.createRouter(
        context, context.watch<AuthAPI>(), context.watch<User?>());

    return MaterialApp.router(
      title: 'On Mange Où ?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
