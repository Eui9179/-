import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../main/tab/home/w_group_text_button.dart';

class UserGroupFrame extends StatelessWidget {
  const UserGroupFrame({Key? key, required this.userGroups}) : super(key: key);
  final List<dynamic> userGroups;

  @override
  Widget build(BuildContext context) {
    return GroupTextButton(
      text: '${userGroups[0]['name']} ${userGroups[0]['detail1']}학년',
      onTap: () => Get.toNamed(
        "/group/detail1?name=${userGroups[0]['name']}&detail1=${userGroups[0]['detail1']}",
      ),
    ).pOnly(left: 13, right: 13, bottom: 15);
  }
}
