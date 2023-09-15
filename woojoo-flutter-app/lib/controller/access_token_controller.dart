import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AccessTokenController extends GetxController {
  RxString accessTokenObs = ''.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void clear() {
    accessTokenObs.value = '';
  }

  bool isLogin() {
    return accessTokenObs.isNotEmpty;
  }

  String get accessToken => accessTokenObs.value;

  set accessToken(String accessToken) {
    accessTokenObs.value = accessToken;
  }
}
