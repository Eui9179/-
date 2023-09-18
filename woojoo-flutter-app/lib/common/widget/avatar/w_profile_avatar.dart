import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../common/constants.dart';
import '../../../data/remote/dio/dio_instance.dart';

// TODO 리팩토링
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
      backgroundImage: image.isNotEmptyAndNotNull
          ? NetworkImage('$profileImageUrl/$image')
          : const AssetImage("$basePath/default.png") as ImageProvider,
      radius: size,
    );
  }
}
