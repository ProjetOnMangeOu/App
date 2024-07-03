import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';

class CustomScaffold extends StatelessWidget {
  final double circlePosition;
  final bool gradientBackground;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomScaffold({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.circlePosition = 0.75,
    this.gradientBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double topBarHeight = MediaQuery.of(context).viewPadding.top;
    double circleSize = screenWidth * 3;

    return Scaffold(
      body: Stack(
        children: [
          if(!gradientBackground) Positioned(
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

          if(gradientBackground) Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                  child: Container(
                constraints: BoxConstraints(
                  minHeight: screenHeight - topBarHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                      Theme.of(context).extension<AppSizes>()!.padding),
                  child: Column(
                    mainAxisAlignment: mainAxisAlignment,
                    crossAxisAlignment: crossAxisAlignment,
                    children: children,
                  ),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
