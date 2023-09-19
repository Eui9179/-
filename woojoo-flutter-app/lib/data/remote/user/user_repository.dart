import 'package:woojoo/data/memory/user/dto_fcm_request.dart';

import '../../memory/user/dto_user_simple.dart';

abstract interface class UserRepository {
  Future<UserSimple> getMyProfile();
  Future<void> syncFcm(FcmRequest request);
}