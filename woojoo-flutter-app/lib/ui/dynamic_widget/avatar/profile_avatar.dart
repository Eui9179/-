import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/dio/dio_instance.dart';
import 'package:woojoo/common/theme/color_palette.dart';
import 'package:flutter/material.dart';

import '../../../common/constants.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    required this.image,
    required this.size,
  }) : super(key: key);

  final String? image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.appColors.mainBackgroundColor,
      backgroundImage: image != null
          ? NetworkImage('$profileImageUrl/$image')
          : const AssetImage("$basePath/default.png") as ImageProvider,
      radius: size,
    );
  }
}
