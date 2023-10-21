import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/context_extension.dart';
import 'package:woojoo/common/theme/font_size.dart';
import 'package:woojoo/common/widget/w_height.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/data/memory/authentication/authentication_data.dart';
import 'package:woojoo/data/memory/game/game_data.dart';
import 'package:woojoo/data/memory/setting/setting_data.dart';
import 'package:woojoo/main.dart';
import 'package:woojoo/screen/main/tab/setting/w_profile_image_picker.dart';
import 'package:woojoo/screen/main/tab/setting/w_setting_group_detail_input.dart';
import 'package:woojoo/screen/main/tab/setting/w_setting_group_input.dart';
import 'package:woojoo/screen/main/tab/setting/w_setting_name_input.dart';
import 'package:woojoo/utils/notification.dart';

import '../../../../../data/controller/my_friends_controller.dart';
import 'd_withdrawal_check.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with AuthenticationDataProvider, SettingDataProvider {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.put(SettingData());
    _typeAheadController.text = settingData.groupName;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: context.appColors.mainBackgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: context.appColors.headerBackgroundColor,
          title: '설정'.text.size(FontSize.appBarTitle).make(),
          actions: [
            TextButton(
              onPressed: _onUpdateProfile,
              child: settingData.rxIsLoading.value
                  ? '완료'
                      .text
                      .color(context.appColors.subText)
                      .size(FontSize.appBarTextButton)
                      .make()
                  : '완료'
                      .text
                      .color(context.appColors.textButton)
                      .size(FontSize.appBarTextButton)
                      .make(),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImagePicker(settingData: settingData),
                  height20,
                  SettingNameInput(settingData: settingData),
                  SettingGroupInput(
                    settingData: settingData,
                    typeAheadController: _typeAheadController,
                  ),
                  SettingGroupDetailInput(settingData: settingData),
                  const Height(60),
                  TextButton(
                    onPressed: _onLogout,
                    child: '로그아웃'
                        .text
                        .color(context.appColors.textButton)
                        .size(FontSize.settingTextButton)
                        .fontWeight(FontWeight.w400)
                        .make(),
                  ),
                  TextButton(
                    onPressed: () => launchUrl(
                        Uri.parse("https://discord.gg/MTyBVZ72S9"),
                        mode: LaunchMode.externalApplication),
                    child: '커뮤니티'
                        .text
                        .color(context.appColors.textButton)
                        .size(FontSize.settingTextButton)
                        .fontWeight(FontWeight.w400)
                        .make(),
                  ),
                  TextButton(
                    onPressed: () => showWithdrawalCheck(
                      context,
                      onPressed: _onWithdrawal,
                    ),
                    child: '회원탈퇴'
                        .text
                        .color(context.appColors.subText)
                        .size(FontSize.normal)
                        .fontWeight(FontWeight.w300)
                        .make(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onUpdateProfile() async {
    settingData.isLoading = true;
    if (settingData.isName && settingData.isGroup) {
      _formKey.currentState!.save();
      await settingData.updateSettingData();
    } else if (!settingData.isName) {
      notification(context, '이름을 입력해주세요');
    } else if (!settingData.isGroup) {
      notification(context, '소속을 입력해주세요');
    }
  }

  _onLogout() {
    storage.delete(key: "accessToken");
    Get.offAllNamed('/login');
  }

  _onWithdrawal() {
    authenticationData.withdrawal().then((statusCode) {
      if (statusCode == 200) {
        clearGetXController();
        Get.offAllNamed('/');
      } else {
        notification(context, '죄송합니다. 다시 실행시켜주세요[$statusCode]');
      }
    });
  }

  void clearGetXController() {
    Get.find<AccessTokenData>().clear();
    Get.find<MyFriendsController>().clear();
    Get.find<GameData>().clear();
  }
}
