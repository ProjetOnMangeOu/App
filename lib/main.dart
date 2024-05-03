import 'package:flutter/material.dart';
import 'App_router.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final router = AppRouter.createRouter(context);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:  const Color.fromRGBO(255, 184, 76, 1.0)),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      routerConfig: router,
    );

  }
}

