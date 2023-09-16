import 'package:dio/dio.dart';

import '../dio_instance.dart';

Future<Map<String, dynamic>> dioApiLogin(
    String phoneNumber, String fcmToken, String smsCode) async {
  Dio dio = DioInstance().dio;

  try {
    Response response = await dio.post('/auth/login', data: {
      "phone_number": phoneNumber,
      "fcm_token": fcmToken,
      "sms_code": smsCode
    });
    return {"statusCode": 200, "data": response.data["access_token"]};
  } on DioError catch (error) {
    print("dio login error code: ${error.response!.statusCode}");
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
  // return {"statusCode": 401, "data": "test"};
}
