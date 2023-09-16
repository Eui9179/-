import 'package:dio/dio.dart';
import 'package:woojoo/remote/authentication/verification/VerificationRepository.dart';

import '../../dio_instance.dart';

class VerificationApi implements VerificationRepository {
  Dio dio = DioInstance().dio;

  VerificationApi._();

  static VerificationApi instance = VerificationApi._();

  @override
  Future<int?> sendSms(String phoneNumber) async {
    final response =
        await dio.post('/sms-code', data: {"phone_number": phoneNumber});
    return response.statusCode;
  }

  @override
  Future<int?> verifySmsCode(String phoneNumber, String smsCode) async {
    Response response = await dio.post('/sms-auth', data: {
      "phone_number": phoneNumber,
      "cp": smsCode,
    });
    return response.statusCode;
  }
}
