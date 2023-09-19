import 'package:get/get.dart';
import 'package:woojoo/data/memory/user/dto_my_profile.dart';

import '../../remote/user/user_api.dart';

class UserSimpleData extends GetxController {
  Rx<MyProfile> rxMyProfile = MyProfile().obs;

  UserApi userRepository = UserApi.instance;

  @override
  void onInit() async {
    MyProfile myProfile = await userRepository.getMyProfile();
    rxMyProfile(myProfile);
    super.onInit();
  }

  MyProfile get myProfile => rxMyProfile.value;
}

mixin class UserSimpleDataProvider {
  late final userSimpleData = Get.find<UserSimpleData>();
}