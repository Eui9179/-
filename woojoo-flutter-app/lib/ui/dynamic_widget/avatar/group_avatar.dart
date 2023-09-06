import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/color_palette.dart';
import 'package:flutter/material.dart';
import '../../../utils/woojoo_groups.dart';

class GroupAvatar extends StatelessWidget {
  const GroupAvatar({Key? key, required this.image}) : super(key: key);

  final String? image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.appColors.headerBackgroundColor,
      radius: 30.0,
      child: CircleAvatar(
        backgroundImage: AssetImage(
            "assets/images/group/${changeGroupNameToFile(image)}_logo.jpg"),
        radius: 30.0,
      ),
    );
  }
}
