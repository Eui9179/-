import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main/tab/home/w_group_text_button.dart';

/// TODO Refactoring
class UserGroupFrame extends StatelessWidget {
  const UserGroupFrame({Key? key, required this.userGroups}) : super(key: key);
  final List<dynamic> userGroups;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 13, bottom: 15, right: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemExtent: 28.0,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: userGroups.length,
              itemBuilder: (BuildContext context, int index) {
                return GroupTextButton(
                  text:
                      '${userGroups[index]['name']} ${userGroups[index]['detail1']}학년',
                  onTap: () {
                    Get.toNamed(
                      "/group/detail1?name=${userGroups[index]['name']}&detail1=${userGroups[index]['detail1']}",
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}
