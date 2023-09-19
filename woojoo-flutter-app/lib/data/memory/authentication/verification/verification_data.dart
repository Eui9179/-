import 'package:flutter/cupertino.dart';
import 'package:woojoo/data/memory/authentication/verification/dto_phone_number_request.dart';
import 'package:woojoo/data/memory/authentication/verification/dto_verification_code_request.dart';

import '../../../../utils/notification.dart';
import '../../../remote/authentication/verification/verification_api.dart';

class VerificationData {
  final verificationRepository = VerificationApi.instance;

  Future<int> sendVerificationCode(PhoneNumberRequest request) {
    return verificationRepository.sendVerificationCode(request);
  }

  void verifyCode(BuildContext context, VerificationCodeRequest request, Function() function) {
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