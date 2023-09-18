import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../main.dart';

abstract mixin class AccessTokenDataProvider {
  late final accessTokenData = Get.find<AccessTokenData>();
}

class AccessTokenData extends GetxController {
  RxString accessTokenRx = ''.obs;

  void clear() {
    storage.delete(key: "accessToken");
    accessTokenRx = ''.obs;
  }

  bool isLogin() {
    return accessTokenRx.isNotEmpty;
  }

  String get accessToken => accessTokenRx.value;

  set accessToken(String accessToken) {
    accessTokenRx.value = accessToken;
    storage.write(key: "accessToken", value: accessToken);
  }

  Future<String> readAccessTokenSecureStorage() async {
    String readAccessToken =  await const FlutterSecureStorage().read(key: "accessToken") ?? '';
    accessToken = readAccessToken;
    return accessToken;
  }
}
