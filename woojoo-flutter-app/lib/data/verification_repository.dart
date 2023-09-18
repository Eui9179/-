import 'package:woojoo/data/memory/authentication/verification/dto_phone_number_request.dart';

import 'memory/authentication/verification/dto_verification_code_request.dart';

abstract interface class VerificationRepository {
  Future<int> sendVerificationCode(PhoneNumberRequest request);

  Future<int> verifyCode(VerificationCodeRequest request);
}
