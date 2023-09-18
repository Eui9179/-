import 'package:get/get.dart';
import 'package:woojoo/data/memory/user/user_simple_data.dart';

/**
 *     userRepository.syncFcm(request).then((statusCode) {
    if (statusCode != 200) {
    log('syncFcm error code: $statusCode');
    }
    });
 */

abstract mixin class UserDataProvider {
  late final userData = Get.find<UserData>();
}

class UserData extends UserSimpleData {
  RxString fcmRx = ''.obs;
  RxString groupRx = ''.obs;
  RxString detailRx = ''.obs;

  String get fcm => fcmRx.value;

  String get group => groupRx.value;

  String get detail => detailRx.value;

  set fcm(String fcm) => fcmRx(fcm);

  set group(String fcm) => groupRx(fcm);

  set detail(String fcm) => detailRx(fcm);
}
