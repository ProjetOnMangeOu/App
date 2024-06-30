import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final double circlePosition;
  final double padding;
  final List<Widget> children;
  const CustomScaffold(
      {super.key,
      required this.children,
      this.circlePosition = 0.75,
      this.padding = 20});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double circleSize = screenWidth * 3;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -(screenHeight * circlePosition),
            left: (screenWidth * 0.5) - (circleSize / 2),
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: padding,
                  right: padding,
                  top: padding,
                  bottom: padding,
                ),
                child: Column(
                  children: children,
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
