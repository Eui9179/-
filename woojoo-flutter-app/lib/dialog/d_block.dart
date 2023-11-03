import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/friend/friend_simple_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<String?> showBlockDialog(BuildContext context, int userId) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          backgroundColor: context.appColors.mainBackgroundColor,
          contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          actionsAlignment: MainAxisAlignment.spaceAround,
          title: SizedBox(
            height: 85,
            child: Column(
              children: [
                Text(
                  '차단하기',
                  style: TextStyle(color: context.appColors.text, fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  '차단하면 차단한 친구의 모든 정보를\n확인할 수 없으며, 친구목록에서 삭제됩니다.',
                  style:
                      TextStyle(color: context.appColors.subText, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  '취소',
                  style: TextStyle(color: context.appColors.text, fontSize: 20),
                )),
            TextButton(
                onPressed: () => _onPressed(userId),
                child: const Text(
                  '완료',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                )),
          ],
        );
      });
}

void _onPressed(userId) {
  Get.find<FriendSimpleData>().blockUser(userId);
  Get.back();
}
