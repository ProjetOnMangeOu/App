import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}
class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Hello Home!"),
    );
  }
}