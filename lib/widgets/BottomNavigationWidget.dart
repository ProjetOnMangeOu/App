import 'package:flutter/material.dart';

import 'NavBarItemWidget.dart';

class BottomNavBarItem{
  final String title;
  final IconData icon;
  BottomNavBarItem({required this.title, required this.icon});
}

class BottomNavigationWidget extends StatefulWidget {
  final List<BottomNavBarItem> children;
  int currentIndex;
  final Color? backgroundColor;
  Function(int)? onTap;
  BottomNavigationWidget(
      {super.key,
      required this.children,
      required this.currentIndex ,
      this.backgroundColor,
      required this.onTap}
      );

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
  }

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: widget.backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      height: 56,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.children.length,
              (index) => NavBarItem(
            index: index,
            item: widget.children[index],
            selected: widget.currentIndex == index,
            onTap: () {
              setState(() {
                widget.currentIndex = index;
                widget.onTap!(widget.currentIndex);
              });
            },
          ),
        ),
      ),
    );
  }
}

