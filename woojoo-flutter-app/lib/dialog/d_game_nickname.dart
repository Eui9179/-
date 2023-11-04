import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/utils/woojoo_games.dart';

Future<String?> showUpdateGameNicknameDialog(
  BuildContext context,
  String gameName,
  TextEditingController controller,
  VoidCallback onPressed,
) async {
  final enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: Color.fromARGB(0, 52, 52, 71),
      width: 2,
    ),
  );
  final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: Color.fromARGB(0, 52, 52, 71),
      width: 2,
    ),
  );

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        )),
        backgroundColor: context.appColors.mainBackgroundColor,
        contentPadding: const EdgeInsets.only(
          top: 10,
          right: 20,
          left: 20,
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        title: SizedBox(
          height: 80,
          child: Column(
            children: [
              Text(
                changeKorGameName(gameName),
                style: TextStyle(
                  color: context.appColors.text,
                  fontSize: 23,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                '친구들이 볼 수 있게 닉네임을 입력해주세요',
                style: TextStyle(
                  color: context.appColors.subText,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        content: SizedBox(
          height: 65,
          child: TextField(
            maxLength: 20,
            cursorColor: context.appColors.text,
            autofocus: true,
            controller: controller,
            style: TextStyle(fontSize: 19.0, color: context.appColors.text),
            decoration: InputDecoration(
              filled: true,
              fillColor: context.appColors.dialogFill,
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              counterStyle: TextStyle(color: context.appColors.subText),
            ),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Get.back(),
              child: Text(
                '취소',
                style: TextStyle(
                  color: context.appColors.text,
                  fontSize: 20,
                ),
              )),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                onPressed();
              }
              Get.back();
            },
            child: const Text(
              '완료',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
              ),
            ),
          ),
        ],
      );
    },
  );
}
