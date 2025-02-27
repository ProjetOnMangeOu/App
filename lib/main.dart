import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onmangeou/app_router.dart';
import 'package:onmangeou/core/domain/repositories/restaurant_repository.dart';
import 'package:onmangeou/core/infrastructure/datasources/auth_api.dart';
import 'package:onmangeou/core/infrastructure/datasources/cache_api.dart';
import 'package:onmangeou/core/infrastructure/datasources/restaurant_api.dart';
import 'package:onmangeou/shared/theme/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:onmangeou/core/domain/entities/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => CacheAPI()),
              ChangeNotifierProvider(create: (_) => AuthAPI()),
              ChangeNotifierProxyProvider<AuthAPI, User?>(
                create: (_) => null,
                update: (_, auth, previousUser) {
                  if (auth.status == AuthStatus.authenticated &&
                      previousUser == null) {
                    return User(user: auth.currentUser);
                  }
                  return previousUser;
                },
              ),
              ChangeNotifierProxyProvider<AuthAPI, RestaurantAPI?>(
                create: (_) => null,
                update: (_, auth, previousRestaurantAPI) {
                  if (auth.status == AuthStatus.authenticated &&
                      previousRestaurantAPI == null) {
                    return RestaurantAPI();
                  }
                  return previousRestaurantAPI;
                },
              ),
              ChangeNotifierProxyProvider2<RestaurantAPI, CacheAPI,
                      RestaurantRepository?>(
                  create: (_) => null,
                  update: (_, restaurantAPI, cacheAPI, previousRepository) {
                    if (restaurantAPI.isInitialized &&
                        cacheAPI.isInitialized &&
                        previousRepository == null) {
                      return RestaurantRepository(restaurantAPI, cacheAPI);
                    }
                    return previousRepository;
                  }),
            ],
            child: const AppRoot(),
          )));
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
      theme: ThemeClass.lightTheme,
      routerConfig: router,
    );
  }
}
