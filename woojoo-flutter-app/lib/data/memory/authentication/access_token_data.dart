import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../main.dart';

class AccessTokenData extends GetxController {
  RxString _accessToken = ''.obs;

  void clear() {
    storage.delete(key: "accessToken");
    _accessToken = ''.obs;
  }

  bool isLogin() {
    return _accessToken.isNotEmpty;
  }

  String get accessToken => _accessToken.value;

  set accessToken(String accessToken) {
    _accessToken.value = accessToken;
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