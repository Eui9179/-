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
  RxString rxFcm = ''.obs;
  RxString rxGroup = ''.obs;
  RxString rxDetail = ''.obs;

  String get fcm => rxFcm.value;

  String get group => rxGroup.value;

  String get detail => rxDetail.value;

  set fcm(String fcm) => rxFcm(fcm);

  set group(String fcm) => rxGroup(fcm);

  set detail(String fcm) => rxDetail(fcm);
}
