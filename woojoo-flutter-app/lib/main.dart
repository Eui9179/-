// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:woojoo/controller/access_token_controller.dart';
import 'package:woojoo/controller/fcm_token_controller.dart';
import 'package:woojoo/controller/my_games_controller.dart';
import 'package:woojoo/controller/my_groups_controller.dart';
import 'package:woojoo/controller/my_profile_controller.dart';
import 'package:woojoo/controller/todays_game_controller.dart';
import 'package:woojoo/pages.dart';
import 'package:woojoo/ui/screens/main_loading_screen.dart';
import 'package:woojoo/utils/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'controller/my_friends_controller.dart';
// import 'firebase_options.dart';

const storage = FlutterSecureStorage();
Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorPalette.headerBackgroundColor,
  ));
  WidgetsFlutterBinding.ensureInitialized();
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
    Get.put(AccessTokenController());
    Get.put(MyFriendsController());
    Get.put(MyProfileController());
    Get.put(MyGroupsController());
    Get.put(MyGamesController());
    Get.put(TodaysGameController());
    Get.put(FcmTokenController());

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

    // FirebaseMessaging.instance.getToken().then((token) {
    //   print(token);
    //   Get.find<FcmTokenController>().setFcmToken(token!);
    // });

    Future<String?> res = _getAccessToken();
    res.then((accessToken) {
      if (accessToken != null) {
        Get.offAllNamed('/home');
      } else {
        Get.offAllNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MainLoadingScreen();
  }

  Future<String?> _getAccessToken() async {
    String? accessToken = await storage.read(key: "accessToken");
    if (accessToken != null) {
      Get.find<AccessTokenController>().setAccessToken(accessToken);
    }
    return accessToken;
  }
}
