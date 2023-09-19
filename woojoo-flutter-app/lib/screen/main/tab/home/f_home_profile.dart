import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/w_height.dart';
import 'package:woojoo/data/memory/user/dto_my_profile.dart';
import 'package:woojoo/data/memory/user/user_simple_data.dart';

import '../../../../common/widget/avatar/w_profile_avatar.dart';

class HomeProfileFrame extends StatefulWidget {
  const HomeProfileFrame({Key? key}) : super(key: key);

  @override
  State<HomeProfileFrame> createState() => _HomeProfileFrameState();
}

class _HomeProfileFrameState extends State<HomeProfileFrame>
    with UserSimpleDataProvider {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      MyProfile myProfile = userSimpleData.myProfile;
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              context.appColors.headerBackgroundColor,
              context.appColors.mainBackgroundColor,
            ],
            stops: const [0.4, 0.4],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileAvatar(image: myProfile.profileImageName, size: 45),
            const Height(15),
            myProfile.name.text
                .size(25)
                .fontWeight(FontWeight.bold)
                .color(context.appColors.text)
                .make(),
          ],
        ).pSymmetric(v: 15, h: 13),
      );
    });
  }
}
