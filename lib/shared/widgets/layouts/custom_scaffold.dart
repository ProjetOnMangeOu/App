import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/app_sizes.dart';
import 'package:onmangeou/shared/widgets/layouts/custom_navbar.dart';

class CustomScaffold extends StatefulWidget {
  final bool hideAppBar;
  final double circlePosition;
  final bool gradientBackground;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const CustomScaffold({
    super.key,
    required this.children,
    this.hideAppBar = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.circlePosition = 0.75,
    this.gradientBackground = false,
  });

  @override
  State<CustomScaffold> createState() => _CustomScaffold();
}

class _CustomScaffold extends State<CustomScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double topBarHeight = MediaQuery.of(context).viewPadding.top;
    double circleSize = screenWidth * 3;

    return Scaffold(
      bottomNavigationBar: !widget.hideAppBar ? CustomNavbar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ) : null,
      floatingActionButton: !widget.hideAppBar ? FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        onPressed: () => _onItemTapped(2),
        tooltip: 'Home',
        child: const Image(
            image: AssetImage('assets/icons/home.png')),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: Stack(
        children: [
          if(!widget.gradientBackground) Positioned(
            top: -(screenHeight * widget.circlePosition),
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

          if(widget.gradientBackground) Positioned.fill(
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
                    mainAxisAlignment: widget.mainAxisAlignment,
                    crossAxisAlignment: widget.crossAxisAlignment,
                    children: widget.children,
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
