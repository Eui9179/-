import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/data/memory/authentication/authentication_data.dart';
import 'package:woojoo/data/memory/authentication/dto_signup_request.dart';
import 'package:woojoo/ui/dynamic_widget/font/font.dart';
import 'package:woojoo/ui/layout/app_bar/text_app_bar.dart';

import '../../../../common/widget/w_rounded_button.dart';

class Step2TOS extends StatefulWidget {
  const Step2TOS({Key? key}) : super(key: key);

  @override
  State<Step2TOS> createState() => _Step2TOSState();
}

class _Step2TOSState extends State<Step2TOS> with AuthenticationDataProvider {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.mainBackgroundColor,
      appBar: const TextAppBar(title: "약관 동의"),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: _onTapTOSLaunch,
                    child: const Font(text: "이용 약관 동의", size: 20)),
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.white),
                  child: Checkbox(
                      value: _isChecked1,
                      checkColor: Colors.white,
                      activeColor: Colors.blueAccent,
                      onChanged: (val) {
                        setState(() {
                          _isChecked1 = val!;
                        });
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: _onTapTOSLaunch,
                    child: const Font(text: "데이터 정책 동의", size: 20)),
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.white),
                  child: Checkbox(
                      value: _isChecked2,
                      checkColor: Colors.white,
                      activeColor: Colors.blueAccent,
                      onChanged: (val) {
                        setState(() {
                          _isChecked2 = val!;
                        });
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: _onTapTOSLaunch,
                    child: const Font(text: "개인정보 수집 동의", size: 20)),
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.white),
                  child: Checkbox(
                      value: _isChecked3,
                      checkColor: Colors.white,
                      activeColor: Colors.blueAccent,
                      onChanged: (val) {
                        setState(() {
                          _isChecked3 = val!;
                        });
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: _onTapTOSLaunch,
                    child: const Font(text: "쿠키 약관 동의", size: 20)),
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.white),
                  child: Checkbox(
                      value: _isChecked4,
                      checkColor: Colors.white,
                      activeColor: Colors.blueAccent,
                      onChanged: (val) {
                        setState(() {
                          _isChecked4 = val!;
                        });
                      }),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedButton(
              btnEnabled:
                  (_isChecked1 && _isChecked2 && _isChecked3 && _isChecked4),
              onPressed: _onPressed,
              text: "다음",
            )
          ],
        ),
      ),
    );
  }

  _onPressed() {
    final request = SignupRequest(data: Get.arguments);
    authenticationData.signup(request);
    // Future<Map<String, dynamic>> response = dioApiSignup(Get.arguments);
    // response.then((res) {
    //   int statusCode = res["statusCode"];
    //   if (statusCode == 200) {
    //     String accessToken = res["data"];
    //     storage.write(key: "accessToken", value: accessToken);
    //     Get.find<AccessTokenData>().accessToken = accessToken;
        Get.offAllNamed('/setting/games?type=signup');
      // }
    // });
  }

  void _onTapTOSLaunch() => launchUrl(Uri.parse(''));
}
