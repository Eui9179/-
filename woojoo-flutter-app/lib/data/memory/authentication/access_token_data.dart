import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../main.dart';

abstract mixin class AccessTokenDataProvider {
  late final accessTokenData = Get.find<AccessTokenData>();
}

class AccessTokenData extends GetxController {
  RxString accessTokenObs = ''.obs;

  void clear() {
    storage.delete(key: "accessToken");
    accessTokenObs = ''.obs;
  }

  bool isLogin() {
    return accessTokenObs.isNotEmpty;
  }

  String get accessToken => accessTokenObs.value;

  set accessToken(String accessToken) {
    accessTokenObs.value = accessToken;
    storage.write(key: "accessToken", value: accessToken);
  }

  Future<String> readAccessTokenSecureStorage() async {
    String readAccessToken =  await const FlutterSecureStorage().read(key: "accessToken") ?? '';
    accessToken = readAccessToken;
    return accessToken;
  }
}
