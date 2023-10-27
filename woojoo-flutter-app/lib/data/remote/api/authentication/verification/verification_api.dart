import 'package:dio/dio.dart';
import 'package:woojoo/data/dto/dto_phone_number_request.dart';
import 'package:woojoo/data/dto/dto_verification_code_request.dart';
import 'package:woojoo/data/remote/dio/dio_instance.dart';

import 'verification_repository.dart';

class VerificationApi implements VerificationRepository {
  Dio dio = DioClient.dio;

  VerificationApi._();

  static VerificationApi instance = VerificationApi._();

  @override
  Future<int> sendVerificationCode(PhoneNumberRequest request) async {
    final response =
        await dio.post('/sms-code', data: request.toJson());
    return response.statusCode ?? 500;
  }

  @override
  Future<int> verifyCode(VerificationCodeRequest request) async {
    Response response = await dio.post('/sms-auth', data: request.toJson());
    return response.statusCode ?? 500;
  }
}
