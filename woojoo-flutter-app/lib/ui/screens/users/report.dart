import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/dio/friend/report_user.dart';
import 'package:woojoo/ui/dynamic_widget/font/font.dart';
import 'package:woojoo/utils/color_palette.dart';
import 'package:woojoo/utils/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    String accessToken = Get.find<AccessTokenController>().accessToken;
    String reportString = '';

    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i]) {
        reportString.isEmpty ? reportString += '$i' : reportString += '/$i';
      }
    }

    Future<dynamic> response = dioApiReportUser(accessToken, {
      'reported_user_id': userId,
      'report_numbers': reportString,
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
            backgroundColor: ColorPalette.mainBackgroundColor,
            contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20),
            actionsAlignment: MainAxisAlignment.spaceAround,
            title: const SizedBox(
              child: Text(
                '신고하기',
                style: TextStyle(color: ColorPalette.font, fontSize: 23),
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
                      side: const BorderSide(color: ColorPalette.font),
                      checkColor: ColorPalette.font,
                      activeColor: Colors.blueAccent,
                    ),
                    const Font(text: '원치 않는 광고 또는 스펨', size: 17),
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
                      side: const BorderSide(color: ColorPalette.font),
                      checkColor: ColorPalette.font,
                      activeColor: Colors.blueAccent,
                    ),
                    const Font(text: '희롱 또는 괴롭힘', size: 17),
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
                      side: const BorderSide(color: ColorPalette.font),
                      checkColor: ColorPalette.font,
                      activeColor: Colors.blueAccent,
                    ),
                    const Font(text: '혐오 발언', size: 17),
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
                      side: const BorderSide(color: ColorPalette.font),
                      checkColor: ColorPalette.font,
                      activeColor: Colors.blueAccent,
                    ),
                    const Font(text: '거짓 또는 사기', size: 17),
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
                      side: const BorderSide(color: ColorPalette.font),
                      checkColor: ColorPalette.font,
                      activeColor: Colors.blueAccent,
                    ),
                    const Font(text: '불법', size: 17),
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
                      side: const BorderSide(color: ColorPalette.font),
                      checkColor: ColorPalette.font,
                      activeColor: Colors.blueAccent,
                    ),
                    const Font(text: '타인 사칭', size: 17),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    '닫기',
                    style: TextStyle(color: ColorPalette.font, fontSize: 20),
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
