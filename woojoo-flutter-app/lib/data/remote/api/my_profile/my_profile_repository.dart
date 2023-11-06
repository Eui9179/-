import 'package:woojoo/data/dto/dto_fcm_request.dart';
import 'package:woojoo/data/dto/dto_user_simple.dart';
import 'package:woojoo/data/memory/my_profile/update_my_profile_request.dart';

abstract interface class MyProfileRepository {
  Future<UserSimple> getMyProfile();

  Future<void> syncFcm(FcmRequest request);

  Future<String?> updateMyProfile(UpdateMyProfileRequest request);
}
