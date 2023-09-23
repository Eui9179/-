import 'package:get/get.dart';
import 'package:woojoo/data/memory/user/dto_user_simple.dart';

import '../../remote/user/user_api.dart';

class UserSimpleData extends GetxController {
  final Rx<UserSimple> _rxMyProfile = UserSimple().obs;

  UserApi userRepository = UserApi.instance;

  @override
  void onInit() async {
    getMyProfile();
    super.onInit();
  }

  Future<void> getMyProfile() async {
    UserSimple myProfile = await userRepository.getMyProfile();
    _rxMyProfile(myProfile);
  }

  UserSimple get myProfile => _rxMyProfile.value;

}

mixin class UserSimpleDataProvider {
  late final userSimpleData = Get.find<UserSimpleData>();
}
