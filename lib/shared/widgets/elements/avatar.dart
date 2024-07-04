import 'package:flutter/material.dart';
import 'package:onmangeou/shared/theme/app_shadows.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final Image? image;
  final double size;

  const Avatar({
    super.key,
    this.imageUrl,
    this.image,
    this.size = 75,
  }) : assert(imageUrl != null || image != null,
            'Au moins une image ou un URL doit être fourni.');

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (imageUrl != null) {
      imageWidget = CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(imageUrl!),
      );
    } else if (image != null) {
      imageWidget = CircleAvatar(
        radius: size / 2,
        backgroundImage: image!.image,
      );
    } else {
      imageWidget = CircleAvatar(
        radius: size / 2,
        backgroundColor: Colors.grey,
      );
    }

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        boxShadow: [Theme.of(context).extension<AppShadows>()!.shadow],
      ),
      child: imageWidget,
    );
  }
}
