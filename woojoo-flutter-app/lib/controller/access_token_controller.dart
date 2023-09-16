import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

abstract mixin class AccessTokenDataProvider {
  late final accessTokenData = Get.find<AccessTokenController>();
}

class AccessTokenController extends GetxController {
  RxString accessTokenObs = ''.obs;

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

  Future<String> readAccessTokenSecureStorage() async {
    return await const FlutterSecureStorage().read(key: "accessToken") ?? '';
  }
}
