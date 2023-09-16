import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/screen/authentication/s_login.dart';

import '../../../common/widget/w_height.dart';
import '../../../controller/access_token_controller.dart';
import '../../../controller/fcm_token_controller.dart';
import '../../../dio/auth/login.dart';
import '../../../dio/auth/send_sms.dart';
import '../../../dio/auth/verify_sms_auth.dart';
import '../../../main.dart';
import '../../../ui/dynamic_widget/button/rounded_button.dart';
import '../../../ui/dynamic_widget/font/font.dart';
import '../../../ui/layout/app_bar/logo_app_bar.dart';
import '../../../utils/notification.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final String phoneNumber = Get.arguments;

  _VerificationScreenState({Key? key});

  // final FirebaseAuth _auth = FirebaseAuth.instance; test
  final _formKey = GlobalKey<FormState>();

  String _verificationCode = "";
  String _smsCode = "";
  final String _fcmToken = Get.find<FcmTokenController>().fcmToken;
  bool btnEnabled = false;
  bool isDisposed = false;
  bool isVerification = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 25,
          color: Color.fromRGBO(255, 255, 255, 1.0),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Color.fromRGBO(168, 168, 168, 1.0), width: 3.0)),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: const Border(
          bottom:
              BorderSide(color: Color.fromRGBO(234, 239, 243, 1), width: 3.0)),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(),
    );

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
                    Container(
                      height: 100,
                      margin: const EdgeInsets.only(top: 30),
                      child: Pinput(
                        length: 6,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length != 6) {
                            return "코드를 확인해주세요";
                          }
                          return null;
                        },
                        onCompleted: (pin) {
                          setState(() {
                            _smsCode = pin;
                          });
                        },
                        onChanged: (val) {
                          val.length == 6
                              ? setState(() => btnEnabled = true)
                              : setState(() => btnEnabled = false);
                        },
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        autofocus: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        phoneNumber.text.size(FontSize.normal).color(context.appColors.font).make(),
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
                    const Height(20),
                    RoundedButton(
                        btnEnabled: btnEnabled,
                        onPressed: _onPressed,
                        text: "계속"),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _onPressed() async {
    Future<Map<String, dynamic>> response =
        dioApiVerifySmsAuth(phoneNumber, _smsCode);
    response.then((result) {
      int statusCode = result["statusCode"];
      if (statusCode == 200) {
        Future<Map<String, dynamic>> response =
            dioApiLogin(phoneNumber, _fcmToken, _smsCode);
        response.then((result) {
          int statusCode = result["statusCode"];
          if (statusCode == 200) {
            _signin(result["data"]);
          } else if (statusCode == 401) {
            _signup();
          }
        });
      } else if (statusCode == 403) {
        notification(context, "코드를 확인해주세요.");
      } else {
        notification(context, "잘못된 요청입니다.");
      }
    });
  }

  _signup() {
    Get.toNamed('auth/signup/step1', arguments: phoneNumber);
  }

  _signin(String accessToken) async {
    storage.write(key: "accessToken", value: accessToken);
    Get.find<AccessTokenController>().accessToken = accessToken;
    Get.offAllNamed('/');
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
}
