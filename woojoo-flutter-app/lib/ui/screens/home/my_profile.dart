import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/controller/my_profile_controller.dart';
import 'package:woojoo/ui/dynamic_widget/avatar/profile_avatar.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote/profile/get_my_profile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initMyProfile();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(top: 15, bottom: 20, right: 13, left: 13),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              context.appColors.headerBackgroundColor,
              context.appColors.mainBackgroundColor
            ],
                stops: const [
              0.4,
              0.4
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileAvatar(
              size: 45,
              image: null,
            ),
            const SizedBox(
              height: 15,
            ),
            Text('',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: context.appColors.font)),
          ],
        ),
      );
    } else {
      return GetBuilder<MyProfileController>(
        builder: (controller) {
          String name = controller.name;
          String? profileImageName = controller.profileImage;

          return Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 15, bottom: 20, right: 13, left: 13),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  context.appColors.headerBackgroundColor,
                  context.appColors.mainBackgroundColor
                ],
                    stops: [
                  0.4,
                  0.4
                ])),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ProfileAvatar(image: profileImageName, size: 45),
              const SizedBox(
                height: 15,
              ),
              Text(name,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: context.appColors.font)),
            ]),
          );
        },
      );
    }
  }

  _initMyProfile() {
    final String accessToken = Get.find<AccessTokenData>().accessToken;
    Future<Map<String, dynamic>> response = dioApiGetMyProfile(accessToken);
    response.then((res) {
      int statusCode = res["statusCode"];
      if (statusCode == 200 && res["data"] != null) {
        Map<String, dynamic> profileData = res["data"];
        Get.find<MyProfileController>().setMyProfile(profileData["name"],
            profileData["profile_image_name"], profileData["phone_number"]);
        setState(() {
          isLoading = false;
        });
      } else if (statusCode == 401) {
        notification(context, "다시 로그인 해주세요");
      } else {
        Get.toNamed("/login");
        print("_getMyProfile() error: $statusCode");
      }
    });
  }
}
