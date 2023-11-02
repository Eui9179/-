import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/data/dto/dto_group.dart';

import '../main/tab/home/w_group_text_button.dart';

class UserGroupFrame extends StatelessWidget {
  const UserGroupFrame({Key? key, required this.group}) : super(key: key);
  final Group group;

  @override
  Widget build(BuildContext context) {
    return GroupTextButton(
      text: '${group.name} ${group.detail1}학년',
      onTap: () => Get.toNamed(
        "/group/detail1?name=${group.name}&detail1=${group.detail1}",
      ),
    ).pOnly(left: 13, right: 13, bottom: 15);
  }
}
