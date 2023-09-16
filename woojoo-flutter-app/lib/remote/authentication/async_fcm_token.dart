import 'package:dio/dio.dart';

import '../dio_instance.dart';

Future<Map<String, dynamic>> dioApiAsyncFcmToken(
    String accessToken, String fcmToken) async {
  Dio dio = DioInstance(accessToken: accessToken).dio;

  try {
    await dio.post('/auth/async-token', data: {"fcm_token": fcmToken});
    return {"statusCode": 200};
  } on DioError catch (error) {
    print("dio login error code: ${error.response!.statusCode}");
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
