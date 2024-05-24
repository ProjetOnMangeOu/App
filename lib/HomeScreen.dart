import 'package:flutter/material.dart';
import 'package:onmangeou/widgets/BottomNavigationWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello home!"),);
    /*  bottomNavigationBar: BottomNavigationWidget(
        children: [BottomNavBarItem(title: "Test", icon: Icons.confirmation_number)],
        currentIndex: 0,
        backgroundColor: Colors.blue,
        onTap: ,
      )
    );*/
  }
}
