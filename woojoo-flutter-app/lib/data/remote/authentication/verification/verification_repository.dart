import 'package:woojoo/data/memory/authentication/verification/dto_send_verification_code_request.dart';

import '../../../memory/authentication/verification/dto_verify_code_request.dart';

abstract interface class VerificationRepository {
  Future<int> sendVerificationCode(SendVerificationCodeRequest request);

  Future<int> verifyCode(VerifyCodeRequest request);
}
