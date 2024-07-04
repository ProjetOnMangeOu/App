import 'package:flutter/material.dart';
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
              const Image(
                  image: AssetImage('assets/icons/list.png')),

              Text('List', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10) )
            ],
          ),
          Column(
            children: [
              const Image(
                  image: AssetImage('assets/icons/list.png')),

              Text('List', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10) )
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Text('Restaurant', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10)),
          ),
          Column(
            children: [
              const Image(
                  image: AssetImage('assets/icons/list.png')),

              Text('List', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10) )
            ],
          ),
          Column(
            children: [
              const Image(
                  image: AssetImage('assets/icons/list.png')),

              Text('List', style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 10) )
            ],
          )
        ],
      ),
    );
  }
}
