import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onmangeou/shared/widgets/elements/CustomNotchedShape.dart';

class CustomNavbar extends StatelessWidget {
  final Function(int) onItemTapped;
  final double height;

  const CustomNavbar({
    super.key,
    required this.onItemTapped,
    this.height = kBottomNavigationBarHeight + 15
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: height,
      color: Theme.of(context).colorScheme.primary,
      shape: const CustomNotchedShape(convex: true),
      notchMargin: 8,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildNavItem(context, 0, TablerIcons.clipboard_list, 'List'),
          _buildNavItem(context, 1, TablerIcons.thumb_up, 'Likes'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 60,
            alignment: Alignment.center,
            child: Text(
              'Choose a restaurant',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _buildNavItem(context, 2, TablerIcons.users, 'Groups'),
          _buildNavItem(context, 3, TablerIcons.user_circle, 'Account'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData icon, String label) {
    return Expanded(
      child: InkWell(
        onTap: () => onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 25),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
