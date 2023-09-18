import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/app.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/data/memory/authentication/authentication_data.dart';
import 'package:woojoo/data/memory/authentication/dto_login_request.dart';
import 'package:woojoo/data/memory/authentication/verification/dto_phone_number_request.dart';
import 'package:woojoo/data/memory/authentication/verification/dto_verification_code_request.dart';
import 'package:woojoo/screen/authentication/verification/w_verification_code_input.dart';

import '../../../common/widget/w_height.dart';
import '../../../common/widget/button/w_rounded_button.dart';
import '../../../data/controller/fcm_token_controller.dart';
import '../../../main.dart';
import '../../../common/appbar/logo_app_bar.dart';
import '../signup/s_step1_profile.dart';
import '../../../utils/notification.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with AuthenticationDataProvider {
  final String phoneNumber = Get.arguments;

  _VerificationScreenState();

  final _formKey = GlobalKey<FormState>();

  String verificationCode = "";
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
                        return _isValidate(value) ? null : '코드를 확인해주세요';
                      },
                      onCompleted: (pin) =>
                          setState(() => verificationCode = pin),
                      onChanged: (val) =>
                          setState(() => btnEnabled = _isValidate(val)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        phoneNumber.text
                            .size(FontSize.normal)
                            .color(context.appColors.font)
                            .make(),
                        TextButton(
                          onPressed: () => _resend(),
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
    final request = VerificationCodeRequest(
      phoneNumber: phoneNumber,
      cp: verificationCode,
    );
    verificationData.verifyCode(context, request, _decideNextPage);
  }

  _decideNextPage() {
    final request = LoginRequest(
      phoneNumber: phoneNumber,
      fcm: fcmToken,
      verificationCode: verificationCode,
    );
    authenticationData.login(request).then((response) {
      switch (response.statusCode) {
        case 200:
          Get.offAll(() => const App());
        default:
          Get.to(() => const Step1ProfileScreen(), arguments: phoneNumber);
      }
    });
  }

  bool _isValidate(String? value) =>
      value.isNotEmptyAndNotNull || value?.length == 6;

  _resend() {
    setState(() {
      verificationCode = "";
    });
    final request = PhoneNumberRequest(phoneNumber: phoneNumber);
    verificationData.sendVerificationCode(request).then((statusCode) {
      if (statusCode != 200) notification(context, "오류 발생");
    });
  }
}
