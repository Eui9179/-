import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';

Future<String?> showWithdrawalCheck(
  BuildContext context, {
  required VoidCallback onPressed,
}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: context.appColors.mainBackgroundColor,
          contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          actionsAlignment: MainAxisAlignment.spaceAround,
          title: SizedBox(
            height: 100,
            child: Column(
              children: [
                Text(
                  '회원 탈퇴',
                  style: TextStyle(color: context.appColors.text, fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '회원탈퇴시 저장되어 있는 \n모든 데이터가 삭제됩니다',
                  style:
                      TextStyle(color: context.appColors.subText, fontSize: 15),
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
                child: Text(
                  '취소',
                  style: TextStyle(color: context.appColors.text, fontSize: 20),
                )),
            TextButton(
                onPressed: onPressed,
                child: const Text(
                  '완료',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                )),
          ],
        );
      });
}
