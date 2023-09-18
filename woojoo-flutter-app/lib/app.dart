import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:woojoo/screen/authentication/s_login.dart';
import 'package:woojoo/screen/main/s_main.dart';
import 'package:woojoo/screen/main_loading_screen.dart';

import 'data/controller/fcm_token_controller.dart';
import 'data/controller/my_friends_controller.dart';
import 'data/controller/my_games_controller.dart';
import 'data/controller/my_groups_controller.dart';
import 'data/controller/my_profile_controller.dart';
import 'data/controller/todays_game_controller.dart';
import 'data/memory/authentication/access_token_data.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with AccessTokenDataProvider, AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
    _initGetXController();

    // FirebaseMessaging.instance.getToken().then((token) {
    //   print(token);
    //   Get.find<FcmTokenController>().setFcmToken(token!);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const MainLoadingScreen();
  }

  void _initGetXController() {
    Get.put(AccessTokenData());
    Get.put(MyFriendsController());
    Get.put(MyProfileController());
    Get.put(MyGroupsController());
    Get.put(MyGamesController());
    Get.put(TodaysGameController());
    Get.put(FcmTokenController());
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    String accessToken = await accessTokenData.readAccessTokenSecureStorage();
    FlutterNativeSplash.remove();
    if (accessToken.isEmpty) {
      Get.offAll(() => const LoginScreen(), transition: Transition.noTransition);
      return;
    }
    Get.offAll(() => const MainScreen(), transition: Transition.noTransition);
  }
}