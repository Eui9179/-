import 'package:flutter/material.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/remote/dio_instance.dart';

class Avatar extends StatelessWidget {
  final String imagePath;
  final double radius;
  final bool isAssert;

  static const double gameAvatarSize = 10;

  const Avatar({
    super.key,
    required this.imagePath,
    required this.radius,
    this.isAssert = false,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.appColors.transparent,
      radius: 10,
      foregroundImage: isAssert
          ? AssetImage(imagePath)
          : NetworkImage('$imageBaseUrl/$imagePath') as ImageProvider,
    );
  }
}
