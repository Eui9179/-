import 'package:woojoo/data/dto/dto_phone_number_request.dart';
import 'package:woojoo/data/dto/dto_verification_code_request.dart';

abstract interface class VerificationRepository {
  Future<int> sendVerificationCode(PhoneNumberRequest request);

  Future<int> verifyCode(VerificationCodeRequest request);
}
