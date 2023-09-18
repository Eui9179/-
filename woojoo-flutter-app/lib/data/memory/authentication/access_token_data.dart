import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../main.dart';

class AccessTokenData extends GetxController {
  RxString rxAccessToken = ''.obs;

  void clear() {
    storage.delete(key: "accessToken");
    rxAccessToken = ''.obs;
  }

  bool isLogin() {
    return rxAccessToken.isNotEmpty;
  }

  String get accessToken => rxAccessToken.value;

  set accessToken(String accessToken) {
    rxAccessToken.value = accessToken;
    storage.write(key: "accessToken", value: accessToken);
  }

  Future<String> readAccessTokenSecureStorage() async {
    String readAccessToken =  await const FlutterSecureStorage().read(key: "accessToken") ?? '';
    accessToken = readAccessToken;
    return accessToken;
  }
}

mixin class AccessTokenDataProvider {
  late final accessTokenData = Get.find<AccessTokenData>();
}