import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/common/widget/w_text2.dart';
import 'package:woojoo/data/remote/api/friend/report_user.dart';
import 'package:woojoo/utils/notification.dart';

Future<String?> showReport(BuildContext context, int userId) async {
  List<bool> isCheckedList = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  _onPressed(List<bool> isCheckedList, int userId) {
    String accessToken = Get.find<AccessTokenData>().accessToken;
    String reportString = '';

    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i]) {
        reportString.isEmpty ? reportString += '$i' : reportString += '/$i';
      }
    }

    Future<dynamic> response = dioApiReportUser(accessToken, {
      'reportedUserId': userId,
      'reportNumbers': reportString,
    });

    int statusCode;
    response.then((res) {
      statusCode = res['statusCode'];
      if (statusCode == 200) {
        notification(context, '신고가 완료되었습니다.');
      } else {
        print(statusCode);
      }
    });
  }

  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            backgroundColor: context.appColors.mainBackgroundColor,
            contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            actionsAlignment: MainAxisAlignment.spaceAround,
            title: SizedBox(
              child: Text(
                '신고하기',
                style: TextStyle(color: context.appColors.text, fontSize: 23),
                textAlign: TextAlign.center,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isCheckedList[0],
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedList[0] = newValue!;
                        });
                      },
                      side: BorderSide(color: context.appColors.text),
                      checkColor: context.appColors.text,
                      activeColor: Colors.blueAccent,
                    ),
                    const Text2(text: '원치 않는 광고 또는 스펨', size: 17),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isCheckedList[1],
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedList[1] = newValue!;
                        });
                      },
                      side: BorderSide(color: context.appColors.text),
                      checkColor: context.appColors.text,
                      activeColor: Colors.blueAccent,
                    ),
                    const Text2(text: '희롱 또는 괴롭힘', size: 17),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isCheckedList[2],
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedList[2] = newValue!;
                        });
                      },
                      side: BorderSide(color: context.appColors.text),
                      checkColor: context.appColors.text,
                      activeColor: Colors.blueAccent,
                    ),
                    const Text2(text: '혐오 발언', size: 17),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isCheckedList[3],
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedList[3] = newValue!;
                        });
                      },
                      side: BorderSide(color: context.appColors.text),
                      checkColor: context.appColors.text,
                      activeColor: Colors.blueAccent,
                    ),
                    const Text2(text: '거짓 또는 사기', size: 17),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isCheckedList[4],
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedList[4] = newValue!;
                        });
                      },
                      side: BorderSide(color: context.appColors.text),
                      checkColor: context.appColors.text,
                      activeColor: Colors.blueAccent,
                    ),
                    const Text2(text: '불법', size: 17),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isCheckedList[5],
                      onChanged: (bool? newValue) {
                        setState(() {
                          isCheckedList[5] = newValue!;
                        });
                      },
                      side: BorderSide(color: context.appColors.text),
                      checkColor: context.appColors.text,
                      activeColor: Colors.blueAccent,
                    ),
                    const Text2(text: '타인 사칭', size: 17),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    '닫기',
                    style: TextStyle(color: context.appColors.text, fontSize: 20),
                  )),
              TextButton(
                  onPressed: () {
                    _onPressed(isCheckedList, userId);
                    Get.back();
                  },
                  child: const Text(
                    '완료',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                  )),
            ],
          );
        });
      });
}
