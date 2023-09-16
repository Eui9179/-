import 'package:dio/dio.dart';

import '../../dio_instance.dart';


Future<Map<String, dynamic>> dioApiSendSms(String phoneNumber) async {
  Dio dio = DioInstance().dio;

  try {
    await dio.post(
      '/sms-code',
      data: {"phone_number": phoneNumber},
    );
    return {"statusCode": 200};
  } on DioError catch (error) {
    return {"statusCode": error.response!.statusCode};
  }
}
