import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/constants.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/widget/logo/w_logo_with_name.dart';
import 'package:woojoo/common/widget/w_height.dart';

import '../../common/widget/button/w_rounded_button.dart';
import 'login_input/s_login_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: context.appColors.loginScreenBackground,
                image: const DecorationImage(
                  image: AssetImage("$basePath/login/login_image.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Colors.transparent,
                    Colors.transparent,
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                  stops: [0.0, 0.1, 0.5, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
            child: const Align(
              alignment: Alignment.topLeft,
              child: LogoWithName(),
            ).pOnly(left: 10, top: 10),
          ),
          Positioned(
            left: 1,
            right: 1,
            bottom: 150,
            child: Column(
              children: [
                RoundedButton(
                  btnEnabled: true,
                  onPressed: goInputPhoneNumberScreen,
                  text: '로그인',
                ),
                height20,
                RoundedButton(
                  btnEnabled: true,
                  onPressed: goInputPhoneNumberScreen,
                  foregroundColor: context.appColors.text,
                  backgroundColor: context.appColors.loginScreenBackground,
                  text: '계정 만들기',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goInputPhoneNumberScreen() =>
      Get.to(() => const LoginInput(), transition: Transition.fade);
}
