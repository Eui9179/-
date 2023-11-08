import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:woojoo/common/fcm/fcm_manager.dart';
import 'package:woojoo/screen/authentication/s_login.dart';
import 'package:woojoo/screen/main/s_main.dart';
import 'package:woojoo/screen/main_loading_screen.dart';

import 'data/controller/my_friends_controller.dart';
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
    FcmManager.requestPermission();
    FcmManager.initialize();
    _initGetXController();
  }

  @override
  Widget build(BuildContext context) {
    return const MainLoadingScreen();
  }

  void _initGetXController() {
    Get.put(AccessTokenData());
    Get.put(MyFriendsController());
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    String accessToken = await accessTokenData.readAccessTokenSecureStorage();
    if (accessToken.isEmpty) {
      FlutterNativeSplash.remove();
      Get.offAll(() => const LoginScreen(), transition: Transition.noTransition);
    } else {
      Get.offAll(() => const MainScreen(), transition: Transition.noTransition);
    }
  }
}