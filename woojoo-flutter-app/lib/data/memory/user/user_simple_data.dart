import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/data/memory/user/dto_user_simple.dart';
import 'package:woojoo/data/memory/user/update_my_profile_request.dart';

import '../../remote/user/user_api.dart';

class UserSimpleData extends GetxController {
  final Rx<UserSimple> _myProfile = UserSimple().obs;

  UserApi userRepository = UserApi.instance;

  @override
  void onInit() async {
    getMyProfile();
    super.onInit();
  }

  Future<void> getMyProfile() async {
    UserSimple myProfile = await userRepository.getMyProfile();
    _myProfile(myProfile);
  }

  Future<void> updateMyProfile(UpdateMyProfileRequest request) async {
    String name = _myProfile.value.name;
    String? profileImageName = await userRepository.updateMyProfile(request);
    if (request.name.isNotEmptyAndNotNull) name = request.name!;
    if (request.file == null) profileImageName = null;
    _myProfile(_myProfile.value.copyWith(
      name: name,
      profileImageName: profileImageName,
    ));
  }

  UserSimple get myProfile => _myProfile.value;

  String? get profileImageName => _myProfile.value.profileImageName;
}

mixin class UserSimpleDataProvider {
  late final userSimpleData = Get.find<UserSimpleData>();
}
