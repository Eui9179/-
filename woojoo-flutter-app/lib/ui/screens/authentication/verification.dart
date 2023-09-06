import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/color_palette.dart';
import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/controller/fcm_token_controller.dart';
import 'package:woojoo/dio/auth/login.dart';
import 'package:woojoo/dio/auth/verify_sms_auth.dart';
import 'package:woojoo/main.dart';
import 'package:woojoo/ui/dynamic_widget/button/rounded_button.dart';
import 'package:woojoo/ui/layout/app_bar/logo_app_bar.dart';
import 'package:woojoo/utils/notification.dart';

import '../../../dio/auth/send_sms.dart';
import '../../dynamic_widget/font/font.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final String _phoneNumber = Get.arguments;

  _VerificationState({Key? key});

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
              const Font(text: "내 코드 입력", size: 35),
              const SizedBox(
                height: 5,
              ),
              Text("메시지 도착까지 최대 1분정도 소요됩니다.\n메시지가 도착하지 않을 경우 재실행 시켜주세요.",
                  style: TextStyle(
                    fontSize: 13,
                    color: context.appColors.subFont,
                  )),
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
                        Font(text: _phoneNumber, size: 20),
                        TextButton(
                          onPressed: () {
                            _resend();
                          },
                          child: const Text(
                            "재전송",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
        dioApiVerifySmsAuth(_phoneNumber, _smsCode);
    response.then((result) {
      int statusCode = result["statusCode"];
      if (statusCode == 200) {
        Future<Map<String, dynamic>> response =
            dioApiLogin(_phoneNumber, _fcmToken, _smsCode);
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
    Get.toNamed('auth/signup/step1', arguments: _phoneNumber);
  }

  _signin(String accessToken) async {
    storage.write(key: "accessToken", value: accessToken);
    Get.find<AccessTokenController>().setAccessToken(accessToken);
    Get.offAllNamed('/');
  }

  _resend() {
    _formKey.currentState!.save();
    Future<Map<String, dynamic>> response = dioApiSendSms(_phoneNumber);
    response.then((result) {
      int statusCode = result["statusCode"];
      if (statusCode == 200) {
        Get.toNamed('/auth/verification', arguments: _phoneNumber);
      } else {
        notification(context, "오류 발생");
      }
    });
  }
}
