import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';
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
  double bottomBarHeight = kBottomNavigationBarHeight + 15;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double topBarHeight = MediaQuery.of(context).viewPadding.top;
    double circleSize = screenWidth * 3;

    onItemTapped(int index) {
      switch (index) {
        case 0:
          context.go('/list');
          break;
        case 1:
          context.go('/likes');
          break;
        case 2:
          context.go('/');
          break;
        case 3:
          context.go('/groups');
          break;
        case 4:
          context.go('/account');
          break;
        default:
          context.go('/');
      }
    }

    return Scaffold(
      bottomNavigationBar: !widget.hideAppBar
          ? CustomNavbar(
              height: bottomBarHeight,
              onItemTapped: onItemTapped,
            )
          : null,
      floatingActionButton: !widget.hideAppBar
          ? Container(
              decoration: BoxDecoration(
                boxShadow: [
                  Theme.of(context).extension<AppShadows>()!.secondaryShadow,
                ],
                borderRadius: BorderRadius.circular(999),
              ),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                onPressed: () => onItemTapped(2),
                tooltip: 'Home',
                child: const Icon(TablerIcons.smart_home, size: 30),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          if (!widget.gradientBackground)
            Positioned(
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
          if (widget.gradientBackground)
            Positioned.fill(
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
                  minHeight: screenHeight -
                      topBarHeight -
                      (widget.hideAppBar ? 0 : bottomBarHeight),
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
