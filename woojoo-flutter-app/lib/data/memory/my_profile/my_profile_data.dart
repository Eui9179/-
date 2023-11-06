import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/data/dto/dto_user_simple.dart';
import 'package:woojoo/data/remote/api/my_profile/my_profile_repository.dart';

import 'update_my_profile_request.dart';

class MyProfileData extends GetxController {
  final Rx<UserSimple> _myProfile = UserSimple().obs;

  final myProfileRepository = getIt.get<MyProfileRepository>();

  @override
  void onInit() async {
    getMyProfile();
    super.onInit();
  }

  Future<void> getMyProfile() async {
    UserSimple myProfile = await myProfileRepository.getMyProfile();
    _myProfile(myProfile);
  }

  Future<void> updateMyProfile(UpdateMyProfileRequest request) async {
    String name = _myProfile.value.name;
    String? profileImageName = await myProfileRepository.updateMyProfile(request);
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
  late final userSimpleData = Get.find<MyProfileData>();
}
