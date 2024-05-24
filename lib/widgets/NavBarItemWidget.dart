
import 'package:flutter/material.dart';
import 'BottomNavigationWidget.dart';

class NavBarItem extends StatefulWidget {
  final BottomNavBarItem item;
  final int index;
  bool selected;
  final Function onTap;
  final Color? backgroundColor;
  NavBarItem({
    super.key,
    required this.item,
    this.selected = false,
    required this.onTap,
    this.backgroundColor,
    required this.index,
  });

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}
class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.all(8),
        duration: const Duration(milliseconds: 300),
        constraints: BoxConstraints(minWidth: widget.selected ? 100 : 56),
        height: 56,
        decoration: BoxDecoration(
          color: widget.selected
              ? widget.backgroundColor ?? Colors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.item.icon,
                color: widget.selected ? Colors.blue : Colors.grey,
              ),
              Offstage(
                  offstage: !widget.selected, child: Text(widget.item.title)),
            ],
          ),
        ),
      ),
    );
  }
}