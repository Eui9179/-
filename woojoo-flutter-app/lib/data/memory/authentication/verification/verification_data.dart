import 'package:flutter/cupertino.dart';
import 'package:woojoo/common/get_it/get_it.dart';
import 'package:woojoo/data/dto/dto_phone_number_request.dart';
import 'package:woojoo/data/dto/dto_verification_code_request.dart';
import 'package:woojoo/data/remote/api/authentication/verification/verification_repository.dart';
import 'package:woojoo/utils/notification.dart';

class VerificationData {
  final verificationRepository = getIt.get<VerificationRepository>();

  Future<int> sendVerificationCode(PhoneNumberRequest request) {
    return verificationRepository.sendVerificationCode(request);
  }

  void verifyCode(BuildContext context, VerificationCodeRequest request,
      Function() function) {
    verificationRepository.verifyCode(request).then((statusCode) {
      switch (statusCode) {
        case 200:
          function();
        case 403:
          notification(context, "코드를 확인해주세요.");
        default:
          notification(context, "잘못된 요청입니다.");
      }
    });
  }
}
