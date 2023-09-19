import 'package:get/get.dart';
import 'package:woojoo/data/memory/friend/dto_friend_simple.dart';
import 'package:woojoo/data/memory/user/dto_user_simple.dart';

import '../../remote/user/user_api.dart';

class UserSimpleData extends GetxController {
  Rx<UserSimple> rxMyProfile = UserSimple().obs;
  RxList<FriendSimple> rxMyFriends = <FriendSimple>[].obs;

  UserApi userRepository = UserApi.instance;

  @override
  void onInit() async {
    getMyProfile();
    super.onInit();
  }

  Future<void> getMyProfile() async {
    UserSimple myProfile = await userRepository.getMyProfile();
    rxMyProfile(myProfile);
  }

  UserSimple get myProfile => rxMyProfile.value;

}

mixin class UserSimpleDataProvider {
  late final userSimpleData = Get.find<UserSimpleData>();
}
