import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:onmangeou/shared/widgets/elements/CustomNotchedShape.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomNavbar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.primary,
      shape: const CustomNotchedShape(convex: true),
      notchMargin: 8,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              const Icon(TablerIcons.clipboard_list, size: 25),

              Text('List', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10) )
            ],
          ),
          Column(
            children: [
              const Icon(TablerIcons.thumb_up, size: 25),

              Text('Likes', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10) )
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Text('Restaurant', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10)),
          ),
          Column(
            children: [
              const Icon(TablerIcons.users, size: 25),

              Text('Groups', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10) )
            ],
          ),
          Column(
            children: [
              const Icon(TablerIcons.user_circle, size: 25),

              Text('Account', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10) )
            ],
          )
        ],
      ),
    );
  }
}
