import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/common/widget/w_height.dart';
import 'package:woojoo/screen/authentication/login_input/w_input_phone_number.dart';
import 'package:woojoo/screen/authentication/login_input/w_terms_description.dart';
import 'package:woojoo/screen/authentication/verification/s_verification.dart';
import 'package:woojoo/ui/layout/app_bar/logo_app_bar.dart';
import 'package:woojoo/utils/notification.dart';

import '../../../common/widget/w_rounded_button.dart';
import '../../../remote/authentication/verification/send_sms.dart';
import 'login_input_data.dart';

class LoginInput extends StatefulWidget {
  const LoginInput({Key? key}) : super(key: key);

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> with LoginInputDataProvider {
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
                      .color(context.appColors.font)
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
                          onPressed: verify,
                          text: "계속",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ).p16()));
  }

  verify() {
    print("verify");
    formKey.currentState!.save();
    Future<Map<String, dynamic>> response =
        dioApiSendSms(inputData.phoneNumber);
    response.then((result) {
      int statusCode = result["statusCode"];
      if (statusCode == 200) {
        Get.to(() => const VerificationScreen(), arguments: inputData.phoneNumber);
      } else {
        notification(context, "오류 발생");
      }
    });
  }
}
