import 'package:get/get.dart';

class FcmTokenController extends GetxController {
  String fcmToken = '';

  void setFcmToken(String fcmToken) {
    this.fcmToken = fcmToken;
    update();
  }
}
