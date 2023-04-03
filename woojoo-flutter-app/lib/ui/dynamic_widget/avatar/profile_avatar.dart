import 'package:woojoo/dio/dio_instance.dart';
import 'package:woojoo/utils/color_palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key, required this.image, required this.size})
      : super(key: key);

  final String? image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorPalette.mainBackgroundColor,
      backgroundImage: image != "default.png"
          ? NetworkImage('$cdnProfileImageBaseUri$image')
          : const AssetImage("assets/images/logo/default.png") as ImageProvider,
      radius: size,
    );
  }
}
