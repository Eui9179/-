import 'package:woojoo/data/memory/user/dto_fcm_request.dart';

import '../../memory/user/dto_my_profile.dart';

abstract interface class UserRepository {
  Future<MyProfile> getMyProfile();
  Future<void> syncFcm(FcmRequest request);
}