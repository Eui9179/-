import 'package:flutter/material.dart';
import 'package:woojoo/common/constants.dart';
import 'package:woojoo/common/context_extension.dart';

class UserAvatar extends StatelessWidget {
  final String? imagePath;
  final double radius;

  const UserAvatar({
    super.key,
    required this.imagePath,
    this.radius = 25,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: getProfileImage(imagePath),
      radius: radius,
      backgroundColor: context.appColors.transparent,
    );
  }

  ImageProvider getProfileImage(String? profileImagePath) => profileImagePath == null
      ? const AssetImage("$basePath/default.png")
      : NetworkImage("$profileImagePath/$profileImagePath") as ImageProvider;
}
