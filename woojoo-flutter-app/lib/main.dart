// import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:woojoo/app.dart';
import 'package:woojoo/data/memory/authentication/access_token_data.dart';
import 'package:woojoo/pages.dart';
import 'package:woojoo/screen/authentication/s_login.dart';
import 'package:woojoo/common/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:woojoo/screen/main/s_main.dart';

import 'data/controller/fcm_token_controller.dart';
import 'data/controller/my_friends_controller.dart';
import 'data/controller/my_games_controller.dart';
import 'data/controller/my_groups_controller.dart';
import 'data/controller/my_profile_controller.dart';
import 'data/controller/todays_game_controller.dart';
// import 'firebase_options.dart';

const storage = FlutterSecureStorage();
// Future<void> _messageHandler(RemoteMessage message) async {
//   print('background message ${message.notification!.body}');
// }

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: const ColorPalette().headerBackgroundColor,
  ));
  final ensureInitialized = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: ensureInitialized);

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
      home: const App(),
      initialRoute: '/',
      getPages: pages,
    );
  }
}
