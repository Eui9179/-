import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/setting/setting_data.dart';

import '../../../../common/widget/avatar/w_profile_avatar.dart';

class ProfileImagePicker extends StatelessWidget {
  final SettingData settingData;

  const ProfileImagePicker({super.key, required this.settingData});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () async {
          await settingData.getImageFromGallery();
        },
        child: Stack(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.black54,
              child: settingData.image == null
                  ? ProfileAvatar(
                      image: settingData.originImageName,
                      size: 55,
                    )
                  : CircleAvatar(
                      radius: 55,
                      backgroundImage: Image.file(
                        File(settingData.image!.path),
                        fit: BoxFit.cover,
                      ).image,
                    ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: context.appColors.textButton,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: context.appColors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
