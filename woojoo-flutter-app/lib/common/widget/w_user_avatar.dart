import 'package:flutter/material.dart';
import 'package:woojoo/common/constants.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/dio/dio_instance.dart';

class UserAvatar extends StatelessWidget {
  final String? imagePath;
  final double radius;

  const UserAvatar({
    super.key,
    this.imagePath,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: imagePath == "default.png"
          ? const AssetImage("$basePath/logo/default.png")
          : NetworkImage("$profileImagePath/$imagePath") as ImageProvider,
      radius: radius,
      backgroundColor: context.appColors.transparent,
    );
  }
}
