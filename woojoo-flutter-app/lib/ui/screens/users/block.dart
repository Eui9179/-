import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/controller/my_friends_controller.dart';
import 'package:woojoo/dio/friend/block_user.dart';
import 'package:woojoo/utils/color_palette.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<String?> showBlockDialog(BuildContext context, int userId) async {
  blockUserHandler() {
    String accessToken = Get.find<AccessTokenController>().accessToken;
    Future<dynamic> response = dioApiBlockUser(accessToken, userId);
    response.then((res) {
      int statusCode = res['statusCode'];
      if (statusCode == 200) {
        List<dynamic> originalFriends =
            Get.find<MyFriendsController>().myFriends;
        for (int i = 0; i < originalFriends.length; i++) {
          if (originalFriends[i]['id'] == userId) {
            originalFriends.removeAt(i);
            break;
          }
        }
        Get.find<MyFriendsController>().setMyFriends([...originalFriends]);
        notification(context, '차단했습니다.');
      } else if (statusCode == 409) {
        notification(context, '이미 차단했습니다.');
      } else {
        print(statusCode);
      }
    });
  }

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: ColorPalette.mainBackgroundColor,
          contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          actionsAlignment: MainAxisAlignment.spaceAround,
          title: SizedBox(
            height: 85,
            child: Column(
              children: const [
                Text(
                  '차단하기',
                  style: TextStyle(color: ColorPalette.font, fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '차단하면 차단한 친구의 모든 정보를\n확인할 수 없으며, 친구목록에서 삭제됩니다.',
                  style: TextStyle(color: ColorPalette.subFont, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  '취소',
                  style: TextStyle(color: ColorPalette.font, fontSize: 20),
                )),
            TextButton(
                onPressed: () {
                  blockUserHandler();
                  Get.back();
                },
                child: const Text(
                  '완료',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                )),
          ],
        );
      });
}
