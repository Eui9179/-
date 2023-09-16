import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/screen/authentication/verification/verification_data.dart';
import 'package:woojoo/screen/authentication/verification/w_verification_code_input.dart';

import '../../../common/widget/w_height.dart';
import '../../../common/widget/w_rounded_button.dart';
import '../../../controller/access_token_controller.dart';
import '../../../controller/fcm_token_controller.dart';
import '../../../main.dart';
import '../../../remote/authentication/login.dart';
import '../../../remote/authentication/verification/send_sms.dart';
import '../../../ui/layout/app_bar/logo_app_bar.dart';
import '../../../utils/notification.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with AccessTokenDataProvider, VerificationData {
  final String phoneNumber = Get.arguments;

  _VerificationScreenState();

  final _formKey = GlobalKey<FormState>();

  String smsCode = "";
  final String fcmToken = Get.find<FcmTokenController>().fcmToken;
  bool btnEnabled = false;
  bool isVerification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.appColors.mainBackgroundColor,
        appBar: const LogoAppBar(),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "내 코드 입력"
                  .text
                  .size(FontSize.title)
                  .color(context.appColors.font)
                  .make(),
              height5,
              "메시지 도착까지 최대 1분정도 소요됩니다.\n메시지가 도착하지 않을 경우 재실행 시켜주세요."
                  .text
                  .size(FontSize.description)
                  .color(context.appColors.subFont)
                  .make(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    VerificationCodeInput(
                      validator: (value) {
                        return isValidate(value) ? null : '코드를 확인해주세요';
                      },
                      onCompleted: (pin) => setState(() => smsCode = pin),
                      onChanged: (val) =>
                          setState(() => btnEnabled = isValidate(val)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        phoneNumber.text
                            .size(FontSize.normal)
                            .color(context.appColors.font)
                            .make(),
                        TextButton(
                          onPressed: () => resend(),
                          child: "재전송"
                              .text
                              .color(context.appColors.textButton)
                              .size(FontSize.normal)
                              .make(),
                        ),
                      ],
                    ),
                    height20,
                    RoundedButton(
                      btnEnabled: btnEnabled,
                      onPressed: onPressed,
                      text: "계속",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  onPressed() {
    verifySmsCode(phoneNumber, smsCode).then((statusCode) {
      switch (statusCode) {
        case 200:
          decideNextPage();
        case 403:
          notification(context, "코드를 확인해주세요.");
        default:
          notification(context, "잘못된 요청입니다.");
      }
    });
  }

  decideNextPage() {
    Future<Map<String, dynamic>> response =
        dioApiLogin(phoneNumber, fcmToken, smsCode);
    response.then((result) {
      int statusCode = result["statusCode"];
      if (statusCode == 200) {
        signin(result["data"]);
      } else if (statusCode == 401) {
        signup();
      }
    });
  }

  signup() {
    Get.toNamed('auth/signup/step1', arguments: phoneNumber);
  }

  signin(String accessToken) async {
    storage.write(key: "accessToken", value: accessToken).then((value) {
      accessTokenData.accessToken = accessToken;
      Get.offAllNamed('/');
    });
  }

  resend() {
    _formKey.currentState!.save();
    Future<Map<String, dynamic>> response = dioApiSendSms(phoneNumber);
    response.then((result) {
      int statusCode = result["statusCode"];
      if (statusCode == 200) {
        Get.toNamed('/auth/verification', arguments: phoneNumber);
      } else {
        notification(context, "오류 발생");
      }
    });
  }

  bool isValidate(String? value) =>
      value.isNotEmptyAndNotNull || value?.length == 6;
}
