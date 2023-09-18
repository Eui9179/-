import 'package:get/get.dart';
import 'package:woojoo/data/memory/user/dto_my_profile.dart';

import '../../remote/user_api.dart';

abstract mixin class UserSimpleDataProvider {
  late final userSimpleData = Get.find<UserSimpleData>();
}

class UserSimpleData extends GetxController {
  RxString nameRx = ''.obs;
  RxnString profileImageNameRxn = RxnString('');

  UserApi userRepository = UserApi.instance;

  Future<MyProfile> getMyProfile() async {
    return userRepository.getMyProfile();
  }

  void setMyProfile(MyProfile myProfile) {
    name = myProfile.name;
    profileImageName = myProfile.profileImageName;
  }

  String get name => nameRx.value;

  String? get profileImageName => profileImageNameRxn.value;

  set name(String name) => nameRx(name);

  set profileImageName(String? profileImageName) =>
      profileImageNameRxn(profileImageName);
}
