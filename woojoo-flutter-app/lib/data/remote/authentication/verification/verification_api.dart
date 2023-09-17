import 'package:dio/dio.dart';
import 'package:woojoo/data/memory/authentication/verification/dto_send_verification_code_request.dart';
import 'package:woojoo/data/memory/authentication/verification/dto_verify_code_request.dart';

import '../../dio_instance.dart';
import 'verification_repository.dart';

class VerificationApi implements VerificationRepository {
  Dio dio = DioInstance().dio;

  VerificationApi._();

  static VerificationApi instance = VerificationApi._();

  @override
  Future<int> sendVerificationCode(SendVerificationCodeRequest request) async {
    final response =
        await dio.post('/sms-code', data: request.toJson());
    return response.statusCode ?? 500;
  }

  @override
  Future<int> verifyCode(VerifyCodeRequest request) async {
    Response response = await dio.post('/sms-auth', data: request.toJson());
    return response.statusCode ?? 500;
  }
}
