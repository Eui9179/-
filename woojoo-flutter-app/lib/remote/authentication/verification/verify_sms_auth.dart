import 'package:dio/dio.dart';

import '../../dio_instance.dart';

Future<Map<String, dynamic>> dioApiVerifySmsAuth(
    String phoneNumber, String smsCode) async {
  Dio dio = DioInstance().dio;

  try {
    Response response = await dio
        .post('/sms-auth', data: {"phone_number": phoneNumber, "cp": smsCode});
    return {"statusCode": 200};
  } on DioError catch (error) {
    print("dio login error code: ${error.response!.statusCode}");
    return {"statusCode": error.response!.statusCode};
  } finally {
    dio.close();
  }
}
