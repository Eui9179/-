import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/common/widget/w_height.dart';
import 'package:woojoo/data/memory/authentication/authentication_data.dart';
import 'package:woojoo/data/memory/authentication/verification/dto_phone_number_request.dart';
import 'package:woojoo/screen/authentication/login_input/w_input_phone_number.dart';
import 'package:woojoo/screen/authentication/login_input/w_terms_description.dart';
import 'package:woojoo/screen/authentication/verification/s_verification.dart';
import 'package:woojoo/common/appbar/logo_app_bar.dart';
import 'package:woojoo/utils/notification.dart';

import '../../../common/widget/button/w_rounded_button.dart';
import '../../../data/memory/authentication/login_input_data.dart';

class LoginInput extends StatefulWidget {
  const LoginInput({Key? key}) : super(key: key);

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput>
    with LoginInputDataProvider, AuthenticationDataProvider {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(LoginInputData());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginInput>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.appColors.mainBackgroundColor,
        appBar: const LogoAppBar(),
        body: Obx(() => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  '전화번호 입력'
                      .text
                      .size(FontSize.title)
                      .color(context.appColors.text)
                      .make(),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const InputPhoneNumber(),
                        const TermsDescription(),
                        const Height(50),
                        RoundedButton(
                          btnEnabled: inputData.buttonActive,
                          onPressed: sendVerificationCode,
                          text: "계속",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ).p16()));
  }

  sendVerificationCode() {
    formKey.currentState!.save();
    final request = PhoneNumberRequest(
      phoneNumber: inputData.phoneNumber,
    );
    verificationData.sendVerificationCode(request).then((statusCode) {
      switch (statusCode) {
        case 200:
          Get.to(
            () => const VerificationScreen(),
            arguments: inputData.phoneNumber,
          );
        default:
          notification(context, "오류 발생");
      }
    });
  }
}
