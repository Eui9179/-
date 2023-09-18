import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/w_height.dart';
import 'package:woojoo/data/memory/user/dto_my_profile.dart';
import 'package:woojoo/data/memory/user/user_simple_data.dart';

import '../../../../common/widget/avatar/w_profile_avatar.dart';
import '../../../../utils/notification.dart';
import '../../../authentication/s_login.dart';

class HomeProfileFrame extends StatefulWidget {
  const HomeProfileFrame({Key? key}) : super(key: key);

  @override
  State<HomeProfileFrame> createState() => _HomeProfileFrameState();
}

class _HomeProfileFrameState extends State<HomeProfileFrame>
    with UserSimpleDataProvider, AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
            ProfileAvatar(image: userSimpleData.profileImageName, size: 45),
            const Height(15),
            userSimpleData.name.text
                .size(25)
                .fontWeight(FontWeight.bold)
                .color(context.appColors.font)
                .make(),
          ],
        ).pSymmetric(v: 15, h: 13),
      ),
    );
  }

  _initMyProfile() async {
    MyProfile myProfile = await userSimpleData.getMyProfile();
    if (myProfile.statusCode != 200) {
      notification(context, "다시 로그인 해주세요");
      Get.offAll(() => const LoginScreen(), transition: Transition.downToUp);
    }
    userSimpleData.setMyProfile(myProfile);
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _initMyProfile();
  }
}
