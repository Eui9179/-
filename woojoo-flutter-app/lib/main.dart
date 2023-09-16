// import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/controller/fcm_token_controller.dart';
import 'package:woojoo/controller/my_games_controller.dart';
import 'package:woojoo/controller/my_groups_controller.dart';
import 'package:woojoo/controller/my_profile_controller.dart';
import 'package:woojoo/controller/todays_game_controller.dart';
import 'package:woojoo/pages.dart';
import 'package:woojoo/screen/authentication/s_login.dart';
import 'package:woojoo/ui/screens/home/home.dart';
import 'package:woojoo/common/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'controller/my_friends_controller.dart';
// import 'firebase_options.dart';

const storage = FlutterSecureStorage();
// Future<void> _messageHandler(RemoteMessage message) async {
//   print('background message ${message.notification!.body}');
// }

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: const ColorPalette().headerBackgroundColor,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: ensureInitialized);

  // await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseMessaging.onBackgroundMessage(_messageHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
      initialRoute: '/',
      getPages: pages,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _initGetXController();
    _initAccessToken();
    FlutterNativeSplash.remove();

    // FirebaseMessaging.instance.getToken().then((token) {
    //   print(token);
    //   Get.find<FcmTokenController>().setFcmToken(token!);
    // });
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = Get.find<AccessTokenController>().isLogin();
    if (isLogin) {
      return const MainHome();
    } else {
      return const LoginScreen();
    }
  }

  void _initAccessToken() async {
    AccessTokenController controller = Get.find<AccessTokenController>();
    String accessToken = await controller.readAccessTokenSecureStorage();
    controller.accessToken = accessToken;
  }

  void _initGetXController() {
    Get.put(AccessTokenController());
    Get.put(MyFriendsController());
    Get.put(MyProfileController());
    Get.put(MyGroupsController());
    Get.put(MyGamesController());
    Get.put(TodaysGameController());
    Get.put(FcmTokenController());
  }
}
