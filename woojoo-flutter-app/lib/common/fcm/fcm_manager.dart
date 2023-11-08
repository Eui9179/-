import 'package:firebase_messaging/firebase_messaging.dart';

class FcmManager {
  static String? token;

  static void requestPermission() {
    FirebaseMessaging.instance.requestPermission();
  }

  static void initialize() async {
    token = await FirebaseMessaging.instance.getToken();
  }
}
