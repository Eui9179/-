import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../data/memory/group/group_data.dart';
import 'w_group_text_button.dart';

class HomeGroupFrame extends StatefulWidget {
  const HomeGroupFrame({Key? key}) : super(key: key);

  @override
  State<HomeGroupFrame> createState() => _HomeGroupFrameState();
}

class _HomeGroupFrameState extends State<HomeGroupFrame>
    with GroupDataProvider {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GroupTextButton(
        text: '${groupData.myGroup.name} ${groupData.myGroup.detail1}학년',
        onTap: onTap,
      ).pOnly(left: 13, right: 13, bottom: 15),
    );
  }

  onTap() {
    Get.toNamed(
      "/group/detail1?name=${groupData.myGroup.name}&detail1=${groupData.myGroup.detail1}",
    );
  }
}
