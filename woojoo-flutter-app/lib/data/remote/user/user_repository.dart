import 'package:woojoo/data/memory/user/dto_fcm_request.dart';

import '../../memory/user/dto_user_simple.dart';
import '../../memory/user/update_my_profile_request.dart';

abstract interface class UserRepository {
  Future<UserSimple> getMyProfile();
  Future<void> syncFcm(FcmRequest request);
  Future<String?> updateMyProfile(UpdateMyProfileRequest request);
}